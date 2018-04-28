package com.wper.service.Impl;
import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.UserDao;
import com.wper.model.User;
import com.wper.service.UserService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserServiceImpl implements UserService {

    private SqlSession sqlSession=MySessionFactory.getInstance().openSqlSession();
    private UserDao userDao=sqlSession.getMapper(UserDao.class);
    @Override
    public void addUser(User user) {
        userDao.addUser(user);
        sqlSession.commit();
    }

    @Override
    public int getType(String phone) {
        return userDao.getType(phone);
    }

    @Override
    public void updatePass(User user) {
        userDao.updatePass(user);
        sqlSession.commit();
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
        sqlSession.commit();
    }


    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
        sqlSession.commit();
    }

    @Override
    public String getUserPhone(String phone) {
       return userDao.getUserPhone(phone);
    }

    @Override
    public String getUserPass(String phone) {
        return userDao.getUserPass(phone);
    }

    @Override
    public List<User> getUserByPhone(String phone) {
        return userDao.getUserByPhone(phone);
    }

    @Override
    public List<User> getUser(String phone) {
        return userDao.getUser(phone);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }
}
