package com.wper.dao;

import com.wper.model.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);
    void deleteUser(int id);
    void updatePass(User user);
    int getType(String phone);
    void updateUser(User user);
    String getUserPhone(String phone);
    String getUserPass(String phone);

    List<User> getUserByPhone(String phone);

    List<User> getUser(String phone);

    List<User> getAllUser();
}
