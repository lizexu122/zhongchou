<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <title>Welcome</title>
    <%--<link rel="stylesheet" href="${ctp}/css/jigsaw.css">--%>
    <link rel="stylesheet" href="${ctp}/css/Login&Register.css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/loadClickChange.js"></script>
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
    <style type="text/css">
        #dengl {
            background-color: #006699;
            border-radius: .5rem;
            border-color: white;
            padding: 0.75rem 1.6rem;
            font-weight: 300;
            font-size: 1.4rem;
            cursor: pointer;
            position: relative;
            left: 70px;
        }
        #qq {
            position: relative;
            top: -580px;
            left: -580px;
        }
        #gg{
            position: relative;
            top:170px;
            left:550px;
        }

    </style>
</head>
<body class="loaded">
<%--<ul class="cb-slideshow">--%>
    <%--<li></li>--%>
    <%--<li></li>--%>
    <%--<li></li>--%>
    <%--<li></li>--%>
    <%--<li></li>--%>
    <%--<li></li>--%>
<%--</ul>--%>

<div id="LoginPart">
    <div class="container-fluid">
        <div class="row cb-slideshow-text-container ">
            <div class="tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">
                <header class="mb-5"><h1>登录</h1></header>

                <form action="${ctp}/doLogin" method="post" class="subscribe-form" id="f2">
                    <div class="row form-section">
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <input name="mobile" type="text" class="form-control" id="username"
                                   placeholder="手机号" required/>
                            <br><br>
                            <input name="password" type="password" class="form-control" id="password"
                                   placeholder="密码" required/>
                            <br><br>
                        </div>
                        <br>
                        <div class="col-md-5 col-sm-5 col-xs-5">
                            <button type="button"  id="dengl" onclick="kf()">登录</button>
                        </div>
                    </div>
                </form>
                <img id="qq" src="${ctp}/image/xx.png"/>
                <img id="gg" src="${ctp}/image/gg.png"/>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="${ctp}/js/Login&Register.js"></script>
<script type="text/javascript" src="${ctp}/js/jigsaw.js"></script>

</body>
</html>