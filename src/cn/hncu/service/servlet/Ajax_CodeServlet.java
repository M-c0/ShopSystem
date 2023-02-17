package cn.hncu.service.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Ajax_CodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        String code1 = req.getParameter("code");
        String code2 = (String)req.getSession().getAttribute("code");
        if(!code1.equals(code2)){
//            Map mp = new HashMap();
//            mp.put("code",false);
//            Gson gson = new Gson();
//            resp.getWriter().write(gson.toJson(mp));
            resp.getWriter().write("false");
            return;
        }
    }
}
