<%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/21
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>

    <style type="text/css">
        .font_1{
            /*font-family: 黑体;*/
            font-size: 18px;
        }
        .font_2_1{
            font-family: 仿宋;
            font-size: 15px;
            font-style: italic;
            color: red;
        }
        .font_2_2{
            font-family: 仿宋;
            font-size: 15px;
            font-style: italic;
            color: darkgray;
        }
        td{
            width: 100px;
        }
        form .txt{
            height: 25px;
            font-family: 宋体;
            font-size: 15px;
        }
        table {
            border-collapse: separate;
            border-spacing: 10px;
        }
        .sub_btn{
            font-size: 18px;
            width: 80px;
            height: 40px;
            background-color: azure;
        }
    </style>
    <script type="text/javascript" src="../../static/script/jquery.min.js"></script>
    <script type="text/javascript">
        $(function (){
            var flag_uname = false;
            var flag_pwd1 = false;
            var flag_pwd2 = false;
            var flag_code = false;

            $("#username").blur(function (){
                var patt = /^\w{5,12}$/;
                var $checkname = $("#checkname");
                if(patt.test( $("#username").val() )){
                    var flag = true;
                    $.ajax({
                        url:"http://localhost:8080/ShopSystem/ajax_UsernameServlet",
                        type:"get",
                        data:"username="+$("#username").val(),//数据格式！！！
                        async:false,                          //同步执行
                        success: function (res){
                            if(res == "false") {
                                // alert("该用户名已存在！");
                                $checkname.html("用户名存在！");
                                $checkname.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                                flag_uname = false;
                                flag = false;
                            }
                        },
                        dataType:"text"});

                    if(flag){
                        flag_uname = true;
                        $checkname.html("用户名合法");
                        $checkname.css({"color": "darkgray","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                    }
                }else {
                    flag_uname = false;
                    $checkname.html("用户名非法");
                    $checkname.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                }
            });
            $("#pwd1").blur(function (){
                var patt = /^\w{5,12}$/;
                var $checkpwd1 = $("#checkpwd1");
                if(patt.test( $("#pwd1").val() )){
                    flag_pwd1 = true;
                    $checkpwd1.html("密码合法");
                    $checkpwd1.css({"color": "darkgray","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                }else {
                    flag_pwd1 = false;
                    $checkpwd1.html("密码非法");
                    $checkpwd1.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                }
            });
            $("#pwd2").blur(function (){
                var patt = /^\w{5,12}$/;
                var $checkpwd2 = $("#checkpwd2");
                if(patt.test( $("#pwd2").val() )){
                    if($("#pwd1").val() == $("#pwd2").val()){
                        flag_pwd2 = true;
                        $checkpwd2.html("密码一致");
                        $checkpwd2.css({"color": "darkgray","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                    } else {
                        flag_pwd2 = false;
                        $checkpwd2.html("密码不一致");
                        $checkpwd2.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                    }
                }else {
                    flag_pwd2 = false;
                    $checkpwd2.html("密码非法");
                    $checkpwd2.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                }
            });

            $("#_img").click(function (){
                var date = new Date();
                this.src="http://localhost:8080/ShopSystem/code?"+date.getTime();
            });
            $("#code").blur(function (){
                $.ajax({
                    url:"http://localhost:8080/ShopSystem/ajax_Code",
                    type:"get",
                    data:"code="+$("#code").val(),//数据格式！！！
                    sync:false,
                    success: function (data){
                        if(data == "false"){
                            flag_code = false;
                            alert("验证码错误！");
                        }else{
                            flag_code = true;
                        }
                    },
                    dataType:"text"
                });
            });

            $(".sub_btn").click(function (){
                if(flag_uname && flag_pwd1 && flag_pwd2 && flag_code){
                    alert("注册成功！快去登录吧！");
                } else {
                    alert("请输入格式正确的信息！");
                    return false;
                }
            });
        })
    </script>
</head>
<body  style="background: url(../../static/img/background2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<h1 align="center">用户注册</h1>
<form method="post" action="/ShopSystem/registerServlet">
    <table align="center">
        <tr>
            <td class="font_1">用户名:</td>
            <td>
                <input class="txt" type="text" name="username" id="username" placeholder="请输入用户名" onblur="checkName()">
            </td>
            <td ><span id="checkname"></span></td>
        </tr>
        <tr>
            <td class="font_1">密码:</td>
            <td>
                <input class="txt" type="password" name="pwd1" id="pwd1" placeholder="请输入密码" onblur="checkPwd1()">
            </td>
            <td><span id="checkpwd1"></span></td>
        </tr>
        <tr>
            <td class="font_1">确认密码:</td>
            <td><input class="txt" type="password" name="pwd2" id="pwd2" placeholder="请再次输入密码" onblur="checkPwd2()"></td>
            <td><span id="checkpwd2"></span></td>
        </tr>
        <tr>
            <td class="font_1">地址：</td>
            <td ><input class="txt" type="address" name="address" id="address" placeholder="请输入地址"></td>
            <td><span></span></td>
        </tr>
        <tr>
            <td class="font_1">联系方式：</td>
            <td ><input class="txt" type="phone" name="phone" id="phone" placeholder="请输入联系电话"></td>
            <td><span></span></td>
        </tr>
        <tr>
            <td class="font_1">验证码:</td>
            <td><input type="text" class="txt" name="code" id="code"></td>
            <td><img id="_img" src="http://localhost:8080/ShopSystem/code"/></td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <input class="sub_btn" type="submit" value="注册" height="50">
            </td>
        </tr>
        <tr>
            <td align="left"><a href="../client/index.jsp">返回首页</a> </td>
            <td colspan="2" align="right"><a href="login.jsp">返回登录</a> </td>
        </tr>
    </table>
</form>

<div style="width: 100%; position: absolute; bottom: 0"><%@include file="../common/footer.jsp"%></div>
</body>
</html>
