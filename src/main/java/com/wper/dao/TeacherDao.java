package com.wper.dao;

import com.wper.model.Teacher;

import java.util.List;

public interface TeacherDao {
    List<Teacher> getAllTeacher();
    void addTeacher(Teacher teacher);
    void deleteTeacherById(int id);
    List<Teacher> getTeacherById(int id);
    void updateTeacher(Teacher teacher);
}
