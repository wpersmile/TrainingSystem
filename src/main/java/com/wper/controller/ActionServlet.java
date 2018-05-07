package com.wper.controller;

import com.wper.model.Subject;
import com.wper.model.Teacher;
import com.wper.model.Video;
import com.wper.service.Impl.SubServiceImpl;
import com.wper.service.Impl.TeacherServiceImpl;
import com.wper.service.Impl.VideoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 用于处理网页跳转
 */
public class ActionServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method=req.getParameter("method");
        switch (method){
            case "updateUserInfo":
                vUpdateUserInfo(req,resp);
                break;
            case "updatePass":
                vUpdatePass(req,resp);
                break;
            case "managePage":
                vManagePage(req,resp);
                break;
            case "userManagePage":
                vUserManagePage(req,resp);
                break;
            case "tchManagePage":
                vTchManagePage(req,resp);
                break;
            case "updateTchPage":
                vUpdateTchPage(req,resp);
                break;
            case "addTchPage":
                vAddTchPage(req,resp);
            break;
            case "addSubPage":
                vAddSubPage(req,resp);
                break;
            case "addFilePage":
                vAddFilePage(req,resp);
                break;
            case "addVideoPage":
                vAddVideoPage(req,resp);
                break;
            case "updateSubPage":
                vUpdateSubPage(req,resp);
                break;
            case "updateVideoPage":
                vUpdateVideoPage(req,resp);
                break;
                default:
                    System.out.println("error");
        }
    }

    private void vUpdateUserInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("name",req.getParameter("name"));
        req.getRequestDispatcher("/WEB-INF/jsp/updateUserInfo.jsp").forward(req,resp);
    }

    private void vUpdatePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/updatePass.jsp").forward(req,resp);
    }
    private void vManagePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/manage.jsp").forward(req,resp);
    }

    private void vUserManagePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/userManage.jsp").forward(req,resp);
    }


    private void  vTchManagePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/teacher/tchManage.jsp").forward(req,resp);
    }


    private void vUpdateTchPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        TeacherServiceImpl teacherService=new TeacherServiceImpl();
        List<Teacher> teacherList=teacherService.getTeacherById(id);
        req.setAttribute("list",teacherList);
        req.getRequestDispatcher("/WEB-INF/jsp/teacher/updateTch.jsp").forward(req,resp);
    }
    private void vUpdateSubPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        SubServiceImpl subService=new SubServiceImpl();
        List<Subject> subjectList=subService.getSubById(id);
        req.setAttribute("subjectList",subjectList);
        req.getRequestDispatcher("/WEB-INF/jsp/subject/updateSubject.jsp").forward(req,resp);
    }
    private void vUpdateVideoPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        VideoServiceImpl videoService=new VideoServiceImpl();
        List<Video> videoList=videoService.getVideoById(id);
        req.setAttribute("videoList",videoList);
        req.getRequestDispatcher("/WEB-INF/jsp/video/updateVideo.jsp").forward(req,resp);
    }


    private void vAddTchPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/teacher/addTeacher.jsp").forward(req,resp);
    }
    private void vAddSubPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/subject/addSubject.jsp").forward(req,resp);
    }
    private void vAddFilePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SubServiceImpl subService=new SubServiceImpl();
        List<Subject> subList=subService.getAllSub();
        req.setAttribute("subList",subList);
        req.getRequestDispatcher("/WEB-INF/jsp/file/addFile.jsp").forward(req,resp);
    }
    private void vAddVideoPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       /* SubServiceImpl subService=new SubServiceImpl();
        List<Subject> subList=subService.getAllSub();
        req.setAttribute("subList",subList);*/
        req.getRequestDispatcher("/WEB-INF/jsp/video/addVideo.jsp").forward(req,resp);
    }
}
