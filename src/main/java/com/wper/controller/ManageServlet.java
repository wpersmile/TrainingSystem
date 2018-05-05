package com.wper.controller;

import com.wper.model.Subject;
import com.wper.model.Teacher;
import com.wper.model.User;
import com.wper.service.Impl.SubServiceImpl;
import com.wper.service.Impl.TeacherServiceImpl;
import com.wper.service.Impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserServiceImpl userService=new UserServiceImpl();
        List<User> list=userService.getAllUser();
        req.setAttribute("userList",list);

        SubServiceImpl subService=new SubServiceImpl();
        List<Subject> list2=subService.getAllSub();
        req.setAttribute("subList",list2);
        System.out.println("我被访问了");
        TeacherServiceImpl teacherService=new TeacherServiceImpl();
        List<Teacher> list3=teacherService.getAllTeacher();
        req.setAttribute("teacherList",list3);

        req.getRequestDispatcher("/WEB-INF/jsp/manage.jsp").forward(req,resp);
    }
}
