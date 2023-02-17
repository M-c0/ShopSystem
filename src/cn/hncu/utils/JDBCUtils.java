package cn.hncu.utils;

import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtils {
    private static String url;
    private static String username;
    private static String password;
    private static String diverClassName;

    static {
        Properties properties = new Properties();
        try {
            ClassLoader classLoader = JDBCUtils.class.getClassLoader();
            URL resource = classLoader.getResource("jdbc.properties");
            String path = resource.getPath();
            properties.load(new FileReader(path));
            url = properties.getProperty("url");
            username = properties.getProperty("username");
            password = properties.getProperty("password");
            diverClassName = properties.getProperty("driverClassName");

            Class.forName(diverClassName);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    public static void close(Statement stat, Connection conn){
        if(stat!=null){
            try {
                stat.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
