package cn.hncu.service.servlet;

import cn.hncu.dao.UserDao;
import cn.hncu.dao.impl.UserDaoImpl;
import cn.hncu.domain.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String pwd = req.getParameter("pwd1");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        UserDaoImpl userDao = new UserDaoImpl();
        userDao.saveUser(new User(username, pwd, address, phone));
        resp.sendRedirect("http://localhost:8080/ShopSystem/pages/user/login.jsp");
    }
}
