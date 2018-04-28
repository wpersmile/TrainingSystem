<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/18
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息提示页</title>
</head>
<body>
<c:if test="${requestScope.message!=null}">
    <script>
        //var str=document.getElementById("info").value;
        alert("successful");
        window.location.href="manage.jsp";
    </script>
</c:if>
<c:if test="${requestScope.message==null}">
    <script>
        alert("failure");
        window.location.href="manage.jsp";
    </script>
</c:if>
<p id="info">${requestScope.message}</p>
</body>
</html>
