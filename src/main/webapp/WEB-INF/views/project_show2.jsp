﻿<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
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
        <c:choose>
            <c:when test="${empty data}">
                <div class="alert alert-danger alert-dismissable">
                    <button aria-hidden="true" list-dismiss="alert" class="close" type="button"> ×</button>
                   对不起,我们还没有发布任何项目
                </div>
                <script type="text/javascript">
                    document.body.style.background = "url('${ctp}/image/n1.jpg') no-repeat center 0px fixed";
                    document.body.style.backgroundSize = "cover";
                </script>
            </c:when>
            <c:otherwise>
                <ul>
                    <script type="text/javascript">
                        document.body.style.background = "url('${ctp}/image/n1.jpg') no-repeat center 0px fixed";
                        document.body.style.backgroundSize = "cover";
                    </script>
                    <c:forEach varStatus="PJ" var="project" items="${data}">
                        <li>
                            <div class="eachOne">
                                <div class="eachOneLeft">
                                    <a href='${ctp}/browse/detail-${project.id}'>
                                            <%--list:装载文件路径（绝对路径）--%>
                                        <object class="showImage" data="${project.cover}" oncanplay="false"></object>
                                    </a>
                                </div>
                                <div class="eachOneRight">
                                        <%--实现动态点赞--%>
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
                                        <output class="PJCategory">类别：</output>
                                            ${project.category.name}
                                    </a><br>
                                    <a href="${ctp}/browse/detail-${project.id}">
                                        <output class="PJGAmount">目标金额：</output>
                                            $${project.goalAmount}
                                    </a><br/>
                                    <a href="${ctp}/browse/detail-${project.id}">
                                        <output class="PJ">状态：</output>
                                        <c:if test="${project.status eq '0'}">未到期</c:if>
                                        <c:if test="${project.status eq '1'}">已到期</c:if>
                                        <c:if test="${project.status eq '2'}">已完成</c:if>
                                        <c:if test="${project.status eq '3'}">未完成</c:if>
                                    </a><br/>
                                    <output class="PJPublishTime">发布时间：${project.publishTime}
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
                                                          value="${project.actualAmount.divide(project.goalAmount,4,1) }"/>
                                    </output>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<div>
    <jsp:include page="footer.jsp"/>
</div>
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

    function getNew() {
        if (ProjectList) {
            ProjectList.splice(0, ProjectList.length);
        } else {
            ProjectList = [];
        }
        $.get("${ctp}/getNewProjectList", function (result) {
            if (result.flag = 1) {
                $.each(result.data, function (index, projectList) {
                    ProjectList.push(projectList.id);
                });
                doII();
            }
        })
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
    document.body.style.background = "url('${ctp}/image/n1.jpg') no-repeat center 0px fixed";
    document.body.style.backgroundSize = "cover";
</script>
</html>