package com.wper.controller;

import com.wper.baseUtil.Md5Util;
import com.wper.model.Files;
import com.wper.model.MySubject;
import com.wper.model.Teacher;
import com.wper.model.User;
import com.wper.service.Impl.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

public class BaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String method=req.getParameter("method");
        System.out.println(method);
        switch (method){
            case "updateUserInfo":
                updateUserInfo(req,resp);
                break;
            case "updateUserPass":
                updateUserPass(req,resp);
                break;
            case "deleteFile":
                deleteFile(req,resp);
                break;
            case "deleteSub":
                deleteSubject(req,resp);
                break;
            case "deleteUser":
                deleteUser(req,resp);
                break;
            case "addSubToUser":
                addSubToUser(req,resp);
                break;
            case "deleteSubForUser":
                deleteSubForUser(req,resp);
                break;
            case "deleteTch":
                deleteTch(req,resp);
                break;
            case "getAllTeacher":
                getAllTeacher(req,resp);
                break;
                default:
                    System.out.println("修改失败");
        }
    }

    private void updateUserInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        UserServiceImpl userService=new UserServiceImpl();
        String name=req.getParameter("name");
        String sex=req.getParameter("choseSex");
        if ("1".equals(sex)){
            sex="男";
        }
        else if("2".equals(sex)){
            sex="女";
        }
        else {
            sex="?";
        }
        String introduce=req.getParameter("introduce");
        System.out.println(introduce);
        userService.updateUser(new User(name,sex,introduce,(String) session.getAttribute("user")));
        System.out.println("修改成功");
        req.getRequestDispatcher("/MeServlet").forward(req,resp);
    }

    private void updateUserPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession=req.getSession();
        UserServiceImpl userService=new UserServiceImpl();
        String pass=Md5Util.getMD5(req.getParameter("pass"));
        String phone=(String) httpSession.getAttribute("user");
        userService.updatePass(new User(phone,pass));
        httpSession.invalidate();
        //req.getRequestDispatcher("/MeServlet").forward(req,resp);

        resp.sendRedirect("login.jsp");

    }

    private void deleteFile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session=req.getSession();
        int type=(int)session.getAttribute("type");
        if (type==0){
            String sid=req.getParameter("list");
            System.out.println(sid);
            System.out.println(req.getParameter("list"));
            int id=Integer.parseInt(sid);

            FileServiceImpl fileService=new FileServiceImpl();

            List<Files> filesList=fileService.getFile(id);
            String url=session.getServletContext().getRealPath("");
            System.out.println(url);

            for (Files f:filesList
                 ) {
                url=url+f.getUrl();
            }
            System.out.println(url);
            File file=new File(url);
            System.out.println(url);
          boolean b=file.delete();
            if (b){
                fileService.deleteFile(id);
                System.out.println("删除成功");
            }
            req.getRequestDispatcher("file.jsp").forward(req,resp);
        }
        else {
            resp.sendRedirect("index.jsp");
        }
    }

    private void deleteSubject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        System.out.println(req.getParameter("id"));
        SubServiceImpl subService=new SubServiceImpl();
        subService.deleteSub(id);
        req.setAttribute("message","删除成功");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        System.out.println(req.getParameter("id"));
        UserServiceImpl userService=new UserServiceImpl();
        System.out.println(req.getParameter("type"));
        if ("0".equals(req.getParameter("type"))){
            req.setAttribute("message",null);
            System.out.println("我被执行了");
        }
        else {
            userService.deleteUser(id);
            req.setAttribute("message","删除成功");
            System.out.println("删除了");
        }
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }

    private void addSubToUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //暂定未使用
        //int id=Integer.parseInt(req.getParameter("id"));
        String name=req.getParameter("name");
        System.out.println(name);
        MySubServiceImpl mySubService=new MySubServiceImpl();
        HttpSession userSession=req.getSession();
        String phone=(String) userSession.getAttribute("user");
        //如果已选过，值为false
        System.out.println(mySubService.emptySub(name,phone));
        if (mySubService.emptySub(name,phone)){
            mySubService.addSubToUser(new MySubject(phone,name));
            req.setAttribute("addType",1);
        }
        else {
            req.setAttribute("addType",0);
        }
        req.getRequestDispatcher("SubjectServlet").forward(req,resp);
    }


    private void deleteSubForUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        MySubServiceImpl mySubService=new MySubServiceImpl();
        HttpSession userSession=req.getSession();
        String phone=(String) userSession.getAttribute("user");
        if (mySubService.emptySub(name,phone)){
            req.setAttribute("deleteType","0");
        }
        else {
            mySubService.deleteSubForUser(name);
            System.out.println("删除成功");
            req.setAttribute("deleteType","1");
        }
        req.getRequestDispatcher("MeServlet").forward(req,resp);
    }

    private void deleteTch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        StringBuffer url=new StringBuffer();
        url.append(session.getServletContext().getRealPath(""));
        int id=Integer.parseInt(req.getParameter("id"));

        System.out.println(url);
        TeacherServiceImpl teacherService=new TeacherServiceImpl();
        List<Teacher> list=teacherService.getTeacherById(id);
        for (Teacher t:list
             ) {
            url.append(t.getPic());
        }
        File file=new File(url.toString());
        boolean b=file.delete();
        if (b){
            teacherService.deleteTeacherById(id);
            System.out.println("删除成功");
        }
        req.setAttribute("message","删除成功");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }

    private void getAllTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TeacherServiceImpl teacherService=new TeacherServiceImpl();
        List<Teacher> list=teacherService.getAllTeacher();
        req.setAttribute("teacherList",list);
        req.getRequestDispatcher("teacher.jsp").forward(req,resp);
    }
}
