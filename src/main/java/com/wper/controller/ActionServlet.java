package com.wper.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用于处理网页跳转
 */
public class ActionServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method=req.getParameter("method");
        switch (method){
            case "updateUserInfo":
                visitUpdateUserInfo(req,resp);
                break;
            case "updatePass":
                visitUpdatePass(req,resp);
                break;
            case "managePage":
                visitManagePage(req,resp);
                break;
                default:
                    System.out.println("error");
        }
    }

    private void visitUpdateUserInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("name",req.getParameter("name"));
        req.getRequestDispatcher("/WEB-INF/jsp/updateUserInfo.jsp").forward(req,resp);
    }

    private void visitUpdatePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/updatePass.jsp").forward(req,resp);
    }
    private void visitManagePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/manage.jsp").forward(req,resp);
    }

}
