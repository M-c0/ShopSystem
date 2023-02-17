package cn.hncu.service.servlet;

import cn.hncu.dao.impl.GoodsDaoImpl;
import cn.hncu.domain.Goods;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GoodsImfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("goodsid");
        System.out.println(id);
        GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();
        Goods goods = goodsDaoImpl.queryGoodsById(id);
        req.setAttribute("goods", goods);
        req.getRequestDispatcher("pages/client/goodsImformation.jsp").forward(req, resp);
    }
}
