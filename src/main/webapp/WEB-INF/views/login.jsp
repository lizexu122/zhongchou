<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <link rel="stylesheet" href="${ctp}/css/jigsaw.css">
    <link rel="stylesheet" href="${ctp}/css/Login&Register.css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/loadClickChange.js"></script>
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
    <style type="text/css">
        .container {
            width: 310px;
        }
        #Register{
            font-size:50px;
            font-weight: bold;
        }
    </style>
</head>
<body class="loaded">

<div id="LoginPart">
    <div class="container-fluid">
        <div class="row cb-slideshow-text-container ">
            <div class="tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">
                <header class="mb-5"><h1>快速登录</h1></header>
                <br/>
                <P class="mb-5">如果你没有账号，你可以点击
                    <a id="Register" rel="nofollow" target="_parent" href='#'>注册</a>
                    谢谢您的支持</P>
                <br>
                <form action="${ctp}/doLogin" method="post" class="subscribe-form" id="f2">
                    <div class="row form-section">
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <input name="mobile" type="text" class="form-control" id="username"
                                   placeholder="电话号码" required/>
                            <br><br>
                            <input name="password" type="password" class="form-control" id="password"
                                   placeholder="密码" required/>
                            <br><br>
                        </div>
                        <br>
                        <div class="col-md-5 col-sm-5 col-xs-5">
                            <button type="button" class="tm-btn-subscribe" onclick="kf()">登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="RegisterPart">
    <div class="container-fluid">
        <div class="row cb-slideshow-text-container ">
            <div class="tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">
                <header class="mb-5"><h1>注册</h1></header>
                <br/>
                <P class="mb-5">如果你已经有账号了
                    <a id="Login" rel="nofollow" href='javascript:back();' target="_parent">点击登陆</a>
                     T谢谢您的支持</P>
                <br>
                <form action="/doRegister" method="post" class="subscribe-form" id="f1">
                    <div class="row form-section">
                        <div class="col-md-7 col-sm-7 col-xs-7">

                            <input id="phone" name="mobile" type="tel" placeholder="电话号码"
                                   required pattern="[0-9]{11}$" class="form-control"/>
                            <br><br>
                            <input name="password" type="password" class="form-control" id="newpassword"
                                   placeholder="密码" pattern="^[a-zA-Z0-9]{6,12}$" required/>
                            <br><br>
                            <input name="ispassword" type="password" class="form-control" id="ispassword"
                                   placeholder="确认密码"/>
                            <br><br>
                            <div class="container">
                                <div id="captcha" style="position: relative"></div>
                                <div id="msg"></div>
                            </div>

                        </div>
                        <br>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="${ctp}/js/Login&Register.js"></script>
<script type="text/javascript" src="${ctp}/js/jigsaw.js"></script>
<script>
    jigsaw.init(document.getElementById('captcha'), function () {
       cf();
    })
</script>
</body>
</html>