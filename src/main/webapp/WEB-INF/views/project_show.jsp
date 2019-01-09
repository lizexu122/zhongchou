<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>所有项目</title>
    <link rel="stylesheet" href="${ctp}/css/project_show.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //未登录的不能点赞。弹框提示登录
            $('.projectPraise').click(function () {
                if (${empty user}) {
                    window.alert("Please log in first and then do the following!!!");
                    window.location.href = "${ctp}/login";
                }
            })
        });
        //点赞动画具体实现
        $(document).on("click", ".projectPraise", function () {
            var praise = $(this);
            var id = praise.parent(".praise").attr("id");
            $.get('${ctp}/doAddCancelInterest-' + id, function (result) {
                var text_box = praise.parent(".praise").find('.add-num');
                var praise_txt = praise.parent(".praise").find('.praise-txt');
                var num = parseInt(praise_txt.text());
                if (result.flag == 0) { //后台查询是否已经点赞
                    praise.find(".praiseImg").addClass("animation").attr("src", "${ctp}/image/praiseBefore.png");
                    praise_txt.removeClass("hover");
                    text_box.show().html("<em class='add-animation'>-1</em>");
                    $(".add-animation").removeClass("hover");
                    num -= 1;
                    praise_txt.text(num);
                } else {
                    praise.find(".praiseImg").addClass("animation").attr("src", "${ctp}/image/praiseAfter.png");
                    praise_txt.addClass("hover");
                    text_box.show().html("<em class='add-animation'>+1</em>");
                    $(".add-animation").addClass("hover");
                    num += 1;
                    praise_txt.text(num);
                }
            });
        });
    </script>
