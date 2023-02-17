package cn.hncu.dao.impl;

import cn.hncu.dao.ShoppingCartDao;
import cn.hncu.domain.Goods;
import cn.hncu.domain.ShoppingCart;
import cn.hncu.domain.User;
import cn.hncu.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class ShoppingCartDaoImpl implements ShoppingCartDao {

    Connection conn = null;
    Statement stat = null;

    @Override
    public void addShoppingCart(String username, String goodsid) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            String sql = "INSERT INTO shoppingcart VALUES('"+username+"','"+goodsid+"')";
            stat.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.close(stat,conn);
        }
    }

    @Override
    public ArrayList queryShopingCart(String username) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            String sql = "SELECT * FROM shoppingcart WHERE user_id='" + username +"'";
            ResultSet rs = stat.executeQuery(sql);

            ArrayList<ShoppingCart> shoppingCarts = new ArrayList<>();
            while (rs.next()){
                shoppingCarts.add(new ShoppingCart(rs.getString(1),rs.getString(2)));
            }
            return shoppingCarts;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.close(stat,conn);
        }
        return null;
    }

    @Override
    public void deleteShoppingCart(String username, String goodsid) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            String sql = "DELETE FROM shoppingcart WHERE user_id='"+username+"' AND goods_id='"+goodsid+"'";
            stat.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.close(stat,conn);
        }
    }
}
