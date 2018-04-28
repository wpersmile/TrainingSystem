package com.wper.service;

import com.wper.model.Subject;

import java.util.List;

public interface SubjectService {
    //获取所有课程信息
    List<Subject> getAllSub();
    //添加课程信息
    void addSubject(Subject subject);
    //删除课程信息
    void deleteSub(int id);
}
