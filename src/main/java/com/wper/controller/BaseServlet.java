package com.wper.controller;

import com.wper.baseUtil.Md5Util;
import com.wper.model.*;
import com.wper.service.Impl.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
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
            case "addVideo":
                addVideo(req,resp);
                break;
            case "addSub":
                addSub(req,resp);
                break;
            case "deleteSubForUser":
                deleteSubForUser(req,resp);
                break;
            case "deleteVideo":
                deleteVideo(req,resp);
                break;
            case "deleteTch":
                deleteTch(req,resp);
                break;
            case "getAllTeacher":
                getAllTeacher(req,resp);
                break;
            case "getAllTeacherM":
                getAllTeacherM(req,resp);
                break;
            case "getAllUser":
                getAllUser(req,resp);
                break;
            case "updateTeacherById":
                updateTeacherById(req,resp);
                break;
            case "updateVideoById":
                updateVideoById(req,resp);
                break;
            case "getAllSubjectM":
                getAllSubjectM(req,resp);
                break;
            case "getAllVideoM":
                getAllVideoM(req,resp);
                break;
            case "getAllFilesM":
                getAllFileM(req,resp);
                break;
            case "getFileByType":
                getFileByType(req,resp);
                break;

            case "updateSubjectById":
                updateSubjectById(req,resp);
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
            String sid=req.getParameter("id");
            System.out.println(sid);
            System.out.println(req.getParameter("list"));
            int id=Integer.parseInt(sid);

            FileServiceImpl fileService=new FileServiceImpl();

            List<Files> filesList=fileService.getFile(id);
            String url=session.getServletContext().getRealPath("");
            System.out.println(url);

            for (Files f:filesList
                 ) {
                //获取实际位置
                url=url+f.getUrl();
            }
            System.out.println(url);
            File file=new File(url);
            System.out.println(url);
          boolean b=file.delete();
            if (b){
                fileService.deleteFile(id);
                req.setAttribute("fMsg","删除成功");
                System.out.println("删除成功");
            }
            req.getRequestDispatcher("message.jsp").forward(req,resp);
        }
        else {
            resp.sendRedirect("login.jsp");
        }
    }

    private void deleteSubject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        System.out.println(req.getParameter("id"));
        SubServiceImpl subService=new SubServiceImpl();
        subService.deleteSub(id);
        req.setAttribute("sMsg","删除成功");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        UserServiceImpl userService=new UserServiceImpl();
        if ("0".equals(req.getParameter("type"))){
            req.setAttribute("udMsg","F");
            System.out.println("我被执行了");
        }
        else {
            userService.deleteUser(id);
            req.setAttribute("udMsg","T");
            System.out.println("删除了");
        }
       req.getRequestDispatcher("message.jsp").forward(req,resp);
    }
    private void deleteVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        VideoServiceImpl videoService=new VideoServiceImpl();
        videoService.deleteVideoById(id);
        req.setAttribute("vMsg","删除成功");
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
    private void addVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vid=req.getParameter("vid");
        System.out.println(vid);
        String type=req.getParameter("type");
        System.out.println(type);
        String name=req.getParameter("name");
        VideoServiceImpl videoService=new VideoServiceImpl();
        videoService.addVideo(new Video(vid,name,type));
        req.setAttribute("vMsg","添加成功");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }

    private void addSub(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        SubServiceImpl subService=new SubServiceImpl();
        System.out.println("1");
        String name=req.getParameter("addName");
        String type=req.getParameter("type");
        String teacher=req.getParameter("teacher");
        String info=req.getParameter("info");
        subService.addSubject(new Subject(name,type,teacher,info));
        req.setAttribute("sMsg","添加成功");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
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
        System.out.println("id:"+id);
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
        req.setAttribute("tMsg","删除成功");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }

    private void getAllTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TeacherServiceImpl teacherService=new TeacherServiceImpl();
        List<Teacher> list=teacherService.getAllTeacher();
        req.setAttribute("teacherList",list);
        req.getRequestDispatcher("teacher.jsp").forward(req,resp);
    }
    private void getAllTeacherM(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TeacherServiceImpl teacherService=new TeacherServiceImpl();
        List<Teacher> list=teacherService.getAllTeacher();
        req.setAttribute("teacherList",list);
        req.getRequestDispatcher("/WEB-INF/jsp/teacher/tchManage.jsp").forward(req,resp);
    }
    private void getAllVideoM(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        VideoServiceImpl videoService=new VideoServiceImpl();
        List<Video> videoList=videoService.getAllVideo();
        req.setAttribute("videoList",videoList);
        req.getRequestDispatcher("/WEB-INF/jsp/video/videoManage.jsp").forward(req,resp);
    }
    private void getAllSubjectM(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SubServiceImpl subService=new SubServiceImpl();
        List<Subject> subjectList=subService.getAllSub();
        req.setAttribute("subList",subjectList);
        req.getRequestDispatcher("/WEB-INF/jsp/subject/subManage.jsp").forward(req,resp);
    }
    private void getAllFileM(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FileServiceImpl fileService=new FileServiceImpl();
        List<Files> filesList=fileService.getAllFile();
        req.setAttribute("filesList",filesList);
        req.getRequestDispatcher("/WEB-INF/jsp/file/fileManage.jsp").forward(req,resp);
    }

    private void getAllUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserServiceImpl userService=new UserServiceImpl();
        List<User> list=userService.getAllUser();
        req.setAttribute("userList",list);
        req.getRequestDispatcher("/WEB-INF/jsp/userManage.jsp").forward(req,resp);
    }

    private void updateTeacherById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        String name=req.getParameter("name");
        String introduce=req.getParameter("introduce");
        String pic=req.getParameter("pic");
        TeacherServiceImpl teacherService=new TeacherServiceImpl();
        teacherService.updateTeacher(new Teacher(id,name,introduce,pic));
        req.setAttribute("tMsg","T");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }
    private void updateSubjectById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        String name=req.getParameter("name");
        String type=req.getParameter("type");
        String info=req.getParameter("info");
        String teacher=req.getParameter("teacher");
        SubServiceImpl subService=new SubServiceImpl();
        subService.updateSubjectById(new Subject(id,name,type,info,teacher));
        req.setAttribute("sMsg","修改成功");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }
    private void updateVideoById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        String name=req.getParameter("name");
        String type=req.getParameter("type");
        String vid=req.getParameter("vid");
        System.out.println(vid+name+type);
        VideoServiceImpl videoService=new VideoServiceImpl();
        videoService.updateVideo(new Video(id,vid,name,type));
        req.setAttribute("vMsg","修改成功");
        req.getRequestDispatcher("message.jsp").forward(req,resp);
    }


    private void getFileByType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String type=req.getParameter("type");
        System.out.println(type);
        FileServiceImpl fileService=new FileServiceImpl();
        List<Files> filesList;
        if ("全部".equals(type)){
            filesList=fileService.getAllFile();
        }
        else {
            filesList=fileService.getFileByType(type);
        }
       /* SubServiceImpl subService=new SubServiceImpl();
        List<Subject> subjectList=subService.getAllSub();
        req.setAttribute("subjectList",subjectList);*/
        req.setAttribute("filesList",filesList);
        req.getRequestDispatcher("file.jsp").forward(req,resp);
    }
}
