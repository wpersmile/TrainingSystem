package com.wper.controller;

import com.wper.baseUtil.Md5Util;
import com.wper.model.User;
import com.wper.service.Impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RegServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        //System.out.println("get");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        UserServiceImpl userService=new UserServiceImpl();
        if (userService.getUserPhone(req.getParameter("phone"))==null){
            userService.addUser(new User(req.getParameter("phone"),
                    Md5Util.getMD5(req.getParameter("password")),
                    req.getParameter("email")));
            req.setAttribute("type","ok");
            req.getRequestDispatcher("/register.jsp").forward(req,resp);
        }
        else {
            HttpSession regTypeSession=req.getSession();
            regTypeSession.setAttribute("regMessage","用户已经存在");
            resp.sendRedirect("/register.jsp");
        }

    }
}
