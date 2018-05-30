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
    <title>MSG</title>
</head>
<body>
<%--<c:if test="${requestScope.message!=null}">
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
<p id="info">${requestScope.message}</p>--%>



<%--用户--%>
<c:if test="${requestScope.udMsg == 'F'}">
    <script>
        alert("删除失败，管理员账户不支持删除");
        window.location.href="<%=basePath+"ActionServlet?method=userManagePage"%>";
    </script>
</c:if>
<c:if test="${requestScope.udMsg == 'T'}">
    <script>
        alert("删除成功");
        window.location.href="<%=basePath+"ActionServlet?method=userManagePage"%>";
    </script>
</c:if>

<%--修改教师消息--%>
<c:if test="${requestScope.tMsg == 'T'}">
    <script>
        alert("修改成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllTeacherM"%>";

    </script>
</c:if>

<%--删除教师消息--%>
<c:if test="${requestScope.tMsg == '删除成功'}">
    <script>
        alert("删除成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllTeacherM"%>";
    </script>
</c:if>

<%--添加教师消息--%>
<c:if test="${requestScope.tMsg == '添加成功'}">
    <script>
        alert("添加成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllTeacherM"%>";
    </script>
</c:if>
<c:if test="${requestScope.tMsg == '添加失败'}">
    <script>
        alert("添加失败");
        window.location.href="<%=basePath+"BaseServlet?method=getAllTeacherM"%>";
    </script>
</c:if>

<%--修改课程信息--%>
<c:if test="${requestScope.sMsg == '修改成功'}">
    <script>
        alert("修改成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllSubjectM"%>";
    </script>
</c:if>
<%--删除课程信息--%>
<c:if test="${requestScope.sMsg == '删除成功'}">
    <script>
        alert("删除成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllSubjectM"%>";
    </script>
</c:if>
<%--添加课程信息--%>
<c:if test="${requestScope.sMsg == '添加成功'}">
<script>
    alert("添加成功");
    window.location.href="<%=basePath+"BaseServlet?method=getAllSubjectM"%>";
</script>
</c:if>
<%--文件上传信息--%>
<c:if test="${requestScope.fMsg == '上传成功'}">
    <script>
        alert("上传成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllFilesM"%>";
    </script>
</c:if>
<c:if test="${requestScope.fMsg == '上传失败'}">
    <script>
        alert("上传失败");
        window.location.href="<%=basePath+"BaseServlet?method=getAllFilesM"%>";
    </script>
</c:if>
<c:if test="${requestScope.fMsg == '删除成功'}">
<script>
    alert("删除成功");
    window.location.href="<%=basePath+"BaseServlet?method=getAllFilesM"%>";
</script>
</c:if>

<%--添加视频消息--%>
<c:if test="${requestScope.vMsg == '添加成功'}">
    <script>
        alert("添加成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllVideoM"%>";
    </script>
</c:if>
<%--删除视频消息--%>
<c:if test="${requestScope.vMsg == '删除成功'}">
    <script>
        alert("删除成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllVideoM"%>";
    </script>
</c:if>
<%--修改视频信息--%>
<c:if test="${requestScope.vMsg == '修改成功'}">
    <script>
        alert("修改成功");
        window.location.href="<%=basePath+"BaseServlet?method=getAllVideoM"%>";
    </script>
</c:if>

</body>
</html>
