package com.wper.controller;

import com.wper.model.Files;
import com.wper.model.Subject;
import com.wper.service.Impl.FileServiceImpl;
import com.wper.service.Impl.SubServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class FileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        FileServiceImpl fileService=new FileServiceImpl();
        List<Files> filesList=fileService.getAllFile();
        SubServiceImpl subService=new SubServiceImpl();
        List<Subject> subjectList=subService.getAllSub();
        req.setAttribute("subjectList",subjectList);
        req.setAttribute("filesList",filesList);
        req.getRequestDispatcher("/file.jsp").forward(req,resp);
    }
}
