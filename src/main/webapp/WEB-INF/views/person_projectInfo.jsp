<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <title>Person Project Information</title>
    <style type="text/css">
        table td {
            width: 15%;
            text-align: center;
        }
    </style>
</head>
<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>


    <div class="r right_content">
        <div class="common minheight800">
            <div class="common_title fix">
                <span class="l">项目信息</span>
                <a href="#" class="complete r"></a>
            </div>
            <div class="user_info fix">
                <ul class="user_info_ul">
                    <li class="fix">
                        <p class="_title l">项目 ID</p>
                        <p class="l">
                            <span>${data.id}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">标题</p>
                        <p class="l">
                            <span>${data.title}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">联系姓名</p>
                        <p class="l">
                            <span>${data.contactName}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <div style="clear: both"></div>
                    <li class="fix">
                        <p class="_title l">联系电话</p>
                        <p class="l">
                            <span>${data.contactPhone}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">项目类别</p>
                        <p class="l">
                            <span>${data.category.name}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">咨询电话</p>
                        <p class="l">
                            <span>${data.hotline}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="user_info_img fix">
                        <p class="_title l">封面</p>
                        <div class="l _img">
                            <object data="${data.cover}"></object>
                        </div>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">目标金额</p>
                        <p class="l">
                            <span>$${data.goalAmount}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">实际金额</p>
                        <p class="l">
                            <span>$${data.actualAmount}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>

                    <li class="fix">
                        <p class="_title l">发布时间</p>
                        <p class="l">
                            ${data.publishTime}
                        </p>
                        <div style="clear: both"></div>
                    </li>

                    <li class="fix">
                        <p class="_title l">截止日期</p>
                        <p class="l">
                            ${data.endTime}
                        </p>
                        <div style="clear: both"></div>
                    </li>


                    <li class="fix">
                        <p class="_title l">团队</p>
                        <p class="l">
                        <div>${data.team}</div>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">目的</p>
                        <p class="l">
                        <div>${data.purpose}</div>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">支持数</p>
                        <p class="l">
                            <span>${data.supportCount}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">点赞数</p>
                        <p class="l">
                            <span>${data.praise}</span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                    <li class="fix">
                        <p class="_title l">状态</p>
                        <p class="l">
                            <span>
                                <c:if test="${data.status eq '0'}">未完成未到期</c:if>
                                <c:if test="${data.status eq '1'}">已完成未到期</c:if>
                                <c:if test="${data.status eq '2'}">未完成已到期</c:if>
                                <c:if test="${data.status eq '3'}">已完成已到期</c:if>
                            </span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                </ul>
                <p>细节</p>
                <div style="width: 800px; height: 400px; overflow-y: auto">
                    ${data.detail}
                </div>
            </div>
            <hr>
            <div class="tab-menu" style="height: 40px;font-size: 26px">
                <ul>
                    <li><a class="tab-selected" href="javascript:void(0);">项目回馈</a></li>
                    <li><a href="javascript:void(0);">项目更新</a></li>
                </ul>
            </div>
            <div class="tab-box" style="margin-top: 30px">
                <div>
                    <div>
                        <input type="button" class="button" onclick="addBox()" value="添加回报">
                    </div>
                    <div id="addBackBox" style="display:none;">
                        <form id="addBackForm">
                            <ul class="user_info_ul">
                                <input type="hidden" name="project" value="${data.id}">
                                <li class="fix">
                                    <p class="_title l">支持金额</p>
                                    <p class="l">
                                        <input name="amount" type="number">
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <p class="_title l">内容</p>
                                    <p class="l">
                                        <input name="content">
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <p class="_title l">人数</p>
                                    <p class="l">
                                        <input name="allow" type="number">
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <p class="_title l">回馈日期</p>
                                    <p class="l">
                                        <input name="back_date" type="date">
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li><p class="_title l" id="bb">是否邮寄</p>
                                    <p class="l">
                                        <select name="post">
                                            <option value="0">实物回报</option>
                                            <option value="1">虚拟回报</option>
                                        </select>
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <input type="button" id="addBackBtn" class="button" value="提交">
                                </li>
                            </ul>
                        </form>
                    </div>
                    <div style="margin-top: 20px">
                        <div class="common_title fix">
                            <span class="l">回归列表</span>
                            <a href="#" class="complete r"></a>
                        </div>
                        <table style="margin-top: 20px">
                            <thead>
                            <th>内容</th>
                            <th>回馈日期</th>
                            <th>支持金额</th>
                            <th>允许人数</th>
                            <th>是否邮寄</th>
                            <th>项目id</th>
                            </thead>
                            <tbody id="backs">

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-hide">
                    <div>
                        <input type="button" class="button" onclick="updateBox()" value="更新">
                    </div>
                    <div id="addUpdateBox" style="display:none;">
                        <form id="addUpdateForm">
                            <ul class="user_info_ul">
                                <input type="hidden" name="project" value="${data.id}">
                                <li class="fix">
                                    <p class="_title l">内容</p>
                                    <p class="l">
                                        <textarea name="update_content"></textarea>
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <input type="button" id="addUpdateBtn" class="button" value="提交">
                                </li>
                            </ul>
                        </form>
                    </div>
                    <div style="margin-top: 20px">
                        <div class="common_title fix">
                            <span class="l">更新列表</span>
                            <a href="#" class="complete r"></a>
                        </div>
                        <div class="update-container" style="margin-top: 20px">
                            <ul class="update-list" id="updates">

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {

        var li_a = $(".tab-menu ul li a");
        li_a.click(function () {
            $(this).addClass("tab-selected");
            $(this).parent().siblings().children().removeClass("tab-selected");
            var index = li_a.index(this);
            $(".tab-box > div").eq(index).show().siblings().hide();
        });

    });

    function showFold(e){
        $(e).nextAll(".update-item-content").slideToggle(1000);
    }

    $(document).ready(function () {
        getBacks();
        getUpdates();

        $("#addBackBtn").click(function () {
            $.ajax({
                type: 'post',
                async: false,
                url: '${ctp}/doAddBack',
                dataType: 'json',
                data: $("#addBackForm").serialize(),

                success: (function (result) {
                    var flag = parseInt(result.flag);
                    var msg = result.msg;
                    if (flag == 1) {
                        layer.msg(msg);
                        window.location.reload();
                    }
                })
            })

            getBacks();
        });

        $("#addUpdateBtn").click(function () {
            $.ajax({
                type: 'post',
                async: false,
                url: '${ctp}/doAddUpdate',
                dataType: 'json',
                data: $("#addUpdateForm").serialize(),

                success: (function (result) {
                    var flag = parseInt(result.flag);
                    var msg = result.msg;
                    if (flag == 1) {
                        layer.msg(msg);
                        window.location.reload();
                    }
                })
            })

            getUpdates();
        })
    });

    function addBox() {
        $("#addBackBox").slideToggle();
    }


    function getBacks() {
        var url = window.location.href;
        var str = {};
        str = url.split("-");
        var id = str[1];
        console.log(id);
        $.ajax({
            type: 'GET',
            async: false,
            url: '${ctp}/doGetBacks-' + id,
            dataType: 'json',
            data: null,
            success: (function (result) {
                var flag = parseInt(result.flag);
                var msg = result.msg;
                var data = result.data;
                console.log("data:")
                console.log(data);
                if (flag == 1) {
                    $("#backs").empty();
                    console.log("babcks:")
                    console.log($("#backs"));
                    if (data.length > 0) {
                        console.log(data.length);
                        for (var i = 0; i < data.length; i++) {
                            $("#backs").append(
                                "<tr>" +
                                "<td>" + data[i]["content"] + "</td>" +
                                "<td>" + (data[i].compensation == 1 ? "/" : data[i]["backDate"]) + "</td>" +
                                "<td>" + (data[i].compensation == 1 ? "/" : data[i]["amount"]) + "</td>" +
                                "<td>" + (data[i].compensation == 1 ? "/" : data[i]["allow"]) + "</td>" +
                                "<td>" + (data[i].post == 1 ? "Y" : "N") + "</td>" +
                                "<td>" + (data[i].compensation == 1 ? "N" : "Y") + "</td>" +
                                "</tr>"
                            );

                        }
                    }
                } else if (flag == 0) {
                    alert(msg);
                }
            })
        })
    }


    function updateBox() {
        $("#addUpdateBox").slideToggle();
    }

    function getUpdates() {
        var url = window.location.href;
        var str = {};
        str = url.split("-");
        var id = str[1];
        console.log(id);
        $.ajax({
            type: 'GET',
            async: false,
            url: '${ctp}/doGetUpdate-' + id,
            dataType: 'json',
            data: null,
            success: (function (result) {
                var flag = parseInt(result.flag);
                var msg = result.msg;
                var data = result.data;
                console.log(data);
                if (flag == 1) {
                    $("#updates").empty();
                    console.log($("#updates"));
                    if (data.length > 0) {
                        console.log(data.length);
                        for (var i = 0; i < data.length; i++) {
                            $("#updates").append(
                                "<li class=\"update-item\"> " +
                                "<a class=\"a_fold\" href=\"javascript:void(0)\" onclick=\"showFold(this)\">·</a> " +
                                "<div class=\"update-item-title\">" +
                                "<h3>"+data[i].project.user.username+"</h3>"+
                                "<p>"+data[i].updateTime+"</p>" +
                                "</div> " +
                                "<div class=\"update-item-content\">" +
                                "<div>"+data[i].updateContent+"</div>"+
                                "</div>"+
                                "</div>"+
                                "</li>"

                            );

                        }
                    }
                } else if (flag == 0) {
                    alert(msg);
                }
            })
        })
    }


</script>
</html>
