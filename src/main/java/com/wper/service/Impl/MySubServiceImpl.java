package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.MySubDao;
import com.wper.model.MySubject;
import com.wper.service.MySubService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MySubServiceImpl implements MySubService {
    private SqlSession sqlSession=MySessionFactory.getInstance().openSqlSession();
    private MySubDao mySubDao=sqlSession.getMapper(MySubDao.class);

    @Override
    public void addSubToUser(MySubject mySubject) {
        mySubDao.addSubToUser(mySubject);
        sqlSession.commit();
    }

    @Override
    public List<MySubject> getMySubInfo(String phone) {
        return mySubDao.getMySubInfo(phone);
    }

    @Override
    public int getCountSub(String phone) {
        return mySubDao.getCountSub(phone);
    }

    @Override
    public void deleteSubForUser(String name) {
        mySubDao.deleteSubForUser(name);
        sqlSession.commit();
    }

    @Override
    public Boolean emptySub(String name, String phone) {
        int i=mySubDao.emptySub(name,phone);
        if (i>0){
            return false;
        }else {
            return true;
        }
    }
}
