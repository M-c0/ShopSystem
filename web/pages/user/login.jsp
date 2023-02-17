<%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/20
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+contextPath+"/";
%>
<html>
<head>
<%--    <base href="basePath">--%>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <style type="text/css">
        .font_1{
            /*font-family: 黑体;*/
            font-size: 18px;
        }
        .font_2{
            color: darkgray;
            font-family: 仿宋;
            font-size: 15px;
            font-style:italic
        }
        .font_2_1{
            color: red;
            font-family: 仿宋;
            font-size: 15px;
            font-style:italic
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
            var flag_pwd = false;
            var flag_code = false;
            $("#username").blur(function (){
                var patt = /^\w{5,12}$/;
                var $checkname = $("#checkname");
                if(patt.test( $("#username").val() )){
                    flag_uname = true;
                    $checkname.html("用户名合法");
                    $checkname.removeClass();
                    $checkname.addClass("font_2");
                }else {
                    flag_uname = false;
                    $checkname.html("用户名非法");
                    $checkname.removeClass();
                    $checkname.addClass("font_2_1");
                    // $checkname.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                }
            });

            $("#pwd").blur(function (){
                var patt = /^\w{5,12}$/;
                var $checkpwd = $("#checkpwd");
                if(patt.test( $("#pwd").val() )){
                    flag_pwd = true;
                    $checkpwd.html("密码合法");
                    $checkpwd.removeClass();
                    $checkpwd.addClass("font_2");
                }else {
                    flag_pwd = false;
                    $checkpwd.html("密码非法");
                    $checkpwd.removeClass();
                    $checkpwd.addClass("font_2_1");
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
                    success: function (data){
                        if(data == "false") {
                            alert("验证码错误！");
                            flag_code = false;
                        }else{
                            flag_code = true;
                        }
                    },
                    dataType:"text"
                });
            });

            $(".sub_btn").click(function (){
                if(flag_code && flag_pwd && flag_uname){
                    var flag = true;
                    $.ajax({
                        url:"http://localhost:8080/ShopSystem/loginServlet",
                        type:"get",
                        data:"username="+$("#username").val()+"&pwd="+$("#pwd").val(),//数据格式！！！
                        async:false,                          //同步执行
                        success: function (res){
                            if(res == "false") {
                                alert("用户名或密码错误！");
                                flag = false;
                            }
                        },
                        dataType:"text"
                    });
                    return flag;
                }else {
                    if(!flag_code){
                        alert("验证码错误！")
                    }else if(!flag_uname || !flag_pwd){
                        alert("用户名或密码错误！");
                    }
                    return false;
                }
                // $.post("http://localhost:8080/ShopSystem/loginServlet",{"username":$("#username").val},function (res){
                //     if(res!=null){
                //         // $("form").submit();
                //         event.preventDefault();
                //     }
                // }, "text");
            });

        });
    </script>
</head>

<body style="background: url(../../static/img/background2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<h1 align="center">用户登录</h1>

<form action="http://localhost:8080/ShopSystem/loginServlet" method="post">
    <table align="center">
        <tr>
            <td class="font_1">用户名:</td>
            <td>
                <input class="txt" type="text" name="username" id="username" placeholder="请输入用户名">
            </td>
            <td><span id="checkname"></span></td>
        </tr>
        <tr>
            <td class="font_1">密码:</td>
            <td>
                <input class="txt" type="password" name="pwd" id="pwd" placeholder="请输入密码" >
            </td>
            <td><span id="checkpwd"></span></td>
        </tr>
        <tr>
            <td class="font_1">验证码:</td>
            <td><input type="text" class="txt" name="code" id="code"></td>
            <td><img id="_img" src="http://localhost:8080/ShopSystem/code"/></td>
        </tr>
        <tr>
            <td colspan="3" align="center"><input class="sub_btn" type="submit" value="登录" height="50"></td>
        </tr>
        <tr>
            <td align="left"><a href="../client/index.jsp">返回首页</a> </td>
            <td colspan="2" align="right"><a href="register.jsp">没有账号？注册一个</a> </td>
        </tr>

    </table>
</form>
<div style="width: 100%; position: absolute; bottom: 0"><%@include file="../common/footer.jsp"%></div>
</body>
</html>