<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/28
  Time: 16:34
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
    <title>米克学院</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>

    <style type="text/css">
        .body-1{
            margin-top: 51px;
            font-size: 18px;
            background-color: #DDDDDD;
            text-decoration: none;
        }
        .footer-body a{
            color:black;
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
                <li><a href="study.jsp" >在线试学</a></li>
                <li><a href="file.jsp">资料下载</a></li>
                <li></li>

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

<div class="body-1">
    <h1>米克学院在线试学视频</h1><br>
    <c:if test="${vList==null}">
        <c:redirect url="VideoServlet"/>
    </c:if>
    <c:forEach items="${vList}" var="list">
        <ul>
            <li><a target="_blank" href="video.jsp?vid=${list.vid}">${list.name}</a> </li>
        </ul>
    </c:forEach>
</div>

<h2> <a target="_blank" href="tencent://message/?uin=775016131" alt="点击这里给我发消息" title="点击这里给我发消息">获取更多</a></h2>
</body>




<footer class="footer navbar-fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4" style="text-align: center;">
                <span>Copyright © 2018-2018 All Rights Reserved</span>
                <br/>
                <span>版权所有：米克培训基地</span>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</footer>
</html>
