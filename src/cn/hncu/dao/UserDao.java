package cn.hncu.dao;

import cn.hncu.domain.User;

public interface UserDao {
    public User queryUserByUsername(String username);

    public void saveUser(User user);

    public void updateUser(String imfo, String name, String col);
}
