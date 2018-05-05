package com.wper.dao;

import com.wper.model.MySubject;

import java.util.List;

public interface MySubDao {
    void addSubToUser(MySubject mySubject);
    List<MySubject> getMySubInfo(String phone);
    //统计一个人选了多少门课程
    int getCountSub(String phone);
    void deleteSubForUser(String name);
    //查询该门课程是否被选过
    int emptySub(String name,String phone);

}
