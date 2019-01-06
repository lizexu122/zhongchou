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
    .input-val {
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
        top: 80px;
        left: -290px;
    }
    #canvas {
        vertical-align: middle;
        box-sizing: border-box;
        border: 1px solid #ddd;
        cursor: pointer;
        font-size: 1.4rem;
        font-weight: 300;
        height: fit-content;
        padding: 0.75rem 1.2rem;
        position: relative;
        top: 80px;
        left: -280px;
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
                        <%--<input  type="text"   id="input1" />--%>
                        <%--<input type="text" onclick="createCode()" readonly="readonly" id="checkCode" class="unchanged" style="width: 80px"  /><br />--%>
                        <input type="text" value="" placeholder="请输入验证码" class="input-val">
                        <canvas id="canvas" width="100" height="30"></canvas>
                        <br><br>
                            <button type="button" class="tm-btn-subscribe" id="ctn">注册</button>

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
//     function createCode()
//     {
//         code = "";
//         var codeLength = 4;//验证码的长度
//         var checkCode = document.getElementById("checkCode");
//         var selectChar = new Array(0,1,2,3,4,5,6,7,8,9);//所有候选组成验证码的字符，当然也可以用中文的
//
//         for(var i=0;i<codeLength;i++)
//         {
//
//
//             var charIndex = Math.floor(Math.random()*10);
//             code +=selectChar[charIndex];
//
//
//         }
// //       alert(code);
//         if(checkCode)
//         {
//             checkCode.className="code";
//             checkCode.value = code;
//         }
//
//     }

$(function(){
    var show_num = [];
    draw(show_num);
    $("#canvas").on('click',function(){
        draw(show_num);
    })
    $("#ctn").on('click',function(){
        var val = $(".input-val").val().toLowerCase();
        var num = show_num.join("");
        if(val==''){
            alert('请输入验证码！');
        }else if(val == num){
            alert('提交成功！');
            $(".input-val").val('');
            // draw(show_num);
            cf();
        }else{
            alert('验证码错误！请重新输入！');
            $(".input-val").val('');
            // draw(show_num);
        }
    })
})
//生成并渲染出验证码图形
function draw(show_num) {
    var canvas_width=$('#canvas').width();
    var canvas_height=$('#canvas').height();
    var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
    var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
    canvas.width = canvas_width;
    canvas.height = canvas_height;
    var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
    var aCode = sCode.split(",");
    var aLength = aCode.length;//获取到数组的长度
    for (var i = 0; i < 4; i++) { //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
        var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
        // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
        var deg = Math.random() - 0.5; //产生一个随机弧度
        var txt = aCode[j];//得到随机的一个内容
        show_num[i] = txt.toLowerCase();
        var x = 10 + i * 20;//文字在canvas上的x坐标
        var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
        context.font = "bold 23px 微软雅黑";
        context.translate(x, y);
        context.rotate(deg);
        context.fillStyle = randomColor();
        context.fillText(txt, 0, 0);
        context.rotate(-deg);
        context.translate(-x, -y);
    }
    for (var i = 0; i <= 5; i++) { //验证码上显示线条
        context.strokeStyle = randomColor();
        context.beginPath();
        context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
        context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
        context.stroke();
    }
    for (var i = 0; i <= 30; i++) { //验证码上显示小点
        context.strokeStyle = randomColor();
        context.beginPath();
        var x = Math.random() * canvas_width;
        var y = Math.random() * canvas_height;
        context.moveTo(x, y);
        context.lineTo(x + 1, y + 1);
        context.stroke();
    }
}
//得到随机的颜色值
function randomColor() {
    var r = Math.floor(Math.random() * 256);
    var g = Math.floor(Math.random() * 256);
    var b = Math.floor(Math.random() * 256);
    return "rgb(" + r + "," + g + "," + b + ")";
}
</script>
</body>

</html>
