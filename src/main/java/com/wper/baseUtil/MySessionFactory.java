package com.wper.baseUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class MySessionFactory {

    private MySessionFactory(){};
    private static MySessionFactory instance=null;

    public static MySessionFactory getInstance(){
        synchronized (MySessionFactory.class){
            if (null==instance){
                instance=new MySessionFactory();
            }
            return instance;
        }
    }
    private static SqlSessionFactory sqlSessionFactory=null;
    static {
        InputStream inputStream;
        try {
            String resource = "mybatis-config.xml";
            inputStream= Resources.getResourceAsStream(resource);
            sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    public  SqlSession openSqlSession(){
        return sqlSessionFactory.openSession();
    }

}