</head>
<%--用于加载各种搜索结果--%>
<body>
<jsp:include page="header.jsp"/>
<div class="ContainEverything">
    <div class="AllSearchResults">
        <script type="text/javascript">
            <%--实现分页查询：--%>
            //页码显示
            $(function () {
                //page.currentPage当前页
                var dqPage = parseInt(${page.currentPage});//得到的文本转成int
                //page.totalPage总页数
                var pageCount = parseInt(${page.totalPage});//得到总页数
                var i = 1;
                i = parseInt(i);
                var item = "";
                var href = "<%=path %>/doProjectAll?method=list&currentPage=";
                if (pageCount < 6) {
                    //总页数小于五页，则加载所有页
                    for (i; i <= pageCount; i++) {
                        if (i == dqPage) {
                            item += "<span class='disabled'>" + i + "</span>";
                        } else {
                            item += "<a href='" + href + i + "' >" + i + "</a>";
                        }
                    }
                    $('#pageBtn').append(item);
                    return;
                } else if (pageCount > 5) {//总页数大于五页，则加载五页
                    if (dqPage < 5) {//当前页小于5，加载1-5页
                        for (i; i <= 5; i++) {
                            if (i == dqPage) {
                                item += "<span class='disabled'>" + i + "</span>";
                            } else {
                                item += "<a href='" + href + i + "' >" + i + "</a>";
                            }
                        }
                        if (dqPage <= pageCount - 2) {//最后一页追加“...”代表省略的页
                            item += "<span> . . . </span>";
                        }
                        $('#pageBtn').append(item);
                        return;
                    } else if (dqPage > 6) {//当前页大于5页
                        for (i; i <= 2; i++) {//1,2页码始终显示
                            item += "<a href='" + href + i + "' >" + i + "</a>";
                        }
                        item += "<span> . . . </span>";//2页码后面用...代替部分未显示的页码
                        if (dqPage + 1 == pageCount) {//当前页+1等于总页码
                            for (i = dqPage - 1; i <= pageCount; i++) {//“...”后面跟三个页码当前页居中显示
                                if (i == dqPage) {
                                    item += "<span class='disabled'>" + i + "</span>";
                                } else {
                                    item += "<a href='" + href + i + "' >" + i + "</a>";
                                }
                            }
                        } else if (dqPage == pageCount) {//当前页数等于总页数则是最后一页页码显示在最后
                            for (i = dqPage - 2; i <= pageCount; i++) {//...后面跟三个页码当前页居中显示
                                if (i == dqPage) {
                                    item += "<span class='disabled'>" + i + "</span>";
                                } else {
                                    item += "<a href='" + href + i + "' >" + i + "</a>";
                                }
                            }
                        } else {//当前页小于总页数，则最后一页后面跟...
                            for (i = dqPage - 1; i <= dqPage + 1; i++) {//dqPage+1页后面...
                                if (i == dqPage) {
                                    item += "<span class='disabled'>" + i + "</span>";
                                } else {
                                    item += "<a href='" + href + i + "' >" + i + "</a>";
                                }
                            }
                            item += "<span> . . . </span>";
                        }
                        $('#pageBtn').append(item);
                        return;
                    }
                }
            });
        </script>
        <c:choose>
            <c:when test="${empty list}">
                <div class="alert alert-danger alert-dismissable">
                    <button aria-hidden="true" list-dismiss="alert" class="close" type="button"> ×</button>
                   对不起 还没有发布任何项目
                </div>
                <script type="text/javascript">
                    document.body.style.background = "url('${ctp}/image/n1.jpg') no-repeat center 0px fixed";
                    document.body.style.backgroundSize = "cover";
                </script>
            </c:when>
            <c:otherwise>
                <%--从第一条（index=0）记录开始取，到（index=1）结束：begin="0" end="1" step="1" --%>
                <%--展示5条记录--%>
                <ul>
                    <script type="text/javascript">
                        document.body.style.background = "url('${ctp}/image/n1.jpg') no-repeat center 0px fixed";
                        document.body.style.backgroundSize = "cover";
                    </script>
                    <span class="AllR">所有项目</span>
                    <c:forEach varStatus="PJ" var="project" items="${list}">
                        <li>
                            <div class="eachOne">
                                <div class="eachOneLeft">
                                    <a href='${ctp}/browse/detail-${project.id}'>
                                            <%--list:装载文件路径（绝对路径）--%>
                                        <object class="showImage" data="${project.cover}"></object>
                                    </a>
                                </div>
                                <div class="eachOneRight">
                                    <div class="praise" id="${project.id}">
                                        <span class="projectPraise">
                                            <img class="praiseImg" src="${ctp}/image/praiseBefore.png" id="praise-img">
                                            </span>
                                        <span class="praise-txt">${project.praise}</span>
                                        <span class="add-num"><em>+1</em></span>
                                    </div>
                                    <a href="${ctp}/browse/detail-${project.id}">
                                        <output class="PJTitle">项目标题：</output>
                                            ${project.title}
                                    </a><br>
                                    <a href="${ctp}/browse/detail-${project.id}">
                                        <output class="PJCategory">目录：</output>
                                            ${project.category.name}
                                    </a><br>
                                    <a href="${ctp}/browse/detail-${project.id}">
                                        <output class="PJGAmount">目标金额：</output>
                                        $${project.goalAmount}
                                    </a><br/>
                                    <a href="${ctp}/browse/detail-${project.id}">
                                        <output class="PJ">状态：</output>
                                        <c:if test="${project.status eq '0'}">未完成</c:if>
                                        <c:if test="${project.status eq '1'}">已完成</c:if>
                                    </a><br/>
                                    <output class="PJPublishTime">发布时间：
                                            ${project.publishTime}
                                    </output>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-primary"
                                             style="width: ${(project.actualAmount.divide(project.goalAmount,4,1))*100}% "></div>
                                    </div>
                                    <output class="PJFPercentage"
                                            style="width: 50px;height: 50px;color: palevioletred;">
                                    </output>
                                    <output class="PJFPercent">
                                        <fmt:formatNumber type="percent" minFractionDigits="2"
                                                          value="${project.actualAmount.divide(project.goalAmount,4,1)}"/>
                                    </output>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
        <div class="Page-box">
            <span id="dqPage" hidden="hidden" class="disabled1 current"></span>
            <div id="pageBtn" style="width: auto;display:inline-block !important;height: auto;">
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
    //获得当前用户的点赞记录，并相应的展示在页面
    $(window).load(function () {
        getIn();
    })
    //用于实现再次登录变红
    var ProjectList = [];
    var interestedList = [];
    var url = window.location.pathname;

    function getIn() {
        if (${not empty user}) {
            if (interestedList) {
                interestedList.splice(0, interestedList.length);
            } else {
                interestedList = [];
            }
            $.get("${ctp}/doGetInterest", function (result) {
                if (result.flag = 1) {
                    $.each(result.data, function (index, interest) {
                        interestedList.push(interest.project.id);
                    })
                }
                if (url.indexOf('hot') <= 0) {
                    getNew();
                } else {
                    getHot();
                }
            });
        }
    }


    function getHot() {
        if (ProjectList) {
            ProjectList.splice(0, ProjectList.length);
        } else {
            ProjectList = [];
        }
        $.get("${ctp}/getHotProjectList", function (result) {
            if (result.flag = 1) {
                $.each(result.data, function (index, projectList) {
                    ProjectList.push(projectList.id);
                });
                doII();
            }
        })
    }

    function doII() {
        for (var i = 0; i < interestedList.length; i++) {
            for (var j = 0; j < ProjectList.length; j++) {
                if (interestedList[i] == ProjectList[j]) {
                    di(ProjectList[j]);
                    break;
                }
            }
        }
    }

    //渲染为红色
    function di(j) {
        $('#' + j.toString()).find(".praiseImg").addClass("animation").attr("src", "${ctp}/image/praiseAfter.png");
        $('#' + j.toString()).find('.praise-txt').addClass("hover");
    }
</script>
</html>
