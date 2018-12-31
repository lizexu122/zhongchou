<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>项目列表</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <style type="text/css">


        #projectList {
            margin-top: 20px;
        }

        #tbody {
            text-align: center;

            font-family: verdana,arial,sans-serif;

            font-size: 11px;

            color: #333333;

            border-width: 1px;

            border-color: #a9c6c9;

            border-collapse: collapse;
            width:100%;
        }
        #tbody th{
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }

        #tbody object {
            width: 80%;
        }

        #tbody td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
            background-color: #d4e3e5;
        }
        #tbody td:hover{
            background-color: orange;
        }

        td a {
            text-decoration: none;
            color: orange;
        }

        #head .logo, #head .top-nav, #head h1, .skyblue {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

    </style>
</head>
<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>

    <div class="r right_content">
        <div class="common minheight800">
            <div class="common_title fix">
                <span class="l">项目列表</span>
                <a href="#" class="complete r"></a>
            </div>
            <div id="projectList">
                <table id="tbody">

                </table>

            </div>
        </div>
    </div>
</div>
</body>


<script>
    // function timestampToTime(timestamp) {
    //     var date = new Date(timestamp);
    //     Y = date.getFullYear() + '-';
    //     M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
    //     D = date.getDate() + ' ';
    //     h = date.getHours() + ':';
    //     m = date.getMinutes() + ':';
    //     s = date.getSeconds();
    //     return Y + M + D + h + m + s;
    // }

    $(document).ready(function () {
        $.ajax({
            type: "get",
            async: false,
            url: "${ctp}/doProjectByUser",
            success: function (result) {
                console.log(result.data);
                if (result.flag == 1) {
                    console.log(result.flag);
                    var d = result.data;
                    console.log(d);
                    $("#tbody").append('<th>id</th><th>目录</th><th>标题</th><th>截止时间</th><th>进程</th>');
                    for (var i = 0; i < d.length; i++) {
                        if ($("#tbody tr").length <= d.length) {
                            $("#tbody").append(
                                "<tr>" +
                                "<td>" + d[i].id + "</td>" +
                                "<td>" + d[i].category.name + "</td>" +
                                "<td>" + d[i].title + "</td>" +
                                "<td>" + d[i].endTime + "</td>" +
                                "<td>" + (d[i].actualAmount / d[i].goalAmount).toFixed(4) * 100 + "%</td>" +
                                "</tr>");

                        }

                    }
                } else {
                    layer.msg("error");
                }
            }
        });
    });
</script>
</html>