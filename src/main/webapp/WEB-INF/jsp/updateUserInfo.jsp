<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/13
  Time: 17:10
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
        .form-login{
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
            <%--对登录信息判断--%>
            <c:if test="${sessionScope.message!=null}">
                <br/>
                <span  class="label label-warning" id="check-submit-error" style="font-size: 15px">${sessionScope.message}</span>
                ${sessionScope.message=null}
            </c:if>
            <!--修改用户信息-->
            <form action="BaseServlet?method=updateUserInfo" method="post" class="form-login" id="myForm">
                <div class="form-group">
                    <label for="inName">昵称</label>
                    <input type="text" class="form-control" id="inName" name="name" value="${requestScope.name}"/>
                    <span  class="label label-warning" id="check-phone-error"></span>
                </div>
                <div class="form-group">
                    <label>请选择性别</label><br>
                    <label for="sexMid"><input type="radio" id="sexMid" value="0" name="choseSex">保密</label>
                    <label for="sexBoy"><input type="radio" id="sexBoy" value="1" name="choseSex">男</label>
                    <label for="sexGirl"><input type="radio" id="sexGirl" value="2" name="choseSex">女</label>
                    <br>
                </div>

                <div class="form-group">
                    <label for="inIntroduce">简介</label><br>
                    <textarea name="introduce" id="inIntroduce" placeholder="write some thing for you" class="form-control" style=height:300px;"></textarea>
                    <span  class="label label-warning" id="check-pass-error"></span>
                </div>
                <div class="btn-style">
                    <button type="submit" class="btn btn-primary btn-size" id="updateOk" onclick="submitForm()">提交修改</button>
                </div>
            </form>
        </div>
        <div class="col-md-4 col-sm-3"></div>
    </div>
</div>





</body>
</html>
