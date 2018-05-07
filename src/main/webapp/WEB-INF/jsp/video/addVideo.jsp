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
    <c:redirect url="../../../login.jsp"/>
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
        .addTchBody{
            margin-top: 80px;
        }
    </style>
    <%--视频添加--%>
    <script>
        function checkVid() {
            var vid=document.getElementById("inVid").value;
            if (vid===""){
                return false
            }
            else {
                return true;
            }
        }
        function checkName() {
            var name=document.getElementById("inName").value;
            if (name===""){
                return false
            }
            else {
                return true;
            }
        }
        function checkTch() {
            if (checkName()&&checkVid()){
                document.getElementById("form-tch").submit();
            }
            else {
                alert("信息填写不完整，请重新填写");
            }
        }
    </script>
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
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<!--学院介绍主体-->
<div class="addTchBody">
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="up-body">
                    <form id="form-tch" action="BaseServlet?method=addVideo" method="post">
                        <div class="form-group">
                            <label for="inName">name</label>
                            <input type="text" class="form-control" id="inName" name="name" >
                        </div>
                        <div class="form-group">
                            <label for="inVid">vid</label>
                            <input type="text" class="form-control" id="inVid" name="vid" >
                        </div>
                        <div class="form-group">
                            <h3>请选择文件归类</h3>
                            <select class="form-control" name="type">
                                    <option>java</option>
                            </select>
                        </div>
                    </form>
                    <button type="submit" style="width: 100%" class="btn btn-primary" onclick="checkTch()">确认添加</button>
                </div>
            </div>
            <div class="col-sm-4 "></div>
        </div>
    </div>
</div>
</body>
</html>