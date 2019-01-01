<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<jsp:include page="personTop.jsp"/>
<style type="text/css">

     a:hover{
        color:purple;
    }
</style>

<div class="left_nav l">
    <ul class="ul_left_nav">
        <li id="personCenter" class="active">
            <a href="${ctp}/personCenter">
                <span class="left_nav_name dib">个人中心 |</span>
            </a>
        </li>
        <li id="personInfo" class="grid">
            <a href="${ctp}/personCenter/personInfo">
                <span class="left_nav_name dib">个人信息  |</span>
            </a>
        </li>
        <li id="projectCreate" class="grid">
            <a href="${ctp}/personCenter/projectCreate">
                <span class="left_nav_name dib">项目发布  |</span>
            </a>
        </li>
        <li id="personProject" class="grid">
            <a href="${ctp}/personCenter/personProject">
                <span class="left_nav_name dib">我的项目  |</span>
            </a>
        </li>
        <li id="personOrder" class="grid">
            <a href="${ctp}/personCenter/personOrder">
                <span class="left_nav_name dib">我的订单  |</span>
            </a>
        </li>
    </ul>
</div>
<%--<script type="text/javascript">--%>
    <%--window.onload = function changeBarFocus() {--%>
        <%--var url = window.location.pathname;--%>
        <%--$('.ul_left_nav>li').removeClass("active").addClass("grid");--%>
        <%--if (url.endsWith('Center/personInfo') > 0) {--%>
            <%--$('#personInfo').addClass("active");--%>
        <%--} else if (url.endsWith('Center/projectCreate') > 0) {--%>
            <%--$('#projectCreate').addClass("active");--%>
        <%--} else if(url.indexOf('Center/personProject') > 0) {--%>
            <%--$('#personProject').addClass("active");--%>
        <%--} else if(url.endsWith('Center/personComment') > 0) {--%>
            <%--$('#personComment').addClass("active");--%>
        <%--}else if (url.endsWith('Center/personOrder') > 0) {--%>
            <%--$('#personOrder').addClass("active");--%>
        <%--} else if(url.endsWith('Center/personAddress') > 0) {--%>
            <%--$('#personAddress').addClass("active");--%>
        <%--} else if(url.endsWith('Center/personEditor') > 0) {--%>
            <%--$('#personEditor').addClass("active");--%>
        <%--}else if (url.endsWith('personCenter') > 0) {--%>
            <%--$('#personCenter').addClass("active");--%>
        <%--}--%>
    <%--};--%>
</script>
