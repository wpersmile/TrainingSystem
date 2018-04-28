package com.wper.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ActionServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method=req.getParameter("method");
        if (method.equals("updateUserInfo")){
            visitUpdateUserInfo(req,resp);
        }
        else if (method.equals("updatePass")){
            visitUpdatePass(req,resp);
        }
    }

    private void visitUpdateUserInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/updateUserInfo.jsp").forward(req,resp);
    }

    private void visitUpdatePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/updatePass.jsp").forward(req,resp);
    }
}
