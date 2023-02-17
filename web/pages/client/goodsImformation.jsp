<%@ page import="cn.hncu.dao.impl.OrderDaoImpl" %>
<%@ page import="cn.hncu.domain.Goods" %>
<%@ page import="cn.hncu.dao.impl.ShoppingCartDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/23
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <style>
        *{
            margin: auto;
            padding: 0;
        }
        table{
            border-spacing: 50px;
            margin-left: 300px;
        }
        a {
            display:inline-block; /* 将链接设为块级元素 */
            width:100px; /* 设置宽度 */
            height:30px; /* 设置高度 */
            line-height:30px; /* 设置行高，将行高和高度设置同一个值，可以让单行文本垂直居中 */
            text-align:center; /* 居中对齐文字 */
            background: red; /* 设置背景色 */
            color:#fff; /* 设置文字颜色 */
            text-decoration:none; /* 去掉下划线 */
            border-right:1px solid #000
        }/* 在左侧加上分隔线 */
    </style>
    <script type="text/javascript" src="../../static/script/jquery.min.js"></script>
    <script type="text/javascript">
<%--        <%String username = (String) request.getSession().getAttribute("user");%>--%>
        var name = "<%=request.getSession().getAttribute("user")%>";
        function buyClick(){
            <%--alert("<%=username%>");--%>
            // alert(name);
            if(name!="null"){
                if (confirm("确认支付")){
                    var buy = document.getElementById("buy");
                    buy.href="buyOrAddCartServlet?goodsid=${requestScope.goods.id}&operate=buy";
                    buy.target="noshow";
                    alert("付款成功后购买成功！");
                }
            }else{
                window.location.href="pages/user/login.jsp";
            }
        }
        function addCartClick(){
            <%--var name = "<%=request.getSession().getAttribute("user")%>";--%>
            if(name!="null"){
                // $.ajax({
                //         url:"http://localhost:8080/ShopSystem/ajax_BuyOrAddCartServlet",
                //         type:"get",
                //         data:"operate=add",
                //         success:function (data){
                //             alert("添加成功！");
                //         },
                //         dataType:"text"
                //     });
                alert("已添加到购物车！");
            }else{
                window.location.href="pages/user/login.jsp";
            }
        }
    </script>
</head>
<body>

<%@include file="../common/header.jsp"%>
<%--<jsp:include page="../common/header.jsp" />--%>
    <iframe name="noshow" width="0"height="0" hidden="hidden"></iframe>
    <table>
        <tr>
            <td rowspan="3" align="center"><img src=${requestScope.goods.imgPath}> </td>
            <td colspan="2" ><div id="name">${requestScope.goods.name}</div></td>
        </tr>
        <tr>
            <td><div id="describe">${requestScope.goods.type}</div></td>
            <td></td>
        </tr>
        <tr>
            <td>
                <select>
                    <option>选择款式</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                </select>
            </td>
            <td><div id="price" style="color: red">￥${requestScope.goods.price}</div></td>
        </tr>
        <tr>
            <td></td>
            <td><a style="cursor: pointer" onclick="buyClick()" id="buy">购买</a></td>
            <td><a href="buyOrAddCartServlet?goodsid=${requestScope.goods.id}&operate=add" target="noshow" onclick="addCartClick()">添加到购物车</a></td>

<%--            <td><button id="buy" onclick="buyClick()">立即购买</button></td>--%>
<%--            <td><button id="addCart" onclick="addCartClick()">加入购物车</button></td>--%>
        </tr>
    </table>

<div style="width: 100%; position: absolute; bottom: 0"><%@include file="../common/footer.jsp"%></div>
</body>
</html>
