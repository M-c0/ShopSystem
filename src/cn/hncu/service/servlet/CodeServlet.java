package cn.hncu.service.servlet;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class CodeServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        BufferedImage image = new BufferedImage(60,30,BufferedImage.TYPE_INT_RGB);
        Graphics2D g2D = (Graphics2D) image.getGraphics();
        g2D.setFont(new Font("黑体",Font.BOLD,18));
        g2D.setPaint(Color.GREEN);//设置验证码数字的颜色
        Random r = new Random();
        int height = 22;
        String code = "";
        for(int i = 0; i<4; i++){
            String str = ""+r.nextInt(10);
            AffineTransform aff = new AffineTransform();
            //(用弧度测量的旋转角度, 旋转锚点的 X 坐标, 旋转锚点的 Y 坐标)  旋转？
            aff.rotate(Math.random()%0.8, i*18, height-5);
            //(坐标沿 X 轴方向缩放的因子, 坐标沿 Y 轴方向缩放的因子) 缩放？
            aff.scale(0.8+Math.random(), 0.8+Math.random());
            g2D.setTransform(aff);
            g2D.drawString(str, i*10, height-5);
            code += str;
        }

        request.getSession().setAttribute("code", code);

        for(int i = 0; i<4; i++){
            Color color = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
            g2D.setColor(color);
            g2D.drawLine(r.nextInt(60), r.nextInt(30), r.nextInt(60),r.nextInt(30));
        }

        g2D.dispose();
        ImageIO.write(image, "JPEG", response.getOutputStream());
    }
}
