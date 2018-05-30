<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/24
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${requestScope.message!=null}">
    <script>
        alert("上传成功");
        window.location.href="/file.jsp";
    </script>
</c:if>
<c:if test="${sessionScope.type!=0}">
    <c:redirect url="../../login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>学院介绍</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>

    <style type="text/css">
        .fileBody{
            margin-top: 80px;
        }
    </style>
</head>
<body>

<!--导航栏-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">后台管理</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">前往学院</a></li>
                <li><a href="<%=basePath+"ActionServlet?method=userManagePage"%>">用户管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">课程管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath+"BaseServlet?method=getAllSubjectM"%>">课程列表</a></li>
                        <li><a href="<%=basePath+"ActionServlet?method=addSubPage"%>">课程添加</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">视频管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath+"BaseServlet?method=getAllVideoM"%>">视频列表</a></li>
                        <li><a href="<%=basePath+"ActionServlet?method=addVideoPage"%>">视频添加</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">教师管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath+"BaseServlet?method=getAllTeacherM"%>">教师列表</a></li>
                        <li><a href="<%=basePath+"ActionServlet?method=addTchPage"%>">教师添加</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">文件管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath+"BaseServlet?method=getAllFilesM"%>">文件列表</a></li>
                        <li><a href="<%=basePath+"ActionServlet?method=addFilePage"%>">文件添加</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<!--视频列表-->
<div class="fileBody">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <table class="table table-striped table-hover table-bordered">
                    <caption>视频表</caption>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>vid</th>
                        <th>name</th>
                        <th>type</th>
                        <th>#</th>
                        <th>#</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${videoList}" var="list" varStatus="num">
                        <tr class="success">
                            <th>${num.index}</th>
                            <th>${list.vid}</th>
                            <th>${list.name}</th>
                            <th>${list.type}</th>
                            <th><a href="ActionServlet?method=updateVideoPage&id=${list.id}">修改</a> </th>
                            <th><a href="BaseServlet?method=deleteVideo&id=${list.id}">删除</a></th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
