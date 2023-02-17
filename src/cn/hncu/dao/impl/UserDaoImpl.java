package cn.hncu.dao.impl;

import cn.hncu.dao.UserDao;
import cn.hncu.domain.User;
import cn.hncu.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDaoImpl implements UserDao {
    Connection conn = null;
    Statement stat = null;

    @Override
    public User queryUserByUsername(String username) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            ResultSet res = stat.executeQuery("SELECT * FROM users WHERE user_name='" + username + "'");
            if(res.next()){
                User user = new User(res.getString(1), res.getString(2));
                return user;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally {
            JDBCUtils.close(stat,conn);
        }
        return null;
    }
    public User queryUserByUsername2(String username) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            ResultSet res = stat.executeQuery("SELECT * FROM users WHERE user_name='" + username + "'");
            if(res.next()){
                User user = new User(res.getString(1), res.getString(2), res.getString(3), res.getString(4));
                return user;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally {
            JDBCUtils.close(stat,conn);
        }
        return null;
    }

    @Override
    public void saveUser(User user) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            String name = user.getName();
            String pwd = user.getPassword();
            String address = user.getAddress();
            String phone = user.getPhone();
            String sql = "INSERT INTO users VALUES('"+name+"','"+pwd+"','"+address+"','"+phone+"')";
            stat.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.close(stat,conn);
        }
    }

    @Override
    public void updateUser(String imfo, String name, String col) {
        try {
            conn = JDBCUtils.getConnection();
            stat = conn.createStatement();
            String sql = "UPDATE users SET user_"+col+" ='"+imfo+"' WHERE user_name='"+name+"'";
            stat.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.close(stat,conn);
        }
    }
}
