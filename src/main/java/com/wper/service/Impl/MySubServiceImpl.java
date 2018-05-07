package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.MySubDao;
import com.wper.model.MySubject;
import com.wper.service.MySubService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MySubServiceImpl implements MySubService {
    private SqlSession sqlSession=null;
    private MySubDao mySubDao=null;

    @Override
    public void addSubToUser(MySubject mySubject) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            mySubDao=sqlSession.getMapper(MySubDao.class);
            mySubDao.addSubToUser(mySubject);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }

    }

    @Override
    public List<MySubject> getMySubInfo(String phone) {
        List<MySubject> mySubjectList=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            mySubDao=sqlSession.getMapper(MySubDao.class);
            mySubjectList=mySubDao.getMySubInfo(phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return mySubjectList;
    }

    @Override
    public int getCountSub(String phone) {
        int count=0;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            mySubDao=sqlSession.getMapper(MySubDao.class);
            count=mySubDao.getCountSub(phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return count;
    }

    @Override
    public void deleteSubForUser(String name) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            mySubDao=sqlSession.getMapper(MySubDao.class);
            mySubDao.deleteSubForUser(name);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }finally {
            sqlSession.close();
        }

    }

    @Override
    public Boolean emptySub(String name, String phone) {
        int i=0;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            mySubDao=sqlSession.getMapper(MySubDao.class);
            i=mySubDao.emptySub(name,phone);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        if (i>0){
            return false;
        }else {
            return true;
        }
    }
}
