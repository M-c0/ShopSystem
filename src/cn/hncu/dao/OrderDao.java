package cn.hncu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

public interface OrderDao {
    public void addOrderById(String id, String userName);
    public ArrayList queryOrderByUname(String username);
}
