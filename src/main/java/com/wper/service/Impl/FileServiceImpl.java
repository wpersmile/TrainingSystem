package com.wper.service.Impl;

import com.wper.baseUtil.MySessionFactory;
import com.wper.dao.FilesDao;
import com.wper.model.Files;
import com.wper.service.FileService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class FileServiceImpl implements FileService {
    private SqlSession sqlSession=null;
    private FilesDao filesDao=null;
    @Override
    public List<Files> getAllFile() {

        List<Files> filesList=null;
        sqlSession=MySessionFactory.getInstance().openSqlSession();
        try {
            filesDao=sqlSession.getMapper(FilesDao.class);
            filesList=filesDao.getAllFile();
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return filesList;
    }

    @Override
    public void addFile(Files files) {
        sqlSession=MySessionFactory.getInstance().openSqlSession();
        try {
            filesDao=sqlSession.getMapper(FilesDao.class);
            filesDao.addFile(files);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }
        finally {
            sqlSession.close();
        }

    }

    @Override
    public void deleteFile(int id) {
        sqlSession=MySessionFactory.getInstance().openSqlSession();
        try {
            filesDao=sqlSession.getMapper(FilesDao.class);
            filesDao.deleteFile(id);
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
            sqlSession.rollback();
        }
        finally {
            sqlSession.close();
        }

    }

    @Override
    public List<Files> getFile(int id) {
        List<Files> filesList=null;
        sqlSession=MySessionFactory.getInstance().openSqlSession();
        try {
            filesDao=sqlSession.getMapper(FilesDao.class);
            filesList=filesDao.getFile(id);
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return filesList;
    }

    @Override
    public List<Files> getFileByType(String type) {
        List<Files> filesList=null;
        sqlSession=MySessionFactory.getInstance().openSqlSession();
        try {
            filesDao=sqlSession.getMapper(FilesDao.class);
            filesList=filesDao.getFileByType(type);
        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return filesList;
    }
}
