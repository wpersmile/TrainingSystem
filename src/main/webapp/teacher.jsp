<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/26
  Time: 20:32
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
    <title>金牌讲师</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>
    <style>
        body{
            background-color: #ebebeb;
        }
        .show-tab{
            margin-top: 60px;
        }
        .show-teacher{
            margin-top: 20px;
        }
        .footer-body{
            padding-top: 20px;
            margin-top: 30px;
            text-align: center;
            background-color: dimgrey;
            color: white;
        }
        .footer-body a{
            color: whitesmoke;
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
<div class="show-tab">
    <img src="img/tea_banner.jpg" class="img-responsive">
</div>

<c:if test="${teacherList==null}">
    <c:redirect url="BaseServlet?method=getAllTeacher"/>
</c:if>



<%--<c:forEach items="${teacherList}"  var="list" varStatus="n">
   <div class="thumbnail" style="width: 33%;float: left;margin-bottom: 50px">
    <img src="${list.pic}" alt="${list.name}">
    <div class="caption" >
        <h3>${list.name}</h3>
        <p>${list.introduce}</p>
    </div>
    </div>
</c:forEach>
    </div>
</div>--%>
<div class="show-teacher">
    <c:if test="${teacherList==null}">
        <c:redirect url="BaseServlet?method=getAllTeacher"/>
    </c:if>
    <div class="container">
            <c:forEach items="${teacherList}" var="list">
                <div class="col-sm-8 col-md-3 col-lg-3">
                    <div class="thumbnail" style="height: 600px;padding-top: 10px;border-radius:18px;">
                        <img src="${list.pic}" alt="${list.name}">
                        <div class="caption">
                            <p><a href="tencent://message/?uin=775016131" class="btn btn-primary" role="button" style="width: 100%">了解更多？</a></p>
                            <h3>${list.name}</h3>
                            <h5>个人简历：</h5>
                            <p>${list.introduce}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
    </div>
</div>


<!--
	作者：wpersmile@qq.com
	时间：2018-04-25
	描述：footer
-->
<div class="footer-body">
    <span>想了解更多？米克学院唯一咨询群：</span>
    <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=cb271d05c55ab6a456af02f1918dcc5e48348c48428d26341158c4ba9a659f0e"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="米克学院官方咨询群" title="米克学院官方咨询群"></a>
    <br>
    <a href="about.jsp">关于我们</a>|
    <a target="_blank" href="tencent://message/?uin=775016131" alt="点击这里给我发消息" title="点击这里给我发消息">联系我们</a>|
    <a target="_blank" href="https://www.csdn.net/">学习论坛</a>|
    <a target="_blank" href="https://github.com/wpersmile">Github</a>
    <br />
    <span>Copyright © 2018-2018 All Rights Reserved</span>|
    <span>米克学院版权所有</span>
</div>
</body>
</html>
