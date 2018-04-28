package com.wper.controller;

import com.wper.model.Video;
import com.wper.service.Impl.VideoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class VideoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        VideoServiceImpl videoService=new VideoServiceImpl();
        List<Video> list=videoService.getAllVideo();
        req.setAttribute("vList",list);
        req.getRequestDispatcher("study.jsp").forward(req,resp);
    }
}
