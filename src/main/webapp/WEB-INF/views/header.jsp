<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Header(导航栏，统一头部)</title>
    <link rel="stylesheet" href="${ctp}/css/header.css" type="text/css"/>
    <link rel="stylesheet" href="${ctp}/css/icon.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/memenu.js"></script>
    <script type="text/javascript" src="${ctp}/js/responsiveslides.min.js"></script>
</head>
<body>
<div id="Head">
    <div class="logo">
        <h1><a href="${ctp}/index">筹钱</a></h1>
    </div>
    <div class="top-nav">
        <ul class="memenu skyblue">
            <li id="All" class="grid"><a id="dx" href="${ctp}/browse/all">已发布项目</a>
                <div class="mepanel">
                    <div class="row">
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <c:choose>
        <c:when test="${empty user}">
            <%--未登录，提示登录按钮--%>
            <div id="defaultShow">
                <button id="promptLogin" type="submit" onclick="window.location.href='${ctp}/register'"
                        onmouseover="this.style.cursor='pointer'">
                    <a href='javascript:;'>注册/登录</a>
                </button>
            </div>
        </c:when>
        <c:otherwise>
            <c:if test="${not empty user}">
                <div class="self-Page">
                    <ul class="memenu skyblue">
                        <li id="photo" class="grid"><a href="${ctp}/personCenter">
                                <%--已登录，存放头像与id--%>
                            <div id="self_image">
                                <c:if test="${not empty user.avatar}">
                                    <%--成功获取头像数据并加载--%>
                                    <img id="showSelfImage" src="${user.avatar}"/>
                                </c:if>
                                <c:if test="${empty user.avatar}">
                                    <%--未得头像数据默认返回--%>
                                    <a href="${ctp}/image/defaulthead.png"></a>
                                </c:if>
                                <span class="UserName">${user.username}</span>
                            </div>
                            <div class="mepanel">
                                <div class="row">
                                    <div class="col1 me-one">
                                        <ul>
                                            <li><a href="${ctp}/personCenter"><span class="icon_profile"></span>My
                                                Profile</a></li>
                                            <li><a href="${ctp}/personCenter/personProject"><span
                                                    class="icon_clipboard"></span>My
                                                Project</a>
                                            </li>
                                            <li><a href="${ctp}/doLogout"><span class="icon_key"></span>Log Out</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </a>
                        </li>
                    </ul>
                </div>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>
<script type="text/javascript">
    /*
    * 部分1：头部
    * */
    //加载头部Header
    $(document).ready(
        function () {
            $(".memenu").memenu();
            //搜索框实现，并删除字符串开始和末尾的空格
            $('#searchImg').click(function () {
                    var $input = $('#searchByKeyWord');
                    window.location.href = '${ctp}/browse/search-' + $.trim($input.val());
                }
            );
            window.onload = function changeBarFocus() {
                var url = window.location.pathname;
                $('.top-nav>ul>li').removeClass("active").addClass("grid");
                if (url.indexOf('hot') > 0) {
                    $('#Hot').addClass("active");
                } else if (url.indexOf('new') > 0) {
                    $('#New').addClass("active");
                } else if (url.indexOf('index') > 0) {
                    $('#Home').addClass("active");
                } else if (url.indexOf('person') > 0) {
                    $('#photo').addClass("active");
                } else {
                    $('#All').addClass("active");
                }
            };
        }
    );
</script>
<script type="text/javascript">

</script>
</body>
</html>
