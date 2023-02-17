<%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/24
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号安全</title>
    <style type="text/css">
        table{
            border-spacing: 10px;
        }
        td{
            width: 100px;
        }
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
    </style>
    <script type="text/javascript" src="../../static/script/jquery.min.js"></script>
    <script type="text/javascript">
        $(function (){
            $("#sub_btn").click(function (){
                var $checkpwd0 = $("#checkpwd0");
                $.ajax({
                    url:"http://localhost:8080/ShopSystem/ajax_UpdateServlet",
                    type:"get",
                    data:"pwd0="+$("#pwd0").val()+"&pwd1="+$("#pwd1").val()+"&update=password",
                    success:function (data){
                        if(data=="false"){
                            $checkpwd0.html("密码错误");
                            $checkpwd0.removeClass();
                            $checkpwd0.addClass("font_2_1");
                        }else if(data == "true"){
                            alert("修改成功，请重新登录！")
                            window.parent.location.href="login.jsp";
                        }
                    },
                    dataType:"text"
                });
            });
            $("#pwd1").blur(function (){
                var patt = /^\w{5,12}$/;
                var $checkpwd1 = $("#checkpwd1");
                if(patt.test( $("#pwd1").val() )){
                    $checkpwd1.html("密码合法");
                    $checkpwd1.css({"color": "darkgray","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                }else {
                    $checkpwd1.html("密码非法");
                    $checkpwd1.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                }
            });
            $("#pwd2").blur(function (){
                var patt = /^\w{5,12}$/;
                var $checkpwd2 = $("#checkpwd2");
                if(patt.test( $("#pwd2").val() )){
                    if($("#pwd1").val() == $("#pwd2").val()){
                        $checkpwd2.html("密码一致");
                        $checkpwd2.css({"color": "darkgray","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                    } else {
                        $checkpwd2.html("密码不一致");
                        $checkpwd2.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                    }
                }else {
                    $checkpwd2.html("密码非法");
                    $checkpwd2.css({"color": "red","font-family": "仿宋","font-size": "15px","font-style":"italic"});
                }
            });
        });
    </script>
</head>
<body>
    <h1></h1>
    <h2 align="center">修改密码</h2>
    <form>
        <table align="center">
            <tr>
                <td class="font_1">原密码:</td>
                <td>
                    <input class="txt" type="password" name="pwd0" id="pwd0" placeholder="请输入原密码">
                </td>
                <td><span id="checkpwd0"></span></td>
            </tr>
            <tr>
                <td class="font_1">密码:</td>
                <td>
                    <input class="txt" type="password" name="pwd1" id="pwd1" placeholder="请输入密码" >
                </td>
                <td><span id="checkpwd1"></span></td>
            </tr>
            <tr>
                <td class="font_1">确认密码:</td>
                <td>
                    <input class="txt" type="password" name="pwd2" id="pwd2" placeholder="请输入密码" >
                </td>
                <td><span id="checkpwd2"></span></td>
            </tr>
            <tr>
                <td colspan="3" align="center"><input type="button" id="sub_btn" value="提交"></td>
            </tr>
        </table>

    </form>
</body>
</html>
