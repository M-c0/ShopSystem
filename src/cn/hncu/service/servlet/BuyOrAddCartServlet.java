package cn.hncu.service.servlet;

import cn.hncu.dao.impl.OrderDaoImpl;
import cn.hncu.dao.impl.ShoppingCartDaoImpl;
import cn.hncu.domain.Goods;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BuyOrAddCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("operate");
        String username = (String) req.getSession().getAttribute("user");
        String goodsid = req.getParameter("goodsid");
        if(username==null){
            resp.sendRedirect("pages/user/login.jsp");
        }else{
            System.out.println(op);
            if(op.equals("buy")){
                OrderDaoImpl orderDao = new OrderDaoImpl();
                orderDao.addOrderById(goodsid, username);
            }else{
                ShoppingCartDaoImpl shoppingCartDao = new ShoppingCartDaoImpl();
                shoppingCartDao.addShoppingCart(username, goodsid);
            }
        }
    }
}
