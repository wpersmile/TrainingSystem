package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.VideoDao;
import com.wper.model.Video;
import com.wper.service.VideoService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class VideoServiceImpl implements VideoService {
    private SqlSession sqlSession=MySessionFactory.getInstance().openSqlSession();
    private VideoDao videoDao=sqlSession.getMapper(VideoDao.class);

    @Override
    public List<Video> getAllVideo() {
        return videoDao.getAllVideo();
    }
}
