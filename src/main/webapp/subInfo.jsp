<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/23
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>课程信息</title>
</head>
<body>
<p>${requestScope.name}</p>
<p>${requestScope.}</p>
</body>
</html>
