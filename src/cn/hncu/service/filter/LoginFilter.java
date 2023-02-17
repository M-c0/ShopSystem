package cn.hncu.service.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        System.out.println(user);
        if (user==null) {
//            request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
            response.sendRedirect("http://localhost:8080/ShopSystem/pages/user/login.jsp");
        }
        filterChain.doFilter(request, response);//!!!!!!!!!!!!!!!!!!!!!
    }

    @Override
    public void destroy() {

    }
}
