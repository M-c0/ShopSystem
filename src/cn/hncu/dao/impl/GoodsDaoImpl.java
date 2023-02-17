package cn.hncu.dao.impl;

import cn.hncu.dao.GoodsDao;
import cn.hncu.domain.Goods;
import cn.hncu.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GoodsDaoImpl implements GoodsDao {
    Connection conn = null;
    Statement stat = null;

    @Override
    public Goods queryGoodsById(String id) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            String sql = "SELECT * FROM goods WHERE goods_id='"+id+"'";
            ResultSet rs = stat.executeQuery(sql);
            if(rs.next()){
                return new Goods(rs.getString(1),rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getString(5));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JDBCUtils.close(stat, conn);
        }
        return null;
    }
}
