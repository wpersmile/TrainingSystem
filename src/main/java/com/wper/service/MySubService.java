package com.wper.service;

import com.wper.model.MySubject;

import java.util.List;

public interface MySubService {
    void addSubToUser(MySubject mySubject);
    List<MySubject> getMySubInfo(String phone);
    //统计一个人选了多少门课程
    int getCountSub(String phone);
    void deleteSubForUser(String name);
    Boolean emptySub(String name, String phone);
}
