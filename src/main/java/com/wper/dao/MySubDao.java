package com.wper.dao;

import com.wper.model.MySubject;

import java.util.List;

public interface MySubDao {
    void addSub(MySubject mySubject);
    List<MySubject> getMySubInfo(String phone);
    //统计一个人选了多少门课程
    int getCountSub(String phone);

}
