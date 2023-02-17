package cn.hncu.service.servlet;

import cn.hncu.dao.impl.UserDaoImpl;
import cn.hncu.domain.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.queryUserByUsername(req.getParameter("username"));
        if(user!=null){
            if(user.getPassword().equals(req.getParameter("pwd"))){
                req.getSession().setAttribute("user",user.getName());
//                req.getRequestDispatcher("http://localhost:8080/ShopSystem/pages/client/index.jsp");
                resp.sendRedirect("http://localhost:8080/ShopSystem/pages/client/index.jsp");
                return;
            }else {
                resp.getWriter().write("false");
                return ;
            }
        }else{
            resp.getWriter().write("false");
            return;
        }
    }
}
