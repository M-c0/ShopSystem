package cn.hncu.service.servlet;

import cn.hncu.dao.impl.UserDaoImpl;
import cn.hncu.domain.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Ajax_UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        String update = req.getParameter("update");
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.queryUserByUsername((String) req.getSession().getAttribute("user"));
        String name = (String) req.getSession().getAttribute("user");

        if(update.equals("password")){
            String pwd = req.getParameter("pwd0");
            if(!user.getPassword().equals(pwd)){
                resp.getWriter().write("false");
                return ;
            }else {
                String pwd1 = req.getParameter("pwd1");
                userDao.updateUser(pwd1, name, "password");
//            System.out.println(userDao.queryUserByUsername(name).getPassword());
                req.getSession().setAttribute("user",null);
                resp.getWriter().write("true");
            }
        }else {
            String address = req.getParameter("address");
            userDao.updateUser(address,name, "address");
        }

    }
}
