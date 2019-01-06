<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Person Project</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <style type="text/css">


        #projectList {
            margin-top: 20px;
        }

        #tbody {
            width: 100%;
            text-align: center;
            border-bottom: 1px solid black;
        }

        #tbody object {
            width: 80%;
        }

        #tbody td {
            width: 13%;
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
        th {
            border-bottom: 1px solid;
        }
        td:hover{
            color:orange;
        }


    </style>
</head>
<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>

    <div class="r right_content">
        <div class="common minheight800">
            <div class="common_title fix">
                <span class="l">Project List</span>
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
                    $("#tbody").append('<th>ID</th><th>类别</th><th>截止日期</th><th>进度</th><th>标题</th><th>查看</th>');
                    for (var i = 0; i < d.length; i++) {
                        if ($("#tbody tr").length <= d.length) {
                            $("#tbody").append(
                                "<tr>" +
                                "<td>" + d[i].id + "</td>" +
                                "<td>" + d[i].category.name + "</td>" +
                                "<td>" + d[i].endTime + "</td>" +
                                "<td>" + (d[i].actualAmount / d[i].goalAmount).toFixed(4) * 100 + "%</td>" +
                                "<td>" + d[i].title + "</td>" +
                                "<td><a href='${ctp}/personCenter/personProject/info-" + d[i].id + "'>查看</a></td>" +
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