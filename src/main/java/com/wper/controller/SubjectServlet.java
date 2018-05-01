package com.wper.controller;

import com.wper.model.Subject;
import com.wper.service.Impl.SubServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SubjectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        /*处理添加课程*/
        System.out.println(req.getParameter("postType"));
        if ("addSub".equals(req.getParameter("postType"))){
            SubServiceImpl subService=new SubServiceImpl();
            System.out.println("1");
            String name=req.getParameter("addName");
            String type=req.getParameter("type");
            String teacher=req.getParameter("teacher");
            String info=req.getParameter("info");
            subService.addSubject(new Subject(name,type,teacher,info));
            req.setAttribute("message","课程添加成功");
            req.getRequestDispatcher("message.jsp").forward(req,resp);
        }
        SubServiceImpl subService=new SubServiceImpl();
        List<Subject> list=subService.getAllSub();
        req.setAttribute("subList",list);
        req.getRequestDispatcher("subject.jsp").forward(req,resp);
    }
}
