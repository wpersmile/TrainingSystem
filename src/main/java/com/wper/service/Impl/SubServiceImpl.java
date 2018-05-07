package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.SubjectDao;
import com.wper.model.Subject;
import com.wper.service.SubjectService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class SubServiceImpl implements SubjectService {
    private SqlSession sqlSession=null;
    private SubjectDao subjectDao=null;
    @Override
    public List<Subject> getAllSub() {
        List<Subject> subjectList=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            subjectDao=sqlSession.getMapper(SubjectDao.class);
            subjectList= subjectDao.getAllSub();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return subjectList;
    }

    @Override
    public void addSubject(Subject subject) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            subjectDao=sqlSession.getMapper(SubjectDao.class);
            subjectDao.addSubject(subject);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }

    }

    @Override
    public void deleteSub(int id) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            subjectDao=sqlSession.getMapper(SubjectDao.class);
            subjectDao.deleteSub(id);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }

    }

    @Override
    public void updateSubjectById(Subject subject) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            subjectDao=sqlSession.getMapper(SubjectDao.class);
            subjectDao.updateSubjectById(subject);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }
    }

    @Override
    public List<Subject> getSubById(int id) {
        List<Subject> subjectList=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            subjectDao=sqlSession.getMapper(SubjectDao.class);
            subjectList= subjectDao.getSubById(id);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return subjectList;
    }
}
