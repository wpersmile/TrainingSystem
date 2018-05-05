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
        .my-nav {
            margin-top: 60px;
        }
        .up-body{
            height: 610px;

        }
        .my-nav  button{
            width: 100%;
        }
        .footer-body{
            background-color: #AAAAAA;
            text-align: center;
            padding-bottom: 5px;
            padding-top: 18px;
        }
        .footer-body a{
            color:black;
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
                <!--data-toggle="tab" 触发js切换面板效果-->
                <li><a href="#pane1" data-toggle="tab">用户管理</a></li>
                <li><a href="#pane2" data-toggle="tab">文件上传</a></li>
                <li><a href="#pane3" data-toggle="tab">视频管理</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">课程管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#sub1" data-toggle="tab">课程列表</a></li>
                        <li><a href="#sub2" data-toggle="tab">课程添加</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">教师管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#tch1" data-toggle="tab">教师列表</a></li>
                        <li><a href="#tch2" data-toggle="tab">教师添加</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<!--轮播图-->
<!--学院介绍主体-->

<div class="my-nav">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                <span>米克学院&nbsp;>&nbsp;</span>
                <span>后台管理&nbsp;>&nbsp;</span>
                <span id="textshow">用户管理</span>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <!--面板-->
                <div class="tab-content">
                    <%--active为选择当前--%>
                    <div class="tab-pane active" id="pane1">
                        <table class="table table-striped table-hover table-bordered">
                            <caption>用户表</caption>
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>name</th>
                                <th>phone</th>
                                <th>email</th>
                                <th>sex</th>
                                <th>type</th>
                                <th>regTime</th>
                                <th>#</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${userList==null}">
                                <c:redirect url="ManageServlet"/>
                            </c:if>
                            <c:forEach items="${userList}" var="list" varStatus="num">
                                <tr class="success">
                                    <th>${num.index}</th>
                                    <th>${list.name}</th>
                                    <th>${list.phone}</th>
                                    <th>${list.email}</th>
                                    <th>${list.sex}</th>
                                    <th>${list.type}</th>
                                    <th>${list.regTime}</th>
                                    <th><a href="BaseServlet?method=deleteUser&id=${list.id}&type=${list.type}">删除</a> </th>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane" id="pane2">
                        <div class="row">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4">
                                <div class="up-body">
                                    <form id="form-up" action="UpLoadingServlet" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="exampleInputFile"><h3>请选择上传的文件</h3></label>
                                            <input type="file" id="exampleInputFile" name="file">
                                            <p class="help-block">请规范上传文件内容和文件格式</p>
                                        </div>
                                        <div class="form-group">
                                            <h3>请选择文件归类</h3>
                                            <c:if test="${subList==null}">
                                                <c:redirect url="/ManageServlet"/>
                                            </c:if>
                                            <select class="form-control" name="type">
                                                <c:forEach items="${subList}" var="list">
                                                    <option>${list.name}</option>
                                                 </c:forEach>
                                            </select>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-primary" onclick="checkFile()">确认上传</button>
                                </div>
                            </div>
                            <div class="col-sm-4 "></div>
                        </div>
                    </div>
                    <div class="tab-pane" id="sub1">
                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-striped table-hover table-bordered">
                                    <caption>课程表</caption>
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>name</th>
                                        <th>type</th>
                                        <th>info</th>
                                        <th>addTime</th>
                                        <th>删除课程</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${subList==null}">
                                        <c:redirect url="ManageServlet"/>
                                    </c:if>
                                    <c:forEach items="${subList}" var="list" varStatus="num">
                                        <% int i=0; %>
                                        <tr class="success">
                                            <th>${num.index}</th>
                                            <th>${list.name}</th>
                                            <th>${list.type}</th>
                                            <th>${list.info}</th>
                                            <th>${list.addTime}</th>
                                            <th><a href="BaseServlet?method=deleteSub&id=${list.id}">删除</a> </th>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="sub2" style="height: 610px">
                        <div class="row">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4">
                                <form action="SubjectServlet" method="post" id="form-sub">
                                    <input type="hidden" name="postType"value="addSub"/>
                                    <div class="form-group">
                                        <label for="inName">课程名字</label>
                                        <input type="text" id="inName" name="addName" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <h3>请选择课程类型</h3>
                                        <select class="form-control" name="type">
                                            <option>基础</option>
                                            <option>中级</option>
                                            <option>高级</option>
                                            <option>实战</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inTeacher">主讲教师</label>
                                        <input type="text" id="inTeacher" name="teacher" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inInfo">课程描述</label>
                                        <input type="text" id="inInfo" name="info" class="form-control"/>
                                    </div>

                                </form>
                                <button type="submit" class="btn btn-primary" onclick="checkSubject()">确认添加</button>
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tch1">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-striped table-hover table-bordered">
                                        <caption>教师表</caption>
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>name</th>
                                            <th>info</th>
                                            <th>删除教师</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${teacherList==null}">
                                            <c:redirect url="ManageServlet"/>
                                        </c:if>
                                        <c:forEach items="${teacherList}" var="list" varStatus="num">
                                            <% int i=0; %>
                                            <tr class="success">
                                                <th>${num.index}</th>
                                                <th>${list.name}</th>
                                                <th>${list.introduce}</th>
                                                <th><a href="BaseServlet?method=deleteTch&id=${list.id}">删除</a> </th>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>
                    <div class="tab-pane" id="tch2">
                        <div class="row">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4">
                                <div class="up-body">
                                    <form id="form-tch" action="TeacherServlet" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="inTName">名字</label>
                                            <input type="text" class="form-control"id="inTName" name="name" >
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile"><h3>请选择头像</h3></label>
                                            <input type="file" id="inputPic" name="file">
                                            <p class="help-block">请规范上传文件内容和文件格式</p>
                                        </div>
                                        <div class="form-group">
                                            <label for="inIntroduce">简介</label><br>
                                            <textarea name="introduce" id="inIntroduce" placeholder="write some thing for teacher" class="form-control" style=height:300px;"></textarea>
                                            <span  class="label label-warning" id="check-pass-error"></span>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-primary" onclick="checkTch()">确认添加</button>
                                </div>
                            </div>
                            <div class="col-sm-4 "></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:if test="${requestScope.message!=null}">
<script>
    alert("上传成功");
    window.location.href="/file.jsp";
</script>
</c:if>

<!--
作者：wpersmile@qq.com
时间：2018-04-25
描述：footer
-->

<div class="footer-body">
    <a href="../../about.jsp">关于我们</a>|
    <a target="_blank" href="tencent://message/?uin=775016131" alt="点击这里给我发消息" title="点击这里给我发消息">联系我们</a>|
    <a target="_blank" href="https://www.csdn.net/">学习论坛</a>|
    <a target="_blank" href="https://github.com/wpersmile">Github</a>
    <br />
    <span>Copyright © 2018-2018 All Rights Reserved</span>|
    <span>米克学院版权所有</span>
</div>
</body>
</html>