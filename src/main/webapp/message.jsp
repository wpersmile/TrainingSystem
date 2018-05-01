<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/18
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>信息提示页</title>
</head>
<body>
<c:if test="${requestScope.message!=null}">
    <script>
        alert("successful");
        window.location.href="<%=basePath+"ActionServlet?method=managePage"%>";
    </script>
</c:if>
<c:if test="${requestScope.message==null}">
    <script>
        alert("failure");
        window.location.href="<%=basePath+"ActionServlet?method=managePage"%>";
    </script>
</c:if>
<p id="info">${requestScope.message}</p>
</body>
</html>
