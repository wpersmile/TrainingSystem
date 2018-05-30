<%@ page import="java.io.Writer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/15
  Time: 16:08
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
    <title>课程信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>

    <style>
        body{
            background-color:#e5e5e5;
        }
        .show-main{
            margin-top: 60px;
        }
        .sub-show{
            margin-bottom: 10px;
            background-color: whitesmoke;
            border-radius:18px;
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
                <li><a href="about.jsp">学院介绍</a></li>
                <li><a href="teacher.jsp">金牌讲师</a></li>
                <li><a href="subject.jsp">课程介绍</a></li>
                <li><a href="study.jsp" >在线试学</a></li>
                <li><a href="file.jsp">资料下载</a></li>

                <c:if test="${sessionScope.user==null}">
                    <li><a href="register.jsp">注册</a></li>
                    <li><a href="login.jsp">登录</a></li>
                </c:if>

                <c:if test="${sessionScope.user!=null}">
                    <li><a href="<%=basePath+"MeServlet"%>" >个人中心</a></li>
                </c:if>
                <c:if test="${sessionScope.type==0}">
                    <li><a href="<%=basePath+"ActionServlet?method=managePage"%>" >后台管理</a></li>
                </c:if>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>


<%--课程信息--%>
<c:if test="${subList==null}">
    <c:redirect url="subject.html"/>
</c:if>
<div class="show-main">
    <div class="container">
        <c:forEach items="${subList}" var="sub" varStatus="s">
        <div class="row">
            <div class="col-sm-2"></div>

            <div class="col-sm-8 sub-show">

                    <div class="sub-item">
                        <h3 style="color: #c0a16b">课程名称：${sub.name}</h3>
                        <h5><b>课程类型：${sub.type}</b></h5>
                        <h5>课程描述：</h5>
                        <p>${sub.info}</p>
                        <a style="font-size: 20px" target="_blank" href="tencent://message/?uin=775016131">了解更多</a>
                        <h4 style="color: dimgrey">主讲教师：${sub.teacher}</h4>
                        <br>
                        <c:if test="${sessionScope.user!=null}">
                            <a href="BaseServlet?method=addSubToUser&id=${sub.id}&name=${sub.name}" style="float: right">确认选择</a>
                        </c:if>
                        <hr>
                    </div>

            </div>

            <div class="col-sm-2"></div>
        </div>
        </c:forEach>

    </div>

    <%--选课与退选提示--%>

    <c:if test="${requestScope.addType==1}">
        <script>
            alert("选课成功");
            window.location.href="<%=basePath+"subject.jsp"%>";
        </script>
    </c:if>
    <c:if test="${requestScope.addType==0}">
        <script>
            alert("已经选择过该门课程");
        </script>
    </c:if>
</div>
</body>
</html>
