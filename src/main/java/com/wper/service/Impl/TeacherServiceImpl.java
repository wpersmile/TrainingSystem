package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.FilesDao;
import com.wper.dao.TeacherDao;
import com.wper.model.Teacher;
import com.wper.service.TeacherService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class TeacherServiceImpl implements TeacherService {
    private SqlSession sqlSession=null;
    private TeacherDao teacherDao=null;
    @Override
    public List<Teacher> getAllTeacher() {
        List<Teacher> list=null;
        sqlSession=MySessionFactory.getInstance().openSqlSession();
        try {
            teacherDao=sqlSession.getMapper(TeacherDao.class);
            list=teacherDao.getAllTeacher();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return list;
    }


    @Override
    public void addTeacher(Teacher teacher) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            teacherDao=sqlSession.getMapper(TeacherDao.class);
            teacherDao.addTeacher(teacher);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }
    }

    @Override
    public void deleteTeacherById(int id) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            teacherDao=sqlSession.getMapper(TeacherDao.class);
            teacherDao.deleteTeacherById(id);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }
    }

    @Override
    public List<Teacher> getTeacherById(int id) {
        List<Teacher> list=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            teacherDao=sqlSession.getMapper(TeacherDao.class);
            list=teacherDao.getTeacherById(id);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return list;
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            teacherDao=sqlSession.getMapper(TeacherDao.class);
            teacherDao.updateTeacher(teacher);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }
    }
}
