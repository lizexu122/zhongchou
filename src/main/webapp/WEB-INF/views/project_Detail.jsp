<%--
  Created by IntelliJ IDEA.
  User: Lizexu
  Date: 2018/6/4
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>项目详情</title>
    <link rel="stylesheet" href="${ctp}/css/courseAtlas.css">
    <link rel="stylesheet" href="${ctp}/css/detail.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
    <script type="text/javascript" src="${ctp}/js/common.js"></script>
    <script src="${ctp}/js/courseAtlas.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function (data) {
            var jsonLength = 0;
            for (var project in data) {
                jsonLength++;
            }
            console.log(jsonLength);
            return jsonLength;
        })
    </script>
    <style type="text/css">
        #ping {
            position: relative;
            left: -800px;
            margin: 20px;
        }

        .star-review.\31 {
            width: 30%;
            height: 20%;
            position: relative;
            left: -190px;
        }

        #zo {

            width: 80%;
            border-top: 1px dotted black;

        }

        #wn {
            width: 20%;
            height: 20%;
            margin-left: 90%;
        }
    </style>


<body>
<jsp:include page="header.jsp"/>
<div class="ContainEverything">
    <div class="AllSearchResults">

        <%--从第一条（index=0）记录开始取，到（index=1）结束：begin="0" end="1" step="1" --%>
        <%--展示5条记录--%>
        <ul>
            <%--begin="0" end="4"--%>
            <div class="eachOne">
                <div class="eachOneLeft">
                    <img class="showImage" src="${data.cover}"></img>
                    <%--图片必须用绝对路径输出--%>
                </div>
                <div class="eachOneRight">
                    <a href="#">
                        <output class="PJTitle">主题：<span id="title"> ${data.title}</span></output>
                    </a><br>
                    <a href="#">
                        <output class="PJCategory">支持数：<span id="shengyu">${data.supportCount} </span></output>

                    </a><br>
                    <a href="#">
                        <output class="PJCategory">实际金额：<span id="">${data.actualAmount}</span></output>
                    </a><br>

                    <a href="#">
                        <output class="PJ">status：</output>
                        <c:if test="${data.status eq '0'}">未完成</c:if>
                        <c:if test="${data.status eq '1'}">已完成</c:if>
                    </a><br/>
                    <output class="PJPublishTime">发布时间：</output>
                    <fmt:formatDate type="date"
                                    value="${project.publishTime}"></fmt:formatDate>
                    <div class="progress" onloadstart="PJPercentage">

                        <div class="progress-bar progress-bar-primary"></div>
                    </div>
                    <output class="PJFPercent">
                        <fmt:formatNumber type="percent" minFractionDigits="2"
                                          value="${data.actualAmount/data.goalAmount}"/>
                    </output>
                    <br>
                    <a href="#">
                        <output class="PJCategory">剩余天数：<input id="shengyutian" readonly/></output>
                    </a><br>
                    <br>
                    <a href="#">
                        <a href='${ctp}/browse/support-${data.id}' id="sdzc" id="sdzc">支持</a>
                    </a><br>
                </div>
            </div>
            </li>
        </ul>
        <div id="clearfix">
            <ul>
                <li id="kk1" onclick="chu()">项目详情</li>
                <li id="ss2" onclick="chu1()">项目更新</li>
                <li id="pp3" onclick="chu3()">评论</li>
            </ul>
        </div>

        <div class="block_courseAtlas">
            <div class="course_head">
                <div class="course_head_l">
                    <div class="head_img">
                        <h3>share</h3>
                    </div>
                    <div class="brief">
                        <img src="${ctp}/image/qq.png"/>
                    </div>
                </div>
                <div class="course_head_r">
                </div>
            </div>
            <div class="course_box">
                <ul class="course_box_list">
                    <li class="first">
                        <a class="a_fold" href="javascript:void(0)">+</a>
                        <div class="course_title">
                        </div>
                        <div class="course_down" style="display: block;">
                            <ul>
                                <li>
                                    <h2 class="h">title</h2>
                                    <div class="course_img"><h4>${data.title}</h4></div>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div id="gengxin" style="display:none;">

            <ul id="update">
            </ul>
        </div>
        <div class="commentm" id="comemnt" style="display: none;">
            <div id="ping">
                <h2>游客评论</h2>
            </div>
            <div class="star-review 1">
                <img src="${ctp}/image/22.png"/>
            </div>
            <div id="zo">
                <form action="${ctp}/doAddComment" method="post" id="commen">
                    <input type="hidden" class="cmt1" name="project" value="${data.id}">
                    <textarea rows="2" cols="10" name="content" id="content2">
                    </textarea>
                    <div id="wn">
                        <input type="button" id="pinglun" value="评论" onclick="pingluna()"/>
                    </div>
                    <p>评论列表</p>
                    <table id="plItemCountBox">

                    </table>
                </form>
            </div>
        </div>
        <%--<form action="/doAddComment" method="post" id="commen">--%>

        <%--<div>--%>
        <%--<table id="plItemCountBox">--%>
        <%--<tr>--%>
        <%--<div id="fenghua">--%>
        <%--<th id="cmt">content:</th>--%>
        <%--<td><input type="text" class="cmt1" name="content" id="content2"/></td>--%>
        <%--</div>--%>
        <%--</tr>--%>
        <%--<tr>--%>
        <%--</td><input type="button" id="pinglun" value="comment" onclick="pingluna()"/></td>--%>
        <%--</tr>--%>
        <%--</table>--%>
        <%--</div>--%>

        <%--</form>--%>
    </div>


