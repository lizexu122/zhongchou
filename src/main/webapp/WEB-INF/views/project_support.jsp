<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>support</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <link rel="stylesheet" href="${ctp}/css/support.css">
    <link rel="stylesheet" href="${ctp}/css/project_show.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="grzxOuterBox">
    <div id="zhifuInnerBox">
        <h3 style="padding-top: 40px;padding-left: 20px;margin-bottom: 30px">请选择支持的项目</h3>
        <div class="tjdd_list">
            <div class="tjdd_item animate-reward" id="sad" style="display: block;">

                <div class="ng-scope">
                    <div class="wyzz_h3">感谢您的支持</div>
                    <p class="support_inforP">感谢您的支持，您将会收到我们的信或者卡片</p>
                    <div class="wyzz_Cont">
                        <div class="wyzz_inputBox sitePHBox">
                            <form action="/doAddOrder" id="formOrder" enctype="multipart/form-data">
                                <label>$</label>
                                <input type="text" name="project" value="${data.id}"
                                       style="display: none"/>
                                <input type="text" name="user" value="${sessionScope.user.id}" style="display: none"/>
                                <input type="text" id="qianshu" name="amount" class="wyzz_input sitePHInput"
                                       maxlength="8">
                                <span class="placeholder"
                                      style="line-height: 20px; padding-top: 6px; left: 54.9861px; top: 0.999974px;"></span>
                            </form>
                        </div>
                        <a class="supportVal_A btn_ALink animate-fade" style="display: block;" id="ccm" onclick="lm()">立即支持</a>
                    </div>
                </div>
            </div>
            <div class="tjddCont  ng-scope" id="fax" style="display: none">
                <div class="tjdd_QHCont">
                    <div class="wszc_QHBox ng-scope">
                        <div class="tjdd_formItem clearfix">
                            <div class="tjddQHFGBox sitePHBox">
                                        <span>
                                            <input type="text"
                                                   class="tjdd_QHInput sitePHInput w440 ng-pristine ng-valid"
                                                   placeholder="手机号（选填，发起人可通过此信息联系你）">
                                       </span>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="shdzForm_xnBox">
                            <p class="zj_valP ng-scope">
                                支付<span><b>$</b><input class="ng-binding" id="qiana"/></span>
                            </p>
                            <input type="button" class="tjdd_submitBtn" value="提交订单" onclick="zhichi()">
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="footer">
        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        $("#ccm").click(function () {
            $("#fax").slideToggle("slow");
        });
    });

    function lm() {
        var aa = document.getElementById("qianshu").value;
        document.getElementById("qiana").value = aa;
    }

    function cz() {
        var bb = document.getElementsByClassName("post1")[0].value;
        var cc = document.getElementsByClassName("ordernum")[0].value;
        document.getElementsByClassName("qian")[0].value = bb * cc;

    }

    $(document).ready(function () {
        $(".cx").click(function () {
            $(".jl").slideToggle("slow");
            $("#sad").slideToggle("slow");
        });
    });


    function zhichi() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${ctp}/doAddOrder",
            data: $('#formOrder').serialize(),
            success: function (result) {
                if (result.flag == 1) {
                    window.location.href = "${ctp}/personCenter/personOrder";
                } else {
                    layer.msg(result.msg);
                }

            }
        });
    }

    $(document).ready(function () {
        $.ajax({
            type: 'Get',
            async: true,
            url: '${ctp}/doGetAddress',
            dataType: 'json',
            data: null,
            success: (function (result) {
                var flag = parseInt(result.flag);
                var msg = result.msg;
                var data = result.data;
                console.log(data);
                if (flag == 1) {
                    if (data.length > 0) {
                        $(".addr").append("<option value=''>please choose address</option>");
                        for (var i = 0; i < data.length; i++) {
                            $(".addr").append("<option value='" + data[i].id + "'>" + data[i].zone + data[i].detail + "</option>");
                        }
                    }
                }
                else if (flag == 0) {
                    alert(msg);
                }
            })
        })
    })

    $.ajax({
        type: "get",
        async: false,
        url: "${ctp}/doGetBacks-${data.id}",
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                var d = result.data;
                console.log(d);
                for (var i = 0; i < d.length; i++) {
                    console.log(d[i].project.id);
                    if (d[i].compensation == 0) {
                        var poststr = "";
                        var contents = "";
                        if (d[i].post == 0) {
                            poststr = "虚拟回报";
                        } else {
                            poststr = "实物回报";
                        }

                        $(".tjdd_list").append("  <div class=\"tjdd_item animate-reward\" style=\"display: block; z-index: 999\" class=\"fd\">\n" +
                            "                <!-- 无私支持 -->\n" +
                            "                <!-- ngIf: reward.itemType == 2 -->\n" +
                            "\n" +
                            "                <!-- 普通支持项目 -->\n" +
                            "                <div id=\"putong\">\n" +
                            "                    <!-- ngIf: !pay.selectedItem -->\n" +
                            "                    <div class=\"supportABox ng-scope\">\n" +
                            "                        <a href=\"javascript:;\" class=\"supportVal_A btn_ALink animate-fade cx\"  >支持</a>\n" +
                            "                    </div><!-- end ngIf: !pay.selectedItem -->\n" +
                            "                  \n" +
                            "\n" +
                            "                    \n" +
                            "                    <h3 class=\"support_h3 ng-binding\" id=\"op\">please choose the return amount</h3>"
                            +
                            "<input type='text' class=\"post1\" readonly value='" + d[i].amount + "'/> " +
                            "\n" +
                            "                    <div class=\"support_title ng-binding\">Letters of thanks</div>\n" +
                            "                    <p class=\"support_inforP ng-binding\">We will send you an electrionic letters of thanks</p>\n" +
                            "                    <div class=\"supportFooter\">\n" +
                            "                        <div class=\"supportFLeft\">\n" +
                            "                            <p>\n" +
                            "                                Distribution mode：<b class=\"ng-scope\"> </b>\n" +
                            "<input type='text' class=\"post\" readonly value='" + poststr + "'/> " +
                            "                            </p><p>\n" +
                            "                            Custom mode：<b  class=\"ng-scope\" ></b>\n" +
                            "<input type='text' class=\"content\" readonly value='" + d[i].content + "'/> " +
                            "                            </p>\n" +
                            "\n" +
                            "\n" +
                            "                        </div>\n" +
                            "                        <div class=\"supportFRight\">\n" +
                            "                            <!-- ngRepeat: imgSrc in reward.imageUrls track by $index -->\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "                <div class=\"tjddCont  ng-scope jl\"  style=\"display: none\">\n" +
                            "                   " +
                            "                    <div class=\"tjdd_QHCont\">\n" +
                            "                        <!-- 请验证手机号，使用账号登录 begin -->\n" +
                            "                        <!-- ngIf: pay.selectedItem.itemType!=2 &&(!pay.logined) -->\n" +
                            "                        <!-- 请验证手机号，使用账号登录 end -->\n" +
                            "                        <!-- 无私支持 begin -->\n" +
                            "                        <!-- ngIf: pay.selectedItem.itemType==2 -->\n" +
                            "                        <!-- 无私支持 end -->\n" +
                            "                        <!-- 实物回报 begin -->\n" +
                            "                        <div>\n" +
                            "                            <!-- ngIf: pay.selectedItem.itemType != 2 -->\n" +
                            "                            <div class=\"ng-scope\">\n" +
                            "                                <!-- ngIf: pay.logined -->\n" +
                            "                                <div class=\"NumBox ng-scope\">\n" +
                            "                                    <span>Copies</span>\n" +
                            "\n" +
                            "                                    <div class=\"NumInner\" id=\"num-input\">\n" +
                            "                                        <input  type=\"text\" max=\"100\" value='1' onkeyup='cz()'   target=\"num-input\" validate=\"num_valid\"\n" +
                            "                                             class=\"ng-isolate-scope ng-pristine ng-valid ordernum\">\n" +
                            "                                    </div>\n" +
                            "\n" +
                            "                                    <label class=\"error ng-binding\" id=\"num-error\"></label>\n" +
                            "                                </div><!-- end ngIf: pay.logined -->\n" +
                            "\n" +
                            "                                <!-- ngIf: pay.logined -->\n" +
                            "                                <div class=\"ng-scope\">\n" +
                            "                                    <!-- ngIf: ((pay.selectedItem.return_type == 1 || pay.selectedItem.return_type == 0 || pay.selectedItem.return_type == 4) || (pay.selectedItem.return_type == 2 && (pay.selectedItem.extra_need.user_name || pay.selectedItem.extra_need.mobile || pay.selectedItem.extra_need.email))) -->\n" +
                            "                                    <div class=\"shxx_h3 ng-scope\"\n" +
                            "                                         ng-if=\"((pay.selectedItem.return_type == 1 || pay.selectedItem.return_type == 0 || pay.selectedItem.return_type == 4) || (pay.selectedItem.return_type == 2 &amp;&amp; (pay.selectedItem.extra_need.user_name || pay.selectedItem.extra_need.mobile || pay.selectedItem.extra_need.email)))\">\n" +
                            "                                        收货信息\n" +
                            "                                    </div>\n" +
                            "                                    <!-- end ngIf: ((pay.selectedItem.return_type == 1 || pay.selectedItem.return_type == 0 || pay.selectedItem.return_type == 4) || (pay.selectedItem.return_type == 2 && (pay.selectedItem.extra_need.user_name || pay.selectedItem.extra_need.mobile || pay.selectedItem.extra_need.email))) -->\n" +
                            "                                    <!-- ngIf: (pay.selectedItem.return_type == 1 || pay.selectedItem.return_type == 0 || pay.selectedItem.return_type == 4) -->\n" +
                            "                                    <!-- ngIf: (pay.selectedItem.return_type == 1 || pay.selectedItem.return_type == 0 || pay.selectedItem.return_type == 4) && (address.show || addressList.length == 0) -->\n" +
                            "                                </div><!-- end ngIf: pay.logined -->\n" +
                            "                            </div><!-- end ngIf: pay.selectedItem.itemType != 2 -->\n" +
                            "                            <!-- END 收货信息 -->\n" +
                            "\n" +
                            "\n" +
                            "                            <div class=\"shdzForm_xnBox\">\n" +
                            "           <form action='/doAddOrder' class='addorder'>\n" +
                            "                  <input type='text' name='user' value='${sessionScope.user.id}' style='display:none'/> " +
                            "                   <input type='text' name='project' style='display:none' value='" + d[i].project.id + "'/> " +
                            "                   <input type='text' name='project_back' style='display:none' value='" + d[i].id + "'/> " +
                            "      \n" +
                            "                                <!-- 虚拟回报 -->\n" +
                            "                                <!-- ngIf: pay.selectedItem.return_type==2 && pay.logined -->\n" +
                            "                                <div class=\"ng-scope\">\n" +
                            "                                    <!-- ngIf: pay.selectedItem.extra_need.user_name -->\n" +
                            "                                    <div class=\"tjdd_formItem ng-scope\">\n" +
                            "                                        <div class=\"tjddQHFGBox sitePHBox\">\n" +
                            "                                    \n" +
                            "                                        <input  required=\"\" type=\"text\"\n" +
                            "                                               class=\"tjdd_QHInput sitePHInput w440 ng-isolate-scope ng-pristine ng-invalid ng-invalid-required\"\n" +
                            "                                               placeholder='username'>\n" +
                            "                                  \n" +
                            "                                         \n" +
                            "                                        </div>\n" +
                            "                                    </div><!-- end ngIf: pay.selectedItem.extra_need.user_name -->\n" +
                            "                                    <!-- ngIf: pay.selectedItem.extra_need.mobile -->\n" +
                            "                                    <!-- ngIf: pay.selectedItem.extra_need.email -->\n" +
                            "                                    <div class=\"tjdd_formItem ng-scope\">\n" +
                            "                                        <div class=\"tjddQHFGBox sitePHBox\">\n" +
                            "                                \n" +
                            "                                    <input validation=\"\" required=\"\" valid_type=\"email\" label=\"email\" type=\"text\"\n" +
                            "                                           class=\"tjdd_QHInput sitePHInput w440 ng-isolate-scope ng-pristine ng-invalid ng-invalid-required\"\n" +
                            "                                           ng-model=\"pay.extras.email\" placeholder='email'>\n" +
                            "                              \n" +
                            "                               \n" +
                            "\n" +
                            "                                        </div>\n" +
                            "                                    </div><!-- end ngIf: pay.selectedItem.extra_need.email -->\n" +
                            "                                </div><!-- end ngIf: pay.selectedItem.return_type==2 && pay.logined -->\n" +
                            "                                <!-- END 虚拟回报 -->\n" +
                            "                                <!-- ngIf: pay.selectedItem.itemType != 2 && pay.logined -->\n" +
                            "                                <div class=\"tjdd_formItem ng-scope\" style=\"margin-top:20px;\">\n" +
                            "                                    <div class=\"tjddQHFGBox sitePHBox\" holder=\"\">\n" +
                            "                           \n" +
                            "                             <select class='addr' name='address'></select>\n" +
                            "                           \n" +
                            "                               \n" +
                            "                                    </div>\n" +
                            "                                </div><!-- end ngIf: pay.selectedItem.itemType != 2 && pay.logined -->\n" +
                            "                                <!-- ngIf: pay.logined || pay.selectedItem.itemType == 2 --><p class=\"zj_valP ng-scope\">\n" +
                            "                                pay<span><b>$</b><span class=\"ng-binding\"><input class=\"ng-binding qian\" name=\"amount\" /></span>\n" +
                            "                            </p><!-- end ngIf: pay.logined || pay.selectedItem.itemType == 2 -->\n" +
                            "\n" +
                            "                                <!-- ngIf: (pay.logined || pay.selectedItem.itemType == 2) --><input type=\"button\"\n" +
                            "                                                                              onclick=\"zhic()\"              value=\"place order\"\n" +
                            "                                                                                                     class=\"tjdd_submitBtn\"/>\n" +
                            "                                <!-- end ngIf: (pay.logined || pay.selectedItem.itemType == 2) -->\n" +
                            "                               </form>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                        <!-- 实物回报 end -->\n" +
                            "                    </div>\n" +
                            "                    <!-- 切换后排版 end -->\n" +
                            "                </div>\n" +
                            "\n" +
                            "            </div>");
                    }
                }
            } else {
                layer.msg("拿不到数据");
            }
        }
    });

    $.ajax({
        type: "get",
        async: false,
        url: "${ctp}/doGetBacks-${data.id}",
        success: function (result) {
            if (result.flag == 1) {
                console.log(result.flag);
                var d = result.data;
                console.log(d);
                for (var i = 0; i < d.length; i++) {
                    if (d[i].compensation == 1) {
                        console.log(d[i].id);
                        $("#formOrder").append("<input class='it' name='project_back' style='display:none' value='" + d[i].id + "'>");
                    }
                }
            }
        }
    });

    window.onload = cz();

    function zhic() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${ctp}/doAddOrder",//url
            data: $('.addorder').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.flag == 1) {
                    window.location.href = "${ctp}/personCenter/personOrder"
                } else {
                    layer.msg(result.msg);
                }

            }
        });
    }
</script>
</html>
