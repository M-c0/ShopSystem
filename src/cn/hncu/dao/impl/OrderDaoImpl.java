package cn.hncu.dao.impl;

import cn.hncu.dao.OrderDao;
import cn.hncu.domain.Goods;
import cn.hncu.domain.Order;
import cn.hncu.domain.ShoppingCart;
import cn.hncu.domain.User;
import cn.hncu.utils.JDBCUtils;
import org.junit.Test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class OrderDaoImpl implements OrderDao {
    Connection conn = null;
    Statement stat = null;
    @Override
    public void addOrderById(String id, String userName) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            GoodsDaoImpl goodsDao = new GoodsDaoImpl();
            Goods goods = goodsDao.queryGoodsById(id);
            UserDaoImpl userDao = new UserDaoImpl();
            User user = userDao.queryUserByUsername2(userName);
            Date date = new Date();
            String sql = "INSERT INTO orders VALUES('"+date.getTime()+"','"+userName+"','"+id+"','"+goods.getPrice()+"','"+user.getAddress()+"','"+user.getPhone()+"')";
            stat.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.close(stat,conn);
        }
    }

    @Override
    public ArrayList queryOrderByUname(String username) {

        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            String sql = "SELECT * FROM orders WHERE order_userid='" + username +"'";
            ResultSet rs = stat.executeQuery(sql);

            ArrayList<Order> orders = new ArrayList<>();
            String orderid, userid, goodsid, address, phone;
            double price;
            while (rs.next()){
                orderid = rs.getString(1);
                userid = rs.getString(2);
                goodsid = rs.getString(3);
                price = rs.getDouble(4);
                address = rs.getString(5);
                phone = rs.getString(6);
                orders.add(new Order(orderid, userid, goodsid, price, address, phone));
            }
            return orders;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.close(stat,conn);
        }
        return null;
    }
}
