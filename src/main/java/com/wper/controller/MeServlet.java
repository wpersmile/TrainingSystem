package com.wper.controller;

import com.wper.model.MySubject;
import com.wper.model.User;
import com.wper.service.Impl.MySubServiceImpl;
import com.wper.service.Impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class MeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user")==null){
            resp.sendRedirect("/index.jsp");
        }
        else {
            doPost(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        HttpSession session=req.getSession();
        //根据session -user 存在phone信息
        String phone=(String) session.getAttribute("user");

        UserServiceImpl userService=new UserServiceImpl();
        List<User> userList=userService.getUser(phone);
        req.setAttribute("userList",userList);

        MySubServiceImpl mySubService=new MySubServiceImpl();
        List<MySubject> mySubjectList=mySubService.getMySubInfo(phone);
        req.setAttribute("mySubjectList",mySubjectList);

        int subNum=mySubService.getCountSub(phone);
        req.setAttribute("subNum",subNum);
        req.setAttribute("deleteType",req.getAttribute("deleteType"));
        req.getRequestDispatcher("/WEB-INF/jsp/me.jsp").forward(req,resp);
    }
}
