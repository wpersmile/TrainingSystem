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
    <c:redirect url="login.jsp"/>
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
       .updateSubBody{
           margin-top: 80px;
       }
    </style>
    <%--课程添加--%>
    <script>
        function checkName() {
            var name=document.getElementById("inName").value;
            if (name===""){
                return false
            }
            else {
                return true;
            }
        }

        function checkInfo() {
            var info=document.getElementById("inInfo").value;
            if (info===""){
                return false
            }
            else {
                return true;
            }
        }

        function checkSubject() {
            if (checkName()&&checkInfo()){
                document.getElementById("form-sub").submit();
            }
            else {
                alert("信息填写不完整，请重新填写");
            }
        }

    </script>
    <%--教师添加--%>
    <script>
        function checkTName() {
            var name=document.getElementById("inTName").value;
            if (name===""){
                return false
            }
            else {
                return true;
            }
        }
        function checkTInfo() {
            var info=document.getElementById("inIntroduce").value;
            if (info===""){
                return false
            }
            else {
                return true;
            }
        }
        function checkTch() {
            if (checkTName()&&checkTInfo()){
                document.getElementById("form-tch").submit();
            }
            else {
                alert("信息填写不完整，请重新填写");
            }
        }
    </script>
    <%--文件上传js--%>
    <script>
        function checkFile() {
            var file=document.getElementById("exampleInputFile").value;
            if (file===""){
                alert("文件为空，请重新选择");
            }
            else {
                document.getElementById("form-up").submit();
            }
        }
    </script>
    <%--面板控制--%>
    <script language="JavaScript">
        $(function(){
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                //e.target // newly activated tab
                //e.relatedTarget // previous active tab
                var obj=e.target.innerHTML;
                $("#textshow").html(obj);
            });
        });
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

<!--学院介绍主体-->
<div class="updateSubBody">
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <c:forEach items="${subjectList}" var="list">
                    <form action="BaseServlet?method=updateSubjectById" method="post" id="form-sub">
                        <input type="hidden" name="id"value="${list.id}"/>
                        <div class="form-group">
                            <label for="inName">课程名字</label>
                            <input type="text" id="inName" name="name" class="form-control" value="${list.name}"/>
                        </div>
                        <div class="form-group">
                            <h3>请选择课程类型</h3>
                            <select class="form-control" name="type">
                                <option>${list.type}</option>
                                <option>基础</option>
                                <option>中级</option>
                                <option>高级</option>
                                <option>实战</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inTeacher">主讲教师</label>
                            <input type="text" id="inTeacher" name="teacher" class="form-control" value="${list.teacher}"/>
                        </div>
                        <div class="form-group">
                            <label for="inIntroduce">课程描述</label><br>
                            <textarea name="info" id="inIntroduce" placeholder="write some thing for teacher" class="form-control" style=height:300px;">${list.info}</textarea>
                            <span  class="label label-warning" id="check-pass-error"></span>
                        </div>
                        <button type="submit" class="btn btn-primary" onclick="checkSubject()"style="width: 100%">确认修改</button>
                    </form>
                </c:forEach>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</div>



</body>
</html>