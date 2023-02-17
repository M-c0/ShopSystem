<%@ page import="cn.hncu.dao.impl.UserDaoImpl" %>
<%@ page import="cn.hncu.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/24
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    </style>
    <script type="text/javascript" src="../../static/script/jquery.min.js"></script>
    <script type="text/javascript">
        $(function (){
            $("#sub_btn").click(function (){
                $.ajax({
                    url:"http://localhost:8080/ShopSystem/ajax_UpdateServlet",
                    type:"get",
                    data:"address="+$("#address").val()+"&update=address",
                    success:function (){
                        alert("修改成功！");
                        window.location.href="myAddress.jsp"
                    },
                    error:function (data){
                        alert(data);
                    },
                    dataType:"text"
                });
            });
        })
    </script>
</head>
<body>
<%
    UserDaoImpl userDao = new UserDaoImpl();
    User user = userDao.queryUserByUsername2((String) request.getSession().getAttribute("user"));
    String preAddress = user.getAddress();
%>

<h1></h1>
<h2 align="center">更新收货地址</h2>
    <table align="center">
        <tr>
            <td class="font_1">现用地址:</td>
            <td colspan="2"><%=preAddress%></td>
        </tr>
        <tr>
            <td class="font_1">新地址:</td>
            <td colspan="2">
                <input style="width: 250px; height: 30px" type="text" name="address" id="address" placeholder="请输入地址" >
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center"><input type="button" id="sub_btn" value="提交"></td>
        </tr>
    </table>

</body>
</html>
