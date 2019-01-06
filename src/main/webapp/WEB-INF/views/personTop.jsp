<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PersonTop</title>
    <style>
        #logi {
            position: relative;
            text-decoration: none;
            font-size: 25px;
            font-weight: bold;
            color: cornflowerblue;
            left: 70px;
            top: -27px;
        }

        #Logout {
            left: 1200px;
            position: relative;
            text-decoration: none;
            font-size: 25px;
            font-weight: bold;
            color: cornflowerblue;
            top: -67px;
        }

        #top_choose {
            height: 60px;
            border: 0.5px solid gainsboro;
        }
    </style>
</head>
<body>
<div id="top_choose">
    <div id="log">
        <img src="${ctp}/image/AboutUs.png" height="60px" width="60px"/><br>
        <a id="logi" href="${ctp}/index">主页</a><br>
        <a id="Logout" href="${ctp}/login">登出</a>
    </div>

</div>

</body>
</html>