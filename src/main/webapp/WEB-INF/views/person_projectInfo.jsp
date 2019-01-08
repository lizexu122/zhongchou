<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <title>项目详细信息</title>
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
            <p>项目详细信息</p>
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
                        <p class="_title l">类别</p>
                        <p class="l">
                            <span>${data.category.name}</span>
                        </p>
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
                        <p class="_title l">截至时间</p>
                        <p class="l">
                            ${data.endTime}
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
                        <p class="_title l">状态</p>
                        <p class="l">
                            <span>
                                <c:if test="${data.status eq '0'}">未到期</c:if>
                                <c:if test="${data.status eq '1'}">已到期</c:if>
                                <c:if test="${data.status eq '2'}">未完成</c:if>
                                <c:if test="${data.status eq '3'}">已完成</c:if>
                            </span>
                        </p>
                        <div style="clear: both"></div>
                    </li>
                </ul>
            </div>
            <hr>
            <div class="tab-menu" style="height: 40px;font-size: 26px">
                <ul>
                    <li><a class="tab-selected"></a></li>
                    <li><a href="javascript:void(0);">更新项目</a></li>
                </ul>
            </div>
            <div class="tab-box" style="margin-top: 30px">
                <div>
                    <div id="addBackBox" style="display:none;">
                        <form id="addBackForm">
                            <ul class="user_info_ul">
                                <input type="hidden" name="project" value="${data.id}">
                                <li class="fix">
                                    <p class="_title l">amount</p>
                                    <p class="l">
                                        <input name="amount" type="number">
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <p class="_title l">content</p>
                                    <p class="l">
                                        <input name="content">
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <p class="_title l">allow</p>
                                    <p class="l">
                                        <input name="allow" type="number">
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <p class="_title l">back date</p>
                                    <p class="l">
                                        <input name="back_date" type="date">
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li><p class="_title l" id="bb">post</p>
                                    <p class="l">
                                        <select name="post">
                                            <option value="0">实物回报</option>
                                            <option value="1">虚拟回报</option>
                                        </select>
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li>
                                    <input type="button" id="addBackBtn" class="button" value="submit">
                                </li>
                            </ul>
                        </form>
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
                       <p>更新列表</p>
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
        getUpdates();


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





    function updateBox() {
        $("#addUpdateBox").slideToggle();
    }

    function getUpdates() {
        var url = window.location.href;
        var str = {};
        str = url.split("-");//分割字符串
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
                                "<h3>"+data[i ].project.user.username+"</h3>"+
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
