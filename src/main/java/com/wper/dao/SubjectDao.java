package com.wper.dao;

import com.wper.model.Subject;

import java.util.List;

public interface SubjectDao {
    //添加课程信息
    void addSubject(Subject subject);
    //获取所有课程信息
    List<Subject> getAllSub();
    //删除课程信息
    void deleteSub(int id);

}
