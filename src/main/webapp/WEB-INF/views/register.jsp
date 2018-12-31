<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="${ctp}/css/Login&Register.css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <%--<script type="text/javascript" src="${ctp}/js/loadClickChange.js"></script>--%>
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
</head>
<body>

<div id="RegisterPart">
    <div class="row cb-slideshow-text-container ">
        <div class="tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">
            <header class="mb-5">   <h1>注册</h1></header>
            <br/>
            <P class="mb-5">如果你已经拥有一个账户,请点击登录.
                <a id="Login" rel="nofollow" href='login' target="_parent">点击并且登录 </a>
                谢谢您的支持!</P>
            <br>
            <form action="/doRegister" method="post" class="subscribe-form" id="f1">
                <div class="row form-section">
                    <div class="col-md-7 col-sm-7 col-xs-7">

                        <input id="phone" name="mobile" type="tel" placeholder="电话"
                               required pattern="[0-9]{11}$" class="form-control"/>
                        <br><br>
                        <input name="password" type="password" class="form-control" id="newpassword"
                               placeholder="密码" pattern="^[a-zA-Z0-9]{6,12}$" required/>
                        <br><br>
                        <input name="ispassword" type="password" class="form-control" id="ispassword"
                               placeholder="重复密码"/>
                        <br><br>
                        <div class="container">
                            <button type="button" class="tm-btn-subscribe" onclick="cf()">注册</button>
                        </div>

                    </div>
                    <br>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="${ctp}/js/Login&Register.js"></script>
<script>
</script>
</body>

</html>
