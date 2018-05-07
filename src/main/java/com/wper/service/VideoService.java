package com.wper.service;

import com.wper.model.Video;

import java.util.List;

public interface VideoService {
    //获取全部视频信息
    List<Video> getAllVideo();
    //修改视频信息
    void updateVideo(Video video);
    //增加视频信息
    void  addVideo(Video video);
    //根据ID获取视频信息
    List<Video> getVideoById(int id);
    //根据ID删除视频信息
    void deleteVideoById(int id);
}
