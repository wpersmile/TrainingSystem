package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.FilesDao;
import com.wper.model.Files;
import com.wper.service.FileService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class FileServiceImpl implements FileService {
    private SqlSession sqlSession=MySessionFactory.getInstance().openSqlSession();
    private FilesDao filesDao=sqlSession.getMapper(FilesDao.class);
    @Override
    public List<Files> getAllFile() {
        return filesDao.getAllFile();
    }

    @Override
    public void addFile(Files files) {
        filesDao.addFile(files);
        sqlSession.commit();
    }

    @Override
    public void deleteFile(int id) {
        filesDao.deleteFile(id);
        sqlSession.commit();
    }

    @Override
    public List<Files> getFile(int id) {
        return filesDao.getFile(id);
    }
}
