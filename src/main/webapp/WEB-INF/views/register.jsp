<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="${ctp}/css/Login&Register.css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <%--<script type="text/javascript" src="${ctp}/js/loadClickChange.js"></script>--%>
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
</head>
<style type="text/css">
    #register {
        position: relative;
        top: 50px;
    }
    #qq {
        position: relative;
        top: -550px;
        left: -350px;
        border-bottom: black 1px solid;
    }
    #input1 {
        color: black;
        border-radius: .5rem;
        background-color: transparent;
        border: 1px solid black;
        padding-top: 10px;
        padding-bottom: 10px;
        font-size: 1.4rem;
        font-weight: 300;
        height: fit-content;
        padding: 0.75rem 1.2rem;
        position: relative;
        top: 180px;
        left: -290px;
    }
    #checkCode {

        color: black;
        border-radius: .5rem;
        background-color: transparent;
        border: 1px solid black;
        padding-top: 10px;
        padding-bottom: 10px;
        font-size: 1.4rem;
        font-weight: 300;
        height: fit-content;
        position: relative;
        top: 100px;
        left: -582px;
    }
    #gg{
        position:relative;
        top:100px;
        left:700px;
    }
</style>
<body  onload="createCode()">

<div id="RegisterPart">
    <div class="row cb-slideshow-text-container ">
        <div class="tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">
            <header class="mb-5">   <h1 id="register">注册</h1></header>
            <br/>
            <P class="mb-5">如果你已经拥有一个账户,请点击登录.
                <a id="Login" rel="nofollow" href='login' target="_parent">点击并且登录 </a>
                谢谢您的支持!</P>
            <br>
            <form action="/doRegister" method="post" class="subscribe-form" id="f1">
                <div class="row form-section">
                    <div class="col-md-7 col-sm-7 col-xs-7">

                        <input id="phone" name="mobile" type="tel" placeholder="电话"
                               required pattern="[0-9]{11}$" class="form-control"/>
                        <br><br>
                        <input name="password" type="password" class="form-control" id="newpassword"
                               placeholder="密码" pattern="^[a-zA-Z0-9]{6,12}$" required/>
                        <br><br>
                        <input name="ispassword" type="password" class="form-control" id="ispassword"
                               placeholder="重复密码"/>
                        <input  type="text"   id="input1" />
                        <input type="text" onclick="createCode()" readonly="readonly" id="checkCode" class="unchanged" style="width: 80px"  /><br />
                        <br><br>
                        <div class="container">
                            <button type="button" class="tm-btn-subscribe" onclick="cf()">注册</button>
                        </div>
                        <img id="qq" src="${ctp}/image/xx.png"/>
                        <img id="gg" src="${ctp}/image/gg.png"/>
                    </div>
                    <br>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="${ctp}/js/Login&Register.js"></script>
<script>
    function createCode()
    {
        code = "";
        var codeLength = 4;//验证码的长度
        var checkCode = document.getElementById("checkCode");
        var selectChar = new Array(0,1,2,3,4,5,6,7,8,9);//所有候选组成验证码的字符，当然也可以用中文的

        for(var i=0;i<codeLength;i++)
        {


            var charIndex = Math.floor(Math.random()*10);
            code +=selectChar[charIndex];


        }
//       alert(code);
        if(checkCode)
        {
            checkCode.className="code";
            checkCode.value = code;
        }

    }



</script>
</body>

</html>
