package com.wper.service.Impl;
import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.UserDao;
import com.wper.model.User;
import com.wper.service.UserService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserServiceImpl implements UserService {

    private SqlSession sqlSession=null;
    private UserDao userDao=null;
    @Override
    public void addUser(User user) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            userDao.addUser(user);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }
    }

    @Override
    public int getType(String phone) {
        int type=0;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            type=userDao.getType(phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return type;
    }

    @Override
    public void updatePass(User user) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            userDao.updatePass(user);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }

    }

    @Override
    public void deleteUser(int id) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            userDao.deleteUser(id);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }

    }


    @Override
    public void updateUser(User user) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            userDao.updateUser(user);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }

    }

    @Override
    public String getUserPhone(String phone) {
        String reqPhone=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            reqPhone= userDao.getUserPhone(phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
       return reqPhone;
    }

    @Override
    public String getUserPass(String phone) {
        String pass=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            pass= userDao.getUserPass(phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return pass;
    }


    @Override
    public List<User> getUser(String phone) {
        List<User> userList=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            userList=userDao.getUser(phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return userList;
    }

    @Override
    public List<User> getAllUser() {
        List<User> userList=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            userDao=sqlSession.getMapper(UserDao.class);
            userList=userDao.getAllUser();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return userList;
    }
}
