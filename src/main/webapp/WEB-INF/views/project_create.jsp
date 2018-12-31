<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>创建项目
    </title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
</head>
<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="common minheight800">
            <div class="common_title fix">
                <a href="#" class="complete r"></a>
            </div>
            <form action="/doCreateProject" id="createForm" enctype="multipart/form-data">
                <div class="user_info fix">
                    <ul class="user_info_ul">
                        <li class="fix">
                            <p class="_title l">主题</p>
                            <p class="l">
                                <input type="text" name="title" class="info_text" id="inputTitle">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">联系姓名</p>
                            <p class="l">
                                <input type="text" name="contact_name" class="info_text" id="inputContaceName">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <div style="clear: both"></div>
                        <li class="fix">
                            <p class="_title l">联系电话</p>
                            <p class="l">
                                <input type="text" name="contact_phone" class="info_text" id="inputContact">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">目录</p>
                            <p class="l">
                                <select id="category" name="category_id"></select>
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="user_info_img fix">
                            <p class="_title l">封面</p>
                            <div class="l _img">
                                <div class="am-form-group am-form-file">
                                    <input type="file" name="coverUpload" id="inputCover">
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">目标金额</p>
                            <p class="l">
                                <input type="number" class="info_text" name="goal_amount" id="inputGoalAmount">
                            </p>
                            <div style="clear: both"></div>
                        </li>

                        <li class="fix">
                            <p class="_title l">截至时间</p>
                            <p class="l">
                                <input type="date" name="end_time" class="info_text" id="inputEndTime"></p>
                            <div style="clear: both"></div>
                        </li>
                        <p id="shou">收款方式:</p>
                        <img id="er" src="${ctp}/image/erweima.png" >
                    </ul>

                    <div class="tc">
                        <button type="button" class="button" id="fa" onclick="fabu()">发布
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>


</body>
<script type="text/javascript">

    var ue_param = {//工具栏配置项
        toolbars: [['cleardoc', 'selectall', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'strikethrough', 'fontsize',
            'forecolor', 'fontfamily', 'link', '|', 'justifyleft',
            'justifycenter', 'justifyright', '|', 'horizontal',
            'pasteplain', '|', '|', 'removeformat', '|', 'charts', '|', 'simpleupload']

        ],
        autoHeightEnabled: false,
        autoFloatEnabled: false,
        elementPathEnabled: false,
        relativePath: true,
        pasteplain: true,
        saveInterval: 60 * 60 * 24,
        wordCount: false,

    }

    function fabu() {
        var project = {};
        project.title = document.getElementById("inputTitle").value;
        project.goal_amount = document.getElementById("inputGoalAmount").value;
        project.end_time = document.getElementById("inputEndTime").value;
        project.contact_name = document.getElementById("inputContaceName").value;
        project.contact_phone = document.getElementById("inputContact").value;
        if (project.title) {

        } else {
            layer.msg("项目标题不能为空");
            return false;
        }

        if (project.goal_amount) {

        } else {
            layer.msg("目标金额不能为空");
            return false;
        }
        if (project.end_time) {

        } else {
            layer.msg("结束时间不能为空");
            return false;
        }

        if (project.contact_name) {

        } else {
            layer.msg("联系人姓名不能为空");
            return false;
        }
        if (project.contact_phone) {

        } else {
            layer.msg("联系人电话不能为空");
            return false;
        }
        window.onload = function () {
            var myDate = new Date();
            if (project.end_time < myDate) {
                document.getElementById("inputStatus").value = 1;
            }
        }

        var formData = new FormData($("#createForm")[0]);
        $.ajax({
            type: 'POST',
            async: false,
            url: '${ctp}/doCreateProject',
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: (function (result) {
                if (result.flag == 1) {
                    // document.getElementById('nextPage').addEventListener("click",showAtRight('personCenter/personProject'));
                    // top.location.href = "/personCenter/personProject";
                    window.location.href = "${ctp}/personCenter/personProject";
                } else {
                    layer.msg(result.msg);
                }
            })
        })
    }

    $(document).ready(function () {
        $.ajax({
            type: 'Get',
            async: true,
            url: '${ctp}/doShowCategory',
            dataType: 'json',
            data: null,
            success: (function (result) {
                var flag = parseInt(result.flag);
                var msg = result.msg;
                var data = result.data;

                if (flag == 1) {
                    if (data.length > 0) {
                        var drillSelect = document.getElementById("category");
                        drillSelect.options.length = 0;
                        $("#category").append("<option value=''>--请选择--</option>");
                        for (var i = 0; i < data.length; i++) {
                            $("#category").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
                        }
                    }
                }
                else if (flag == 0) {
                    alert(msg);
                }
            })
        })
    })

</script>
</html>
