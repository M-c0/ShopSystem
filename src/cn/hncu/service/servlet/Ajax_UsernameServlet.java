package cn.hncu.service.servlet;

import cn.hncu.dao.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Ajax_UsernameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        UserDaoImpl userDao = new UserDaoImpl();
        if(userDao.queryUserByUsername(req.getParameter("username"))!=null){
            resp.getWriter().write("false");
        }
    }
}
