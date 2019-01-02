<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/user.js"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <title>- 个人中心 -</title>
    <style type="text/css">
        .nickname.l {
            border: 3px solid #f4f4f4;
            border-radius: 50%;
            width: 200px;
            height: 180px;
            position: relative;
            top: 250px;
        }
        #ju {
            position: relative;
            width: 100px;
            height: 100px;
            left: -500px;
        }
        #tpi {
            position: relative;
            left: -500px;
        }
    </style>
</head>

<body class="personal" >
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="personal_info fix">
            <div class="personal_info_left l">
                <div class="user_info fix" id="fx" >
                    <form id="formCert" action="/doCertificate" method="post"
                          enctype="multipart/form-data" >
                        <ul class="user_info_ul">
                            <li class="fix">
                                <p class="_title l">身份证</p>
                                <p class="l">
                                    <input type="text" class="info_text" id="inputId" name="ic"
                                           value="${sessionScope.user.ic}">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">真实姓名</p>
                                <p class="l">
                                    <input type="text" class="info_text" id="inputRealName" name="realName"
                                           placeholder="真实姓名" value="${sessionScope.user.realName}">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                        </ul>
                        <p id="tpi">头像:</p>
                        <img id="ju" src="${ctp}/image/ju.jpg"/>
                        <div class="tc">
                            <button type="button" id="csave" class="button" onclick="certificate()">保存</button>
                        </div>
                    </form>
                </div>

                <div class="nickname l">
                    <p>
                        <c:if test="${empty sessionScope.user.username||sessionScope.user.username==''}">
                            ${sessionScope.user.id}
                        </c:if>
                        <c:if test="${sessionScope.user.username!=null&&sessionScope.user.username!=''}">
                            ${sessionScope.user.username}
                        </c:if>
                        <span style="font-size: 14px;color: gray;">
                            <i>

                            </i>
                        </span>
                    </p>
                    <span>电话 &nbsp; : &nbsp; ${sessionScope.user.mobile}</span>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "${ctp}/doUserInfo",
            dataType: "json",
            success: function (result) {
                console.log(result.msg);
            },
        })
    })
    function certificate() {
        var realName = document.getElementById("inputRealName").value;
        var ic = document.getElementById("inputId").value;
        var bb = /^[a-z0-9]{18}$/;
        if (ic) {

        } else {
            layer.msg('身份证不能为空');
            return false;
        }
        if (!bb.test(ic)) {
            layer.msg('身份证只能是18位');
            return false;
        }
        if (realName) {

        } else {
            layer.msg('真实姓名不能为空');
            return false;
        }
        console.log(realName);

        $.ajax({//调用ajax后台数据异步方法
            //提交的方式
            type: "Post",
            async: false,
            //数据的传送页面：要启动界面的地址/界面的后台的方法
            url: "${ctp}/doCertificate",
            // contentType:false,
            data: {
                "realName": realName,
                "ic": ic,
            },
            //传到服务器的参数类型
            dataType: "json",
            //重要的后台的回调函数（很重要）
            success: function (result) {
                if (result.flag == 1) {
                    layer.msg("验证成功");
                    window.location.reload();
                } else {
                    layer.msg("验证失败");
                }
            },
        });
    }

</script>
</html>