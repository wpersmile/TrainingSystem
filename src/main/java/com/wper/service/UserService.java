package com.wper.service;

import com.wper.model.User;

import java.util.List;

public interface UserService {
    void addUser(User user);
    int getType(String phone);
    void updatePass(User user);
    void deleteUser(int id);
    void updateUser(User user);
    String getUserPhone(String phone);
    String getUserPass(String phone);

    List<User> getUser(String phone);
    List<User> getAllUser();
}
