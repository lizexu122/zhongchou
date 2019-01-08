<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Commerce</title>
    <link rel="stylesheet" href="${ctp}/css/main.css" type="text/css"/>
    <link rel="stylesheet" href="${ctp}/css/model.css" type="text/css"/>
    <link rel="stylesheet" href="${ctp}/css/jquery.slideBox.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/responsiveslides.min.js"></script>
    <script type="text/javascript">
        //背景切换图 使用jquery插件
        $(function () {
            $("#slider").responsiveSlides({
                auto: true, //是否自动播放
                nav: true,  //是否显示左右导航箭头
                speed: 500, //动画持续时间 单位毫秒
                namespace: "callbacks", //修改默认的容器名称
                pager: false, //是否显示页码
            });
        });
        //AboutProject输出关于本网站总体的数据
        $(window).load(
            function showAboutObject() {
                $.get('doProjectCount', function (result) {    //项目总数，返回的是result对象
                    document.getElementById("pjPosted").innerHTML = result.data;
                });
                $.get('doSupportCount', function (result) {  //参与支持总数 返回的是result对象
                    document.getElementById("backers").innerHTML = result.data;
                });
                $.get('doProjectFinished', function (result) {
                    document.getElementById("pjCompleted").innerHTML = result.data;
                });
                $('#showNP').ready(
                    showTopFiveOfNH('doNewProjectTop')
                );
            }
        );
        $(document).ready(function () {
            $('ul.top > li').click(function () {
                $('ul.top > li').removeClass('currentLi');
                $(this).addClass('currentLi');
            });
        });
    </script>
    <script type="text/javascript">
        // 展示前五条最热最新记录
        function showTopFiveOfNH(url) {
            $.ajax({
                type: 'GET',
                url: url,
                dataType: "json",
                success: function (data) {
                    if (updateSearchResults) {
                        updateSearchResults(data);
                    }
                }
            });
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<!--背景大图轮播-->
<div class="slider">
    <div class="callbacks_container">
        <ul class="rslides" id="slider">
            <li>
                <div class="banner1">
                    <div class="banner-info">
                    </div>
                </div>
            </li>
            <li>
                <div class="banner2">
                    <div class="banner-info">
                    </div>
                </div>
            </li>
            <li>
                <div class="banner3">
                    <div class="banner-info">
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>

<%--第一个固定的背景大图--%>
<%--<div class="firstBackground">--%>
    <%--&lt;%&ndash;三个显示数据&ndash;%&gt;--%>
    <%--<div class="aboutProject" id="about">--%>
        <%--<div class="showMember" id="pricing">--%>
            <%--<div class="Center">--%>
                <%--<span class="AboutObject">总数目</span>--%>
                <%--<div class="members">--%>
                    <%--<ul>--%>
                        <%--<li>--%>
                            <%--<div class="numOMember">--%>
                                <%--<h5>第一</h5>--%>
                            <%--</div>--%>
                            <%--<div class="nameOMember">--%>
                                <%--<h2>总项目</h2>--%>
                            <%--</div>--%>
                            <%--<div class="amountOMember">--%>
                                <%--<h2 id="pjPosted"></h2>--%>
                            <%--</div>--%>
                            <%--<div class="bigNumOMember">--%>
                                <%--<h5>First</h5>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                    <%--<ul>--%>
                        <%--<li>--%>
                            <%--<div class="numOMember">--%>
                                <%--<h5>第二</h5>--%>
                            <%--</div>--%>
                            <%--<div class="nameOMember">--%>
                                <%--<h2>投资家</h2>--%>
                            <%--</div>--%>
                            <%--<div class="amountOMember">--%>
                                <%--<h2 id="backers"></h2>--%>
                            <%--</div>--%>
                            <%--<div class="bigNumOMember">--%>
                                <%--<h5>第二</h5>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                    <%--<ul>--%>
                        <%--<li>--%>
                            <%--<div class="numOMember">--%>
                                <%--<h5>第三</h5>--%>
                            <%--</div>--%>
                            <%--<div class="nameOMember">--%>
                                <%--<h2>已完成项目</h2>--%>
                            <%--</div>--%>
                            <%--<div class="amountOMember">--%>
                                <%--<h2 id="pjCompleted"></h2>--%>
                            <%--</div>--%>
                            <%--<div class="bigNumOMember">--%>
                                <%--<h5>第三</h5>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
