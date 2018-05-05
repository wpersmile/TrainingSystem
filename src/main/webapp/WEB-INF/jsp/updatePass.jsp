<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/18
  Time: 23:57
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

    <script>
        function checkPass() {

            var pass = document.getElementById('inPass').value;
            var check = document.getElementById('inCheck').value;
            if (pass!=""){
                if (pass==check){
                    return true;
                }
                else {
                    alert("两次输入密码不正确，请重新输入");
                    return false;
                }
            }
            else {
                alert("密码不能为空");
                return false;
            }
        }
        function submitForm() {
            if (checkPass()){
                document.getElementById("myForm").submit();
            }

        }
    </script>

    <style>

    </style>
    <style type="text/css">
        body{
            background: #EAEAEA;
        }
        .body-update{
            margin-top: 80px;
        }
        .row-style{
            background:#DBDBDB;
            border-radius: 18px;
        }
        .form-update{
            padding: 20px 8px 20px 8px;
        }
        .btn-style{
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-size{
            width: 100%;
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
<div class="body-update">
    <div class="row">
        <div class="col-md-4 col-sm-3"></div>
        <div class="col-md-4 col-sm-6 col-xs-12 row-style">
            <!--用户登陆表单-->
            <c:if test="${sessionScope.user!=null}">
            <form action="/BaseServlet?method=updateUserPass" method="post" class="form-update" id="myForm">

                <div class="form-group">
                    <label for="inPass">新密码</label>
                    <input type="password"  class="form-control" name="pass" id="inPass">
                </div>
                <div class="form-group">
                    <label for="inCheck">再次输入</label>
                    <input type="password"  class="form-control" name="check" id="inCheck" onblur="checkPass()">
                </div>
            </form>
                <div class="btn-style">
                    <button type="submit" class="btn btn-primary btn-size" onclick="submitForm()">登录</button>
                </div>
            </c:if>
        </div>
        <div class="col-md-4 col-sm-3"></div>
    </div>
</div>



</body>
</html>