</div>

</div>

<div class="footer">
    <jsp:include page="footer.jsp"/>
</div>
<script type="text/javascript">


    function showFold(e) {
        $(e).nextAll(".update-item-content").slideToggle(1000);
    }

    function PJPercentage() {
        var a = ${project.actualAmount/project.goalAmount};
        $('.progress-bar progress-bar-primary').css('width', a);
    }

    var date1 = '${data.publishTime}';
    var date2 = '${data.endTime}';
    date1 = new Date(date1)
    date2 = new Date(date2);
    var date3 = date2.getTime() - date1.getTime();
    var days = Math.floor(date3 / (24 * 3600 * 1000));
    console.log(date1);
    console.log(date3);
    document.getElementById("shengyutian").value = days;
    if (days < 0) {
        document.getElementById("shengyutian").value = 0;
        document.getElementById("sdzc").style.display = 'none';

    }

    function timestampToTime(timestamp) {
        console.log(timestamp);
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y + M + D + h + m + s;
    }

    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "${ctp}/doGetUpdate-${data.id}",

        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                console.log(d);
                for (var i = 0; i < d.length; i++) {
                    if ($("#update tr").length <= d.length) {
                        $("#update").append(
                            "<li class=\"update-item\"> " +
                            "<a class=\"a_fold\" href=\"javascript:void(0)\" onclick=\"showFold(this)\">-</a> " +
                            "<div class=\"update-item-title\">" +
                            "<h3>" + d[i].project.user.username + "</h3>" +
                            "<p>" + d[i].updateTime + "</p>" +
                            "</div> " +
                            "<div class=\"update-item-content\">" +
                            "<div>" + d[i].updateContent + "</div>" +
                            "</div>" +
                            "</li>"
                        );
                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });


    function chu() {
        document.getElementsByClassName("block_courseAtlas")[0].style.display = 'block';
        document.getElementById("gengxin").style.display = 'none';
        document.getElementById("comemnt").style.display = 'none';

    }

    function chu1() {
        document.getElementsByClassName("block_courseAtlas")[0].style.display = 'none';
        document.getElementById("gengxin").style.display = 'block';
        document.getElementById("comemnt").style.display = 'none';


    }

    function pingluna() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${ctp}/doAddComment",//url
            data: $('#commen').serialize(),
            success: function (result) {
                // console.log(result);//打印服务端返回的数据(调试用)
                // console.log(result.flag);
                if (result.flag == 1) {
                    window.location.href = "${ctp}/doProjectDetail-${data.id}";
                } else {
                    layer.msg(result.msg);
                }

            }
        });
    }

    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "${ctp}/doGetComment-${data.id}",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                console.log(d);
                for (var i = 0; i < d.length; i++) {
                    if ($("plItemCountBox tr").length <= d.length) {

                        if (d[i].toUser == null) {
                            d[i].toUser = new Object();
                            d[i].toUser.mobile = "无";
                            d[i].toUser.username="";
                        }

                        $("#plItemCountBox").append(
                            "<tr>" +
                            "<td>" + " <img id='gf' src=\"${data.user.avatar}\"/>" + "</td>" +
                            "</tr>"
                            + "<tr>" +
                            "<td>" + d[i].fromUser.username + "</td>" +
                            "</tr>"
                            + "<tr>" +
                            "<td id='cm'>" + d[i].content +
                            "<span id='xuan'>Please select the reply object</span>" +
                            "<input class='radio' type='radio' value='"
                            + d[i].fromUser.id + "' name='to_user'> </td>" +
                            "</tr>"
                            + "<tr>" +
                            "<td> ToUser:"
                            + d[i].toUser.username + " </td>" +
                            "<td>" + " <img id='gf' src=\"${d[i].toUser.avater}\"/>" + "</td>" +
                            "</tr>" +
                            "<tr>" +
                            "<td>CreateTime: " + d[i].createTime + "</td>" +
                            "</tr>"
                        );


                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });

    function chu3() {
        document.getElementsByClassName("block_courseAtlas")[0].style.display = 'none';
        document.getElementById("gengxin").style.display = 'none';
        document.getElementById("comemnt").style.display = 'block';


    }


</script>
</body>
</html>
