<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Order Detail</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
</head>
<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="common minheight800">
            <div class="common_title fix">
                <span class="l">Order Detail</span>
                <a href="#" class="complete r"></a>
            </div>
            <div class="order_detail">
                <div class="check fix">
                    <div class="check_left l">
                        OrderID
                    </div>
                    <div class="check_right l">
                        ${data.id}
                    </div>
                </div>
                <div class="check fix">
                    <div class="check_left l">
                        Back Content
                    </div>
                    <div class="check_right l">
                        ${data.projectBack.content}
                    </div>
                </div>
                <div class="check fix">
                    <div class="check_left l">
                        Back Date
                    </div>
                    <div class="check_right l">
                        ${data.projectBack.backDate}
                    </div>
                </div>
                <c:if test="${data.address!=null && data.address!=''}">
                    <div class="check fix">
                        <div class="check_left l">
                            Address
                        </div>
                        <div class="check_right l">
                                ${data.address.zone}&nbsp;${data.address.detail}
                        </div>
                    </div>
                </c:if>
                <div class="check fix">
                    <div class="check_left l">
                        Create Time
                    </div>
                    <div class="check_right l">
                        ${data.createTime}
                    </div>
                </div>
                <div class="check fix">
                    <div class="check_left l">
                        Project ID
                    </div>
                    <div class="check_right l">
                        ${data.project.id}
                    </div>
                </div>
                <div class="check fix">
                    <div class="check_left l">
                        Project Title
                    </div>
                    <div class="check_right l">
                        ${data.project.title}
                    </div>
                </div>
                <div class="check fix">
                    <div class="check_left l">
                        Project Creator
                    </div>
                    <div class="check_right l">
                        ${data.user.username}
                    </div>
                </div>
                <div class="check fix">
                    <div class="check_left l">
                        Status
                    </div>
                    <div class="check_right l">
                        <c:if test="${data.status==0}">
                            Submitted
                        </c:if>
                        <c:if test="${data.status==-1}">
                            Withdrawn
                        </c:if>
                        <c:if test="${data.status==-2}">
                            Refund
                        </c:if>

                    </div>
                </div>
                <div class="check fix">
                    <div class="check_left l m-main">
                        Total Amount
                    </div>
                    <div class="check_right l m-main fz-20">
                        $${data.amount}
                    </div>
                </div>
                <c:if test="${data.status==0}">
                    <div class="check fix">
                        <div style="margin: 10px 10%;">
                            <input type="button" class="button" id="cancelBtn" value="CANCEL">
                        </div>
                    </div>
                </c:if>
                <c:if test="${data.status!=0}">
                    <div class="check fix">
                        <div style="margin: 20px 10%;">
                            <input type="button" style="background-color: gray" class="button" value="INVALID" disabled>
                        </div>
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    $(function () {
        $("#cancelBtn").click(function () {
            $.ajax({
                url: "${ctp}/doCancelOrder-${data.id}",
                // data:
                // dataType:"TEXT",
                type: "GET",
                success: function (result) {
                    if (result.flag == 1) {
                        alert("success");
                        window.location.href = "${ctp}/personCenter/personOrder"
                    }
                    else {
                        alert("error");
                    }
                }
            });
        })
    })
</script>
</html>