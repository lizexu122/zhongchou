<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Money</title>
    <link rel="stylesheet" href="${ctp}/css/main.css" type="text/css"/>
    <link rel="stylesheet" href="${ctp}/css/model.css" type="text/css"/>
    <link rel="stylesheet" href="${ctp}/css/jquery.slideBox.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/responsiveslides.min.js"></script>
    <script type="text/javascript">
        //背景切换图
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: false,
            });
        });
        //AboutProject输出关于本网站总体的数据
        $(window).load(
            function showAboutObject() {
                $.get('doProjectCount', function (result) {
                    document.getElementById("pjPosted").innerHTML = result.data;
                });
                $.get('doSupportCount', function (result) {
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
                        <h3>投资</h3>
                        <p>投资与收益并存,不投资怎么可以赚钱</p>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner2">
                    <div class="banner-info">
                        <h3>四个自信</h3>
                        <p>坚持道德自信，理论自信，文化自信，制度自信</p>

                    </div>
                </div>
            </li>
            <li>
                <div class="banner3">
                    <div class="banner-info">
                        <h3>资本积累</h3>
                        <p>可以通过资本积累不断积累财富，进而创造更大的财富</p>
                        <%--明智的投资是经济独立最可靠的道路，而且每个人都可以做到。--%>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<%--第一个固定的背景大图--%>
<div class="firstBackground">
    <%--三个显示数据--%>
    <div class="aboutProject" id="about">
        <div class="showMember" id="pricing">
            <div class="Center">
                <span class="AboutObject">总数量</span>
                <div class="members">
                    <ul>
                        <li>
                            <div class="numOMember">
                                <h5>第一个</h5>
                            </div>
                            <div class="nameOMember">
                                <h2>已发布的项目</h2>
                            </div>
                            <div class="amountOMember">
                                <h2 id="pjPosted"></h2>
                            </div>
                            <div class="bigNumOMember">
                                <h5>第一个</h5>
                            </div>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <div class="numOMember">
                                <h5>第二个</h5>
                            </div>
                            <div class="nameOMember">
                                <h2>银行家</h2>
                            </div>
                            <div class="amountOMember">
                                <h2 id="backers"></h2>
                            </div>
                            <div class="bigNumOMember">
                                <h5>第二个</h5>
                            </div>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <div class="numOMember">
                                <h5>第三个</h5>
                            </div>
                            <div class="nameOMember">
                                <h2>已完成项目</h2>
                            </div>
                            <div class="amountOMember">
                                <h2 id="pjCompleted"></h2>
                            </div>
                            <div class="bigNumOMember">
                                <h5>第三个</h5>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%--第二个固定的背景大图--%>
<div class="secondBackground">
    <%--用于展示部分前五记录--%>
    <div id="aboutNP">
        <%--<div class="typeOfProject">--%>
            <%--<ul class="top">--%>
                <%--<li class="currentLi"><a href="javascript:;" onclick="showTopFiveOfNH('doNewProjectTop')">最新发布--%>
                    <%--</a></li>--%>
                <%--<li><a href="javascript:;" onclick="showTopFiveOfNH('doHotProjectTop')">最热发布</a></li>--%>
                <%--<li><a href="javascript:;" onclick="showTopFiveOfNH('doProjectTopByCID-1')">农业</a></li>--%>
                <%--<li><a href="javascript:;" onclick="showTopFiveOfNH('doProjectTopByCID-2')">发布者</a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>
        <%--<div id="showNP" class="showNP">--%>
            <%--<jsp:include page="model.jsp"/>--%>
        <%--</div>--%>
    <%--</div>--%>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
