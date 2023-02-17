<%@ page import="cn.hncu.dao.impl.OrderDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.hncu.domain.Order" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.hncu.dao.impl.GoodsDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/24
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border-style: solid;
            border-color: #666666;
            border-width: 1px;
            border-spacing: 0px;
        }
        th{
            width: 120px;
            border-style: solid;
            border-color: #666666;
            border-width: 1px;
        }
        td{
            width: 120px;
            border-style: solid;
            border-color: #666666;
            border-spacing: 0px;
            border-width: 1px;
            height: 50px;
        }
    </style>
</head>
<body>
<h1></h1>
<h2 align="center">我的订单</h2>
    <table align="center" cellspacing="0" cellpadding="0">
        <tr>
            <th>订单编号</th>
            <th>下单时间</th>
            <th>商品名称</th>
            <th>商品价格</th>
            <th>收货地址</th>
            <th>联系电话</th>
        </tr>
        <%
            OrderDaoImpl orderDao = new OrderDaoImpl();
            ArrayList orders = orderDao.queryOrderByUname((String) request.getSession().getAttribute("user"));
            int len = orders.size();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
            GoodsDaoImpl goodsDao = new GoodsDaoImpl();
            for(int i = 0; i<len; i++){
                Order order = (Order)orders.get(i);
        %>
        <tr>
            <td align="center"><%=order.getId()%></td align="center">
            <td align="center"><%=simpleDateFormat.format(new Date(Long.valueOf(order.getId())))%></td>
            <td align="center"><%=goodsDao.queryGoodsById(order.getGoodsId()).getName()%></td>
            <td align="center"><%=order.getPrice()%></td>
            <td align="center"><%=order.getAddress()%></td>
            <td align="center"><%=order.getPhone()%></td>
        </tr>
        <%}%>
    </table>
</body>
</html>
