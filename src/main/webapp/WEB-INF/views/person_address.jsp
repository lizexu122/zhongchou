<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Person Address</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
</head>

<body class="personal">
<jsp:include page="header.jsp"/>
<%--<jsp:include page="header.jsp "/>--%>
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="common minheight800">
            <div class="common_title fix">
                <span class="l">Personal Address</span>
                <a href="#" class="complete r"></a>
            </div>
            <div class="l" style="width: 55%">
                <form action="/doAddAddress" id="formAddress">
                    <div class="user_info fix">
                        <ul class="user_info_ul">
                            <li class="fix">
                                <p class="_title l">recipient</p>
                                <p class="l">
                                    <input type="text" id="inputRecipient" name="recipient"/>
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <div style="clear: both"></div>
                            <li class="fix">
                                <p class="_title l">zone</p>
                                <p class="l">
                                    <input type="text" id="inputZone" name="zone">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">postcode</p>
                                <p class="l">
                                    <input type="text" id="inputPostCode" name="postcode">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">detail</p>
                                <p class="l">
                                    <input id="inputTextarea" cols="30" rows="10" name="detail">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">phone</p>
                                <div class="l _img">
                                    <p class="l">
                                        <input type="text" name="phone" id="inputPhone"/>
                                    </p>
                                </div>
                                <div style="clear: both"></div>
                            </li>
                        </ul>
                        <div class="tc">
                            <input type="button" class="button" onclick="addAddress()" id="addAddressBtn"
                                   value="Add Address">
                            </input>
                        </div>
                    </div>
                </form>
            </div>
            <div id="addressList" class="addressList r">
            </div>
            <div style="background-color: #00b7ee">a beautiful day</div>
        </div>
    </div>
</div>
</body>
<script>

    $(document).ready(function () {
        getAddress();
    });


    function getAddress() {
        $.ajax({
            type: 'GET',
            async: false,
            url: '${ctp}/doGetAddress',
            dataType: 'json',
            data: null,
            success: (function (result) {
                var data = result.data;

                if (result.flag == 1) {
                    $("#addressList").empty();
                    for (var i = 0; i < data.length; i++) {
                        $("#addressList").append(
                            "<div class=\"box user-address\">" +
                            "<strong class=\"name el\">"+data[i].recipient+"</strong>" +
                            "<div class=\"text address\">"+data[i].postcode+"&nbsp;"+data[i].zone+"&nbsp;"+data[i].detail+"</div>" +
                            "<p class=\"user_phone\">"+data[i].phone+"</p>" +
                            "</div>")
                    }
                } else {
                    layer.msg("success");
                }
            })
        })
    };


    function addAddress() {
        var address = {};
        address.recipient = document.getElementById("inputRecipient").value;
        address.zone = document.getElementById("inputZone").value;
        address.postcode = document.getElementById("inputPostCode").value;
        address.detail = document.getElementById("inputTextarea").value;
        address.phone = document.getElementById("inputPhone").value;
        var bb = /^[0-9]{6}$/;


        if (address.recipient) {

        } else {
            layer.msg('收货人不能为空');
            return false;
        }

        if (address.detail) {

        } else {
            layer.msg('描述不能为空');
            return false;
        }
        if (address.postcode) {

        } else {
            layer.msg('邮政编码不能为空');
            return false;
        }
        if (!bb.test(address.postcode)) {
            layer.msg('邮政编码只能是6位数字');
            return false;
        }

        if (address.zone) {

        } else {
            layer.msg('地址不能为空');
            return false;
        }
        if (address.phone) {

        } else {
            layer.msg('手机号码不能为空');
            return false;
        }

        console.log(address);

        $.ajax({
            type: 'POST',
            async: false,
            url: '${ctp}/doAddAddress',
            dataType: 'json',
            data: address,
            success: (function (result) {
                if (result.flag == 1) {
                    layer.msg("success");
                } else {
                    layer.msg("fail");
                }
            })
        })

        getAddress();
    }


</script>
</html>