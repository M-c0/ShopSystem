package cn.hncu.service.servlet;

import cn.hncu.dao.ShoppingCartDao;
import cn.hncu.dao.impl.ShoppingCartDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteSCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String goodsid = req.getParameter("goodsid");
        System.out.println(username+"/"+goodsid);
        ShoppingCartDaoImpl shoppingCartDao = new ShoppingCartDaoImpl();
        shoppingCartDao.deleteShoppingCart(username, goodsid);
    }
}
