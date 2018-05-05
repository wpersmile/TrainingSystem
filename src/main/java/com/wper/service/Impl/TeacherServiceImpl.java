package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.FilesDao;
import com.wper.dao.TeacherDao;
import com.wper.model.Teacher;
import com.wper.service.TeacherService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class TeacherServiceImpl implements TeacherService {
    private SqlSession sqlSession=MySessionFactory.getInstance().openSqlSession();
    private TeacherDao teacherDao=sqlSession.getMapper(TeacherDao.class);
    @Override
    public List<Teacher> getAllTeacher() {
        return teacherDao.getAllTeacher();
    }

    @Override
    public void addTeacher(Teacher teacher) {
        teacherDao.addTeacher(teacher);
        sqlSession.commit();
    }

    @Override
    public void deleteTeacherById(int id) {
        teacherDao.deleteTeacherById(id);
        sqlSession.commit();
    }

    @Override
    public List<Teacher> getTeacherById(int id) {
       return teacherDao.getTeacherById(id);
    }
}
