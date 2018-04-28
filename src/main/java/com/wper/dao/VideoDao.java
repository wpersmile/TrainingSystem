package com.wper.dao;

import com.wper.model.Video;

import java.util.List;

public interface VideoDao {
    //获取全部视频信息
    List<Video> getAllVideo();
}
