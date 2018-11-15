/**
 * Created by Penny on 2017/6/3.
 */
$(document).ready(function () {
    // 实现二级下拉菜单
    menus_dropDown();
    //遮罩式登录框
    login_boxDialog();
})

// 二级下拉菜单
function menus_dropDown() {
    $(".menu_nav>ul>li").mouseenter(function () {
        $(this).css("background-color","#113658");
        $(this).find(".a1").css("color","white");
        $(this).find(".menu_nav_sub").show();
    })
    $(".menu_nav>ul>li").mouseleave(function () {
        $(this).css("background-color","transparent");
        $(this).find(".a1").css("color","#00008B");
        $(this).find(".menu_nav_sub").hide();
    })
    $(".menu_nav_sub>li").mouseenter(function(){
        $(this).css("background-color","#113658");
        $(this).find(".a2").css("color","white");
    })
    $(".menu_nav_sub>li").mouseleave(function(){
        $(this).css("background-color","white");
        $(this).find(".a2").css("color","#00008B");
    })
}

//遮罩式登录框
function login_boxDialog() {
    $("#a_login").click(function(){
        $("#bs").show();
        $("#bd").show();
    })
    $("#a_loginClose").click(function () {
        $("#bs").hide();
        $("#bd").hide();
    })
}



//登录验证
function validateLogin() {

    checkReme();//记住账号和密码

    var useremail = document.getElementById("login-email").value;
    var password = document.getElementById("login-password").value;
    var ht1 = document.getElementById("hint1");
    if (useremail =="") {//账号是否为空
        ht1.innerHTML = "请输入账号！";
        return false;
    }else {//验证账号是否为邮箱格式
        var atPos=useremail.indexOf("@");
        var dotPos=useremail.lastIndexOf(".");
        if (atPos<1 || dotPos<atPos+2 || dotPos+2>=useremail.length){
            ht1.innerHTML="账号格式错误！";
            return false;
        }else if (password==""){
            ht1.innerHTML="请输入密码！";
            return false;
        }else return true;
    }
}

//记住账号和密码
function checkReme(){
    if(typeof(Storage)!="undefined"){
        if(document.getElementById("login-remember").checked){
                localStorage.accName = document.getElementById("login-email").value;
                localStorage.accPWD = document.getElementById("login-password").value;
        }else{
            localStorage.accName="";
            localStorage.accPWD="";
        }
    }else{
        alert("您的浏览器不支持客户端存储");
    }
}

// 网页加载时，初始化
function init(){
    if(typeof(Storage)!="undefined"){
         document.getElementById("login-email").value=localStorage.accName?localStorage.accName:"";
         document.getElementById("login-password").value=localStorage.accPWD?localStorage.accPWD:"";
    }
}
