<%@ page import="cn.hncu.dao.impl.ShoppingCartDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.hncu.dao.impl.GoodsDaoImpl" %>
<%@ page import="cn.hncu.domain.Goods" %>
<%@ page import="cn.hncu.domain.ShoppingCart" %><%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/25
  Time: 11:19
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
    <script type="text/javascript" src="../../static/script/jquery.min.js"></script>
    <script type="text/javascript">
        var ops = document.getElementsByName("operate");
        var name = "<%=request.getSession().getAttribute("user")%>";
        function clickFun(id){
          // alert(id);
          $.ajax({
              url:"http://localhost:8080/ShopSystem/deleteSCartServlet",
              type:"get",
              data:"username="+name+"&goodsid="+id,//数据格式！！！
              success: function (res){
              },
              dataType:"text"
            });
          window.location.href="shoppingCart.jsp"
        }
    </script>
  </head>
  <body>
  <h1></h1>
  <h2 align="center">购物车</h2>

  <table align="center" cellspacing="0" cellpadding="0">
      <tr>
        <th></th>
        <th>商品名称</th>
        <th>商品价格</th>
        <th>操作</th>
      </tr>

    <%
      ShoppingCartDaoImpl shoppingCartDao = new ShoppingCartDaoImpl();
      ArrayList goods = shoppingCartDao.queryShopingCart((String) request.getSession().getAttribute("user"));
      int len = goods.size();
      GoodsDaoImpl goodsDao = new GoodsDaoImpl();
      for(int i = 0; i<len; i++){
        Goods g = goodsDao.queryGoodsById( ( (ShoppingCart)goods.get(i) ).getGoodsid() );
    %>
    <tr>
      <td align="center"><img src="<%=g.getImgPath()%>" height="100px" width="80px"></td>
      <td align="center"><%=g.getName()%></td>
      <td align="center"><%=g.getPrice()%></td>
      <td align="center"><div name="operate" onclick="clickFun(<%=g.getId()%>)" style="cursor: pointer; color: #b63e1a">删除</div></td>
    </tr>
    <%}%>

  </table>
  </body>
</html>
