package adsad.mapper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author wpersmile
 * @version 1.0 2017/11/28
 * @see SqlConnection : 单例模式 用于JDBC数据库连接
 * @see SqlConnection#getInstance() 初始化唯一方法
 * @see SqlConnection#getConnection() 获取Connection对象
 */
public class SqlConnection {
    private final static String URL="jdbc:mysql://localhost:3306/trainingsystem?useUnicode=true&characterEncoding=utf-8&useSSL=false";
    private final static String USERNAME="root";
    private final static String PASSWORD="123456";

    private SqlConnection(){};
    private final static SqlConnection instance=new SqlConnection();
    public static SqlConnection getInstance(){
        return instance;
    }
    static {
        try {
            //1.加载JDBC驱动。
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch ( Exception e){
            e.printStackTrace();
        }
    }

    /**
     *获取Connection对象
     * @return 返回Connection对象
     */
    public Connection getConnection(){
        try {
            return DriverManager.getConnection(URL,USERNAME,PASSWORD);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
