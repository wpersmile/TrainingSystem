package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.VideoDao;
import com.wper.model.Video;
import com.wper.service.VideoService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class VideoServiceImpl implements VideoService {
    private SqlSession sqlSession=null;
    private VideoDao videoDao=null;

    @Override
    public List<Video> getAllVideo() {
        List<Video> list=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            videoDao=sqlSession.getMapper(VideoDao.class);
            list=videoDao.getAllVideo();
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
    public void updateVideo(Video video) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            videoDao=sqlSession.getMapper(VideoDao.class);
            videoDao.updateVideo(video);
            sqlSession.commit();
        }
        catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }
        finally {
            sqlSession.close();
        }
    }

    @Override
    public void addVideo(Video video) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            videoDao=sqlSession.getMapper(VideoDao.class);
            videoDao.addVideo(video);
            sqlSession.commit();
        }
        catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }
        finally {
            sqlSession.close();
        }
    }

    @Override
    public List<Video> getVideoById(int id) {
        List<Video> list=null;
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            videoDao=sqlSession.getMapper(VideoDao.class);
            list=videoDao.getVideoById(id);
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
    public void deleteVideoById(int id) {
        try {
            sqlSession=MySessionFactory.getInstance().openSqlSession();
            videoDao=sqlSession.getMapper(VideoDao.class);
            videoDao.deleteVideoById(id);
            sqlSession.commit();
        }
        catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }
        finally {
            sqlSession.close();
        }
    }
}
