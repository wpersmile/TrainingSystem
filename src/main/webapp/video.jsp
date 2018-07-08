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
    <title>Java在线试学-米克学院</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>

    <style type="text/css">
        .body-1{
            margin-top: 51px;
            font-size: 18px;
            background-color: #DDDDDD;
        }
        .mv{
            margin-left: auto;
            margin-right: auto;
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
            <a class="navbar-brand" href="index.html">米克学院</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.html">首页</a></li>
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
                <c:if test="${sessionScope.type==0}">
                    <li><a href="<%=basePath+"ActionServlet?method=managePage"%>" >后台管理</a></li>
                </c:if>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="body-1" STYLE="z-index: 999">
    <div class="container">
        <div class="col-lg-2"></div>
        <div class="col-lg-8 col-xs-12">
            <%--<iframe src="http://v.qq.com/iframe/player.html?vid=${param.vid}&width=800&height=477&auto=0" height="485" width="805"></iframe>--%>
            <iframe frameborder="0" width="100%" height="485" src="https://v.qq.com/iframe/player.html?vid=${param.vid}&tiny=0&auto=0" allowfullscreen></iframe>
        </div>
        <div class="col-lg-2"></div>
    </div>
</div>


<footer class="footer navbar-fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4" style="text-align: center;">
                <span>想了解更多？米克学院唯一咨询群：</span>
                <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=cb271d05c55ab6a456af02f1918dcc5e48348c48428d26341158c4ba9a659f0e"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="米克学院官方咨询群" title="米克学院官方咨询群"></a>
                <br>
                <span>Copyright © 2018-2018 All Rights Reserved</span>
                <br/>
                <span>版权所有：米克培训基地</span>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</footer>

</body>


</html>
