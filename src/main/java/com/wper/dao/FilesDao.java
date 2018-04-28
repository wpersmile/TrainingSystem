package com.wper.dao;

import com.wper.model.Files;

import java.util.List;

public interface FilesDao {
    List<Files> getAllFile();
    void addFile(Files files);
    void deleteFile(int id);
    List<Files>getFile(int id);
}
