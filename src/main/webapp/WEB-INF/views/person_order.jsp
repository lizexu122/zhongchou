<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人选项</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
</head>
<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="common minheight800">
           <p>订单</p>
            <div class="tab-menu">
                <ul>
                    <li><a class="tab-selected" href="javascript:void(0);">所有选项</a></li>
                </ul>
            </div>
            <div class="tab-box">
                <div id="tab1">

                </div>
                <div id="tab2" class="tab-hide"></div>
                <div id="tab3" class="tab-hide"></div>
                <div id="tab4" class="tab-hide"></div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">


        $(document).ready(function () {
            getUserOrders();

        });

        $(function () {

            var li_a = $(".tab-menu ul li a");
            li_a.click(function () {
                $(this).addClass("tab-selected");
                $(this).parent().siblings().children().removeClass("tab-selected");
                var index = li_a.index(this);
                $(".tab-box > div").eq(index).show().siblings().hide();
            });
        });

        function getUserOrders() {
            $.ajax({
                type: "get",
                async: false,
                //数据的传送页面：要启动界面的地址/界面的后台的方法
                url: "${ctp}/doGetOrder",
                // contentType:false,
                //重要的后台的回调函数（很重要）
                success: function (result) {
                    console.log(result.data);
                    if (result.flag == 1) {
                        console.log(result.flag);
                        var data = result.data;
                        console.log(data);
                        $("#tab1").empty();
                        for (var i = 0; i < data.length; i++) {
                            var str = "";
                            var status = "";
                            switch (data[i].status) {
                                case 0:
                                    status += "进行中";
                                    break;
                                case -1:
                                    status += "撤回";
                                    break;
                            }

                            str +=
                                "<div>" +
                                    "<div class=\"order_number\">" +
                                        "<div class=\"order_number_left l\">订单ID:" + data[i].id + "</div>" +
                                        "<div class=\"order_number_right r\">" + "<span>" + status + "</span>" + "</div>" +
                                    "</div>" +
                                    "<div class=\"project_order_content fix\">" +
                                        "<div class=\"project_order_content_img l\">" + "<object class='order_showImg' data='" + data[i].project.cover+ "'/>" + "</div>" +
                                        "<div class=\"project_order_content_info l\">" +
                                            "<a href='/financing/personCenter/personOrder/detail-" + data[i].id + "' class='el'>" + data[i].project.title + "</a>" +
                                            "<p>创建时间:" + data[i].createTime + "</p>"+
                                            "<p>总计:<em>$" + data[i].amount + "</em></p>";


                            if(data[i].status == 0){
                                str+="<a href='javascript:void(0);' class='w_customer' onclick=\"withdraw('" + data[i].id + "')\">撤销</a>"
                            }else{
                                str+="";
                            }

                            str+= "</div>" + "</div>" +"<div style='clear: both'></div>"+ "</div>";
                            $("#tab1").append(str);

                        }

                        $("#tab2").empty();
                        for (var i = 0; i < data.length; i++) {

                            if (data[i].status != 0) {
                                continue;
                            }
                            var str = "";
                            var status = "";
                            switch (data[i].status) {
                                case 0:
                                    status += "进行中";
                                    break;
                                case -1:
                                    status += "已取消";
                                    break;

                            }
                            str +=
                                "<div>" +
                                "<div class=\"order_number\">" +
                                "<div class=\"order_number_left l\">订单ID:" + data[i].id + "</div>" +
                                "<div class=\"order_number_right r\">" + "<span>" + status + "</span>" + "</div>" +
                                "</div>" +
                                "<div class=\"project_order_content fix\">" +
                                "<div class=\"project_order_content_img l\">" + "<object class='order_showImg' data='" + data[i].project.cover + "'/>" + "</div>" +
                                "<div class=\"project_order_content_info l\">" +
                                "<a href='/financing/personCenter/personOrder/detail-" + data[i].id + "' class='el'>" + data[i].project.title + "</a>" +
                                "<p>创建时间:"+data[i].createTime+"</p>"+
                                "<p>总计:<em>$" + data[i].amount + "</em></p>";


                            if(data[i].status==0){
                                str+="<a href='javascript:void(0);' class='w_customer' onclick=\"withdraw('" + data[i].id + "')\">撤销</a>"
                            }else{
                                str+="";
                            }

                            str+= "</div>" + "</div>" +"<div style='clear: both'></div>"+ "</div>";

                            $("#tab2").append(str);

                        }

                        $("#tab3").empty();
                        for (var i = 0; i < data.length; i++) {

                            if (data[i].status != -1) {
                                continue;
                            }
                            var str = "";
                            var status = "";
                            switch (data[i].status) {
                                case 0:
                                    status += "进行中";
                                    break;
                                case -1:
                                    status += "已取消";
                                    break;

                            }
                            str +=
                                "<div>" +
                                "<div class=\"order_number\">" +
                                "<div class=\"order_number_left l\">订单ID:" + data[i].id + "</div>" +
                                "<div class=\"order_number_right r\">" + "<span>" + status + "</span>" + "</div>" +
                                "</div>" +
                                "<div class=\"project_order_content fix\">" +
                                "<div class=\"project_order_content_img l\">" + "<object class='order_showImg' data='" + data[i].project + "'/>" + "</div>" +
                                "<div class=\"project_order_content_info l\">" +
                                "<a href='/financing/personCenter/personOrder/detail-" + data[i].id + "' class='el'>" + data[i].project.title + "</a>" +
                                "<p>创建时间:"+data[i].createTime+"</p>"+
                                "<p>总计:<em>$" + data[i].amount + "</em></p>";


                            if(data[i].status == 0){
                                str+="<a href='javascript:void(0);' class='w_customer' onclick=\"withdraw('" + data[i].id + "')\">撤销</a>"
                            }else{
                                str+="";
                            }

                            str+= "</div>" + "</div>" +"<div style='clear: both'></div>"+ "</div>";
                            $("#tab3").append(str);

                        }

                        $("#tab4").empty();
                        for (var i = 0; i < data.length; i++) {

                            if (data[i].status != -2) {
                                continue;
                            }
                            var str = "";
                            var status = "";
                            switch (data[i].status) {
                                case 0:
                                    status += "进行中";
                                    break;
                                case -1:
                                    status += "已取消";
                                    break;
                            }
                            str +=
                                "<div>" +
                                "<div class=\"order_number\">" +
                                "<div class=\"order_number_left l\">OrderID:" + data[i].id + "</div>" +
                                "<div class=\"order_number_right r\">" + "<span>" + status + "</span>" + "</div>" +
                                "</div>" +
                                "<div class=\"project_order_content fix\">" +
                                "<div class=\"project_order_content_img l\">" + "<object class='order_showImg' data='" + data[i].project.cover + "'/>" + "</div>" +
                                "<div class=\"project_order_content_info l\">" +
                                "<a href='/financing/personCenter/personOrder/detail-" + data[i].id + "' class='el'>" + data[i].project.title + "</a>" +
                                "<p>创建时间:"+data[i].createTime+"</p>"+
                                "<p>总计:<em>$" + data[i].amount + "</em></p>";


                            if(data[i].status == 0){
                                str+="<a href='javascript:void(0);' class='w_customer' onclick=\"withdraw('" + data[i].id + "')\">撤销</a>"
                            }else{
                                str+="";
                            }

                            str+= "</div>" + "</div>" +"<div style='clear: both'></div>"+ "</div>";
                            $("#tab4").append(str);

                        }

                    } else {
                        layer.msg("error");
                    }
                }
            });
        }

        function withdraw(id) {
            $.ajax({
                type: "get",
                async: false,
                //数据的传送页面：要启动界面的地址/界面的后台的方法
                url: "${ctp}/doCancelOrder-" + id,
                // contentType:false,
                //重要的后台的回调函数（很重要）
                success: function (result) {
                    if (result.flag == 1) {
                        layer.msg("success");
                    }
                }
            })

            getUserOrders();
        }

    </script>

</body>
</html>
