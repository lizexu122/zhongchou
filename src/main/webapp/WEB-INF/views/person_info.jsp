<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <script src="${ctp}/js/user.js" type="text/javascript"></script>
    <title>- PersonCenter -</title>
    <style>
        #save, #csave {
            position: relative;
            left: -250px;
            top: -700px;
            left: 400px;
        }
        #chakan{
            position: relative;
            top: 70px;
        }


    </style>
</head>

<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div id="kk">
        <input type="button" id="chakan" class="button" value="查看信息" onclick="kk()"/>
    </div>
    <div class="r right_content">
        <div class="common minheight800" id="cyyq">
            <div class="tab-box">
                <div class="user_info fix">

                    <form id="formInfo" action="/doModifyUserInfo" method="post"
                          enctype="multipart/form-data">
                        <ul class="user_info_ul">

                            <li class="fix">
                                <p class="_title l">用户名</p>
                                <p class="l">
                                    <input type="text" name="username" id="inputUserName"
                                           value="${sessionScope.user.username}" class="info_text">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">电话</p>
                                <p class="l">
                                    <span>${sessionScope.user.mobile}</span>
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">邮箱</p>
                                <p class="l">
                                    <input type="email" class="info_text" id="inputEmail" name="email"
                                           placeholder="xxxxxx@xx.com" value="${sessionScope.user.email}">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">性别</p>
                                <p class="l">
                                    <label>
                                        <input type="radio" name="gender" value="female"
                                        <c:if test="${sessionScope.user.gender=='female'}">
                                                checked="true"
                                        </c:if>
                                        > 女士
                                    </label>
                                    <label>
                                        <input type="radio" name="gender" value="male"
                                        <c:if test="${sessionScope.user.gender=='male'}">
                                               checked
                                        </c:if>
                                        > 男士
                                    </label>

                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">地址</p>
                                <p class="l">
                                    <input type="text" class="info_text" value="${sessionScope.user.zone}"
                                           id="inputAddress"
                                           name="zone"/>
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="user_info_img fix">
                                <p class="_title l">头像</p>
                                <div class="l _img">
                                    <img src="${sessionScope.user.avatar}" alt="">
                                    <div class="am-form-group am-form-file">
                                        <input type="file" name="avatarUpload" id="pic"/>
                                    </div>
                                </div>
                                <div style="clear: both"></div>
                            </li>

                            <li class="fix">
                                <p class="_title l">个人简介</p>
                                <p class="l">
                                    <textarea class="info_text" name="intro" value="${sessionScope.user.intro}"
                                              id="inputInformation"></textarea>
                                </p>
                                <div style="clear: both"></div>
                            </li>
                        </ul>
                        <div class="tc">
                            <input type="button" id="save" class="button" value="编辑资料" onclick="modify()"/>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {

        var li_a = $(".tab-menu ul li a");
        li_a.click(function () {
            $(this).addClass("tab-selected");
            $(this).parent().siblings().children().removeClass("tab-selected");
            var index = li_a.index(this);
            $(".tab-box > div").eq(index).show().siblings().hide();
        });
    });

    function modify() {
        var user = {};
        user.userName = document.getElementById("inputUserName").value;
        user.email = document.getElementById("inputEmail").value;
        user.zone = document.getElementById("inputAddress").value;
        user.intro = document.getElementById("inputInformation").value;
        var aa = /^[a-zA-Z0-9]{6,12}$/;
        var bb = /^[a-z0-9]{18}$/;
        if (user.userName) {

        } else {
            layer.msg('用户名不能为空');
            return false;
        }
        if (user.userName.length >= 15) {
            layer.msg('用户名要小于等于15位');
            return false;
        }
        if (user.email) {

        } else {
            layer.msg('邮箱不能为空');
            return false;
        }



        var formData = new FormData($("#formInfo")[0]);
        $.ajax({
            type: 'POST',
            async: false,
            url: '${ctp}/doModifyUserInfo',
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: (function (result) {
                var flag = result.flag;
                var msg = result.msg;
                if (flag == 1) {
                    layer.msg(msg);
                    window.location.reload();
                } else {
                    layer.msg(msg);
                }
            })
        })
    }
  $("#chakan").click(function(){
     $("#cyyq").slideToggle();
  });




</script>
</html>