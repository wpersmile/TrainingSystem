package com.wper.service;

import com.wper.model.Files;

import java.util.List;

public interface FileService {
    List<Files> getAllFile();
    void addFile(Files files);
    void deleteFile(int id);
    List<Files>getFile(int id);
    List<Files>getFileByType(String type);
}
