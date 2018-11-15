<%--
  Created by IntelliJ IDEA.
  User: 26942
  Date: 2018/6/6
  Time: 0:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户评论页</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <style type="text/css">
        #customer {
            position: relative;
            top: 120px;
            border-collapse: collapse;
            border: 1px solid #E1E6EB;
            border-left-width: 1px;
            border-left-style: solid;
            border-left-color: rgb(225, 230, 235);
            border-left: none;
            width: 65%;
        }

        #wrap {
            width: 90%;
            margin-right: auto;
            margin-left: auto;
            height: 100%;
            overflow: hidden;
        }

        .tab-menu {
            background-color: ivory;
        }

        .tab-menu ul li {
            /*background-color: darkgreen;*/
            display: inline-block;
        }

        .tab-menu ul li a {
            display: block;
            padding: 5px;
            text-decoration: none;
        }

        #customerI th {
            padding-right: 30px;
        }

        .tab-selected {
            border-radius: 4px;
            /*border:solid 2px #1f7eaa;*/
            background-color: #618aff;
            color: white;
        }

        #cmot {
            margin-top: 150px;
            position: relative;
            left: -250px;
        }

        .tab-menu {
            position: relative;
            top: 170px;
            left: -350px;
        }

        #sa {
            position: relative;
            top: 30px;
        }

        #tou {
            position: relative;
            top: 20px;
        }

        #create {
            width: 30%;
        }

        #customer tr td {
            text-align: center;
            line-height: 30px;
            font-size: 13px;
            border-bottom: 1px solid #E1E6EB;
            border-left: 1px solid #E1E6EB;

        }
        #customerI {
            position: relative;
            top: 120px;
            border-collapse: collapse;
            border: 1px solid #E1E6EB;
            border-left-width: 1px;
            border-left-style: solid;
            border-left-color: rgb(225, 230, 235);
            border-left: none;
            width: 65%;
        }

        #customerI tr td {
            text-align: center;
            line-height: 30px;
            font-size: 13px;
            border-bottom: 1px solid #E1E6EB;
            border-left: 1px solid #E1E6EB;

        }

    </style>
</head>
<body class="personal">

<div class="wrap" id="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="head_portrait l">
        <img id="tou" src="${sessionScope.user.avatar}" alt="">
    </div>
    <div class="nickname l" id="sa">
        <p>
            username
            <span style="font-size: 14px;color: gray;">
                            <i>
                            <c:if test="${sessionScope.user.status==1}">Certified</c:if>
                            <c:if test="${sessionScope.user.status==0}">Uncertified</c:if>
                            <c:if test="${sessionScope.user.status==-1}">Blacklist User</c:if>
                            </i>
                        </span>
        </p>
        <span>mobile &nbsp; : &nbsp; ${sessionScope.user.mobile}</span>
    </div>
    <div class="common_title fix">
        <span class="l" id="cmot">Comment</span>
        <a href="#" class="complete r"></a>
    </div>
    <div class="tab-menu">
        <ul>
            <li><a class="tab-selected" href="#" onclick="yyq()">GetOwnerComment</a></li>
            <li><a href="#" onclick="shou()">GetReceiveComment</a></li>
        </ul>

    </div>
    <div id="owner">
        <table id="customer" >

        </table>
    </div>
    <div id="receive" style="display: none">
        <table id="customerI">

        </table>

    </div>


</div>
<script>
    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "${ctp}/doGetOwnerComment",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                console.log(d);
                $("#customer").append('<th>content</th><th id=\'create\'>createTime</th><th>from_user_id</th><th>to_user_id</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#customer tr").length <= d.length) {
                        if (d[i].toUser == null) {
                            d[i].toUser = new Object();
                            d[i].toUser.id = "";
                        }
                        $("#customer").append(
                            "<tr>" +
                            "<td>" + d[i]["content"] + "</td>" +
                            "<td >" + d[i]["createTime"] + "</td>" +
                            "<td>" + d[i].fromUser.id + "</td>" +
                            "<td>" + d[i].toUser.id + "</td>" +
                            +"</tr>");

                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });
    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "${ctp}/doGetReceiveComment",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                console.log(d);
                $("#customerI").append('<th>content</th><th>createTime</th><th>from_user_id</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#customerI tr").length <= d.length) {
                        $("#customerI").append(
                            "<tr>" +
                            "<td>" + d[i]["content"] + "</td>" +
                            "<td>" + d[i]["createTime"] + "</td>" +
                            "<td>" + d[i].fromUser.id + "</td>" +
                            +"</tr>");

                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });
    $(function () {
        var li_a = $(".tab-menu ul li a");
        li_a.click(function () {
            $(this).addClass("tab-selected");
            $(this).parent().siblings().children().removeClass("tab-selected");
            var index = li_a.index(this);
            $(".tab-box > div").eq(index).show().siblings().hide();
        });
    })
    function shou() {
        document.getElementById("owner").style.display='none';
        document.getElementById("receive").style.display='block';
    }
    function yyq() {
        document.getElementById("owner").style.display='block';
        document.getElementById("receive").style.display='none';
    }

</script>

</body>
</html>
