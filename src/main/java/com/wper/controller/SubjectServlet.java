package com.wper.controller;

import com.wper.model.Subject;
import com.wper.service.Impl.MySubServiceImpl;
import com.wper.service.Impl.SubServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        SubServiceImpl subService=new SubServiceImpl();
        List<Subject> list=subService.getAllSub();
        req.setAttribute("subList",list);
        //获取选课状态
        req.setAttribute("addType",req.getAttribute("addType"));
        //获取退选状态
        req.setAttribute("deleteType",req.getAttribute("deleteType"));
        req.getRequestDispatcher("subject.jsp").forward(req,resp);
    }
}
