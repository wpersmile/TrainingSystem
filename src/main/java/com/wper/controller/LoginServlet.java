package com.wper.controller;

import com.wper.baseUtil.Md5Util;
import com.wper.service.Impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserServiceImpl userService=new UserServiceImpl();
        //判断账号是否存在
        if (userService.getUserPhone(req.getParameter("phone"))!=null){
            //判断密码是否正确
            //讲获取的"password"用Md5Util加密后与数据库文件对比
            if (userService.getUserPass(req.getParameter("phone"))
                    .equals(Md5Util.getMD5(req.getParameter("password")))){
                //如果没有
                HttpSession session=req.getSession();
                String phone=req.getParameter("phone");
                session.setAttribute("user",phone);
                //获取用户类型标识
                int type=userService.getType(phone);
                if (type==0){
                    session.setAttribute("type",0);
                }
                else {
                    session.setAttribute("type",1);
                }

                session.setMaxInactiveInterval(60);
                resp.sendRedirect("/index.jsp");
            }
            else {
                HttpSession loginTypeSession=req.getSession();
                loginTypeSession.setAttribute("message","用户名或者密码错误");
                System.out.println(loginTypeSession.getId());
                resp.sendRedirect("/login.jsp");
            }
        }
        else {
            HttpSession loginTypeSession=req.getSession();
            loginTypeSession.setAttribute("message","用户名或者密码错误");
            resp.sendRedirect("/login.jsp");
        }
    }
}
