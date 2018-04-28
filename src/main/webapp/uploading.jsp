<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/17
  Time: 20:20
  To change this template use File | Settings | File Templates.
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
        .up-body{
            margin-top: 60px;
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
<div class="up-body">
    <%--文件上传表单--%>
    <form action="UpLoadingServlet" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="text" name="type" placeholder="文件类型">
        <button type="submit">上传</button>
    </form>
    <c:if test="${requestScope.message!=null}">
        <script>
            alert("上传成功");
            window.location.href="/file.jsp";
        </script>
    </c:if>
</div>

</body>
</html>
