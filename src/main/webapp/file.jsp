<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/16
  Time: 23:04
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
    <title>资料下载-米克学院教学资源</title>
    <meta name="keywords" content="培训,IT培训,java培训,大数据培训,前端培训,后台开发,云计算,学习资料">
    <meta name="description" content="米克学院从事线上线下IT培训，课程多样，内容丰富，致力于高素质软件开发人才的培训与培养。">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>

    <style>
        body{
            background-color:#f9f2f4;
        }
        .file-body{
            margin-top: 60px;
        }
        .file-list{
            background-color: #e5e5e5;
            padding-top: 8px;
            padding-left: 8px;
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
                <li><a href="about.html">学院介绍</a></li>
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









<c:if test="${filesList==null}">
    <c:redirect url="files.html"/>
</c:if>
<br>
<div class="file-body">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <form action="files_type.html" method="post">
                    <h3>根据类型查询文件</h3>
                    <select class="form-control" name="type">
                        <option>全部</option>
                        <option>java</option>
                        <option>大数据</option>
                        <option>C++</option>
                        <option>云计算</option>
                        <option>区块链</option>
                        <option>分布式</option>
                        <option>Python</option>
                    </select>
                    <button class="btn-primary" type="submit" style="width: 100%">查询文件</button>
                </form>
            </div>
            <div class="col-sm-9 col-xs-12">
                <c:forEach items="${filesList}" var="list">
                    <div class="file-list">
                        <h4>文件名：${list.name}</h4>
                        <h5>归属科：${list.type}</h5>
                        <h5>上传时间：${list.addTime}</h5>
                        <h5> <a href="${list.url}">下载文件</a></h5>
                        <hr/>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>
</html>
