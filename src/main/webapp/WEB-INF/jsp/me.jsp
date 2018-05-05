<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/3/29
  Time: 20:39
  To change this template use Files | Settings | Files Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



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

    <style>
        .show-userInfo{
            margin-top: 55px;
            margin-left: 5px;
            margin-bottom: 20px;
        }
        .show-classInfo{
            margin-top: 20px;
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
            <a class="navbar-brand" href="index.jsp">米克学院</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">首页</a></li>
                <li><a href="about.jsp">学院介绍</a></li>
                <li><a href="teacher.jsp">金牌讲师</a></li>
                <li><a href="subject.jsp">课程介绍</a></li>
                <li><a href="file.jsp">资料下载</a></li>

                <c:if test="${sessionScope.user==null}">
                    <li><a href="register.jsp">注册</a></li>
                    <li><a href="login.jsp">登录</a></li>
                </c:if>

                <c:if test="${sessionScope.user!=null}">
                    <li><a href="<%=basePath+"MeServlet"%>" >个人中心</a></li>
                </c:if>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<br>
<div class="show-userInfo">
    <h3>用户基本信息</h3>
    <c:forEach items="${userList}" var="user">
        <h5>昵称：${user.name}</h5>
        <h5>邮箱：${user.email}</h5>
        <h5>性别：${user.sex}</h5>
        <h5>简介：${user.introduce}</h5>

        <br>
        <form action="ActionServlet?method=updateUserInfo&name=${user.name}" method="post">
            <button class="btn btn-primary">修改个人资料</button>
        </form>
    </c:forEach>

    <br>
    <form action="ActionServlet?method=updatePass" method="post">
        <button  class="btn btn-primary">修改个人密码</button>
    </form>
</div>

<hr>

<div class="show-classInfo">
    <h3>用户课程信息</h3>
    <table class="table table-striped table-hover table-bordered">
        <caption>个人所选课程：${requestScope.subNum}门</caption>
        <thead>
        <tr>
            <th>name</th>
            <th>退选课程</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${mySubjectList}" var="subject">
            <tr class="success">
                <th>${subject.subName}</th>
                <th><a href="BaseServlet?method=deleteSubForUser&name=${subject.subName}">删除</a> </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <c:if test="${requestScope.deleteType==1}">
        <script>
            alert("退选成功");
        </script>
    </c:if>
    <c:if test="${requestScope.deleteType==0}">
        <script>
            alert("失败,不存在改课程");
        </script>
    </c:if>
</div>
</body>
</html>
