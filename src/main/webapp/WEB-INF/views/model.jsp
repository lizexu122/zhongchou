<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>eachOne</title>
    <script src="js/vue.js" type="text/javascript"></script>
</head>
<body>
<div id="search_result_model">
    <div id="AllSearchResult">
        <%--用于展示当前实际搜索时间--%>
        <%--<div>{{new Date()}}</div>--%>
        <div v-if="result && result.data && result.data.length">
            <ul>
                <li v-for="project in result.data">
                    <div class="eachOne">
                        <div class="eachOneLeft">
                            <span v-if="!project.cover || project.cover.trim().length == 0">
                                <a v-bind:href="'/financing/browse/detail-'+project.id"><object data="image/bnr.jpg"
                                                                                                class="showImage"></object></a>
                            </span>
                            <span v-else>
                                <a v-bind:href="'/financing/browse/detail-'+project.id"><object
                                        v-bind:data="project.cover" class="showImage"></object></a>
                            </span>
                            <%--图片必须用绝对路径输出--%>
                        </div>
                        <div class="eachOneRight">
                            <a v-bind:href="'/financing/browse/detail-'+project.id">
                                <output class="PJTitle">Project Title：</output>
                                {{project.title}}
                            </a><br>
                            <output class="PJCategory">Category：</output>
                            {{project.category.name}}
                            <br>
                            <output class="PJTeam">Team：</output>
                            {{project.team}}<br>
                            <output class="PJPurpose">Purpose：</output>
                            {{project.purpose}}<br/>
                            <output class="PJGAmount">Goal：</output>
                            $ {{project.goalAmount}}<br/>
                            <output class="PJ">Project Status：</output>
                            <span v-if="project.status == '0'">Unfinished Undue</span>
                            <span v-if="project.status == '1'">Completed Undue</span>
                            <span v-if="project.status == '2'">Unfinished Expiry</span>
                            <span v-if="project.status == '3'">Completed Expiry</span>
                            <br/>
                            <output class="PJPublishTime">Publish Time：</output>
                            {{project.publishTime}}
                            <br>
                            <output class="PJPublishTime">Backers：</output>
                            <span v-if="project.supportCount != null">{{project.supportCount}}</span>
                            <span v-if="project.supportCount == null">No one's support</span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div v-else>
            <div class="alert alert-danger alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button"> ×</button>
                I am sorry I can't Find what you want ! Please Change another words.
            </div>
        </div>
    </div>
</div>
<script>
    var searchResult = {
        msg: undefined,
        data: undefined,
        flag: undefined
    };
    var app_search_results = new Vue({
        el: '#search_result_model',
        data: {
            result: searchResult
        }
    });

    function updateSearchResults(result) {
        searchResult.msg = result.msg;
        searchResult.data = result.data;
        searchResult.flag = result.flag;
    };
</script>
</body>
</html>