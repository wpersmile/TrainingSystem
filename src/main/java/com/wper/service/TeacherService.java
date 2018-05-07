package com.wper.service;

import com.wper.model.Teacher;

import java.util.List;

public interface TeacherService {
    List<Teacher> getAllTeacher();
    void addTeacher(Teacher teacher);
    void deleteTeacherById(int id);
    List<Teacher> getTeacherById(int id);
    void updateTeacher(Teacher teacher);
}
