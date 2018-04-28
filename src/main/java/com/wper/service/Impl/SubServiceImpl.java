package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.SubjectDao;
import com.wper.model.Subject;
import com.wper.service.SubjectService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class SubServiceImpl implements SubjectService {
    private SqlSession sqlSession=MySessionFactory.getInstance().openSqlSession();
    private SubjectDao subjectDao=sqlSession.getMapper(SubjectDao.class);
    @Override
    public List<Subject> getAllSub() {
        return subjectDao.getAllSub();
    }

    @Override
    public void addSubject(Subject subject) {
        subjectDao.addSubject(subject);
        sqlSession.commit();
    }

    @Override
    public void deleteSub(int id) {
        subjectDao.deleteSub(id);
        sqlSession.commit();
    }
}
