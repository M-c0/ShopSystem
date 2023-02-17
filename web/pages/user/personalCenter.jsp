<%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/22
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <style>
        li{
            display: block;
            list-style: none;
        }
        li a {
            display:inline-block; /* 将链接设为块级元素 */
            width:200px; /* 设置宽度 */
            height:50px; /* 设置高度 */
            line-height:30px; /* 设置行高，将行高和高度设置同一个值，可以让单行文本垂直居中 */
            text-align:center; /* 居中对齐文字 */
            background: darkseagreen; /* 设置背景色 */
            color:#fff; /* 设置文字颜色 */
            text-decoration:none; /* 去掉下划线 */
        }
    </style>
    <script type="text/javascript" src="../../static/script/jquery.min.js"></script>
    <script type="text/javascript">

        $(function (){
            $("#logout").click(function (){
                var b = confirm("确定要退出登录吗？");
                if(b){
                    $.ajax({
                        url:"http://localhost:8080/ShopSystem/ajax_logoutServlet",
                        type:"get",
                        data:"",
                        success:function (){},
                        dataType:"text"
                    });
                    window.location.href="pages/client/index.jsp";
                }
            });

        });

    </script>
</head>
<body>
<%@include file="../common/header.jsp"%>
    <h1 align="center">欢迎回来，<%=request.getSession().getAttribute("user")%></h1>
    <table style="margin-left: 244px" >
        <tr>
            <td>
                <ul>
                    <li><a href="pages/user/accountSafety.jsp" target="show">账号安全</a></li>
                    <li><a href="pages/user/myAddress.jsp" target="show">我的地址</a></li>
                    <li><a href="pages/user/myOrders.jsp" target="show">我的订单</a></li>
                    <li><a href="pages/user/shoppingCart.jsp" target="show">购物车</a></li>
                    <li><a id="logout" style="cursor:pointer">退出登录</a></li>
                </ul>
            </td>
            <td width="500"><iframe frameborder="0" name="show" scrolling="yes" width="800" height="500"></iframe></td>
        </tr>
    </table>
    <div style="width: 100%; position: absolute; bottom: 0"><%@include file="../common/footer.jsp"%></div>
</body>
</html>
