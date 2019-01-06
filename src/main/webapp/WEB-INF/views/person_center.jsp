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
</head>

<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="personal_info fix">
            <div class="personal_info_left l">
                <div class="head_portrait l">
                    <img src="${sessionScope.user.avatar}" alt="">
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
                            <c:if test="${sessionScope.user.status==1}">已验证</c:if>
                            <c:if test="${sessionScope.user.status==0}">未验证</c:if>
                            </i>
                        </span>
                    </p>
                    <span>电话号码 &nbsp; : &nbsp; ${sessionScope.user.mobile}</span>
                </div>
            </div>
            <div class="personal_info_right l">
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
</script>
</html>