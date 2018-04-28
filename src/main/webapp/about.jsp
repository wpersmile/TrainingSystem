<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/4/26
  Time: 20:26
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
        .my-nav{
            margin-top: 60px;
            text-indent: 2em;
        }
        .nav-body-left{
            height: 650px;
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
            <a class="navbar-brand" href="index.jsp">米克学院</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">首页</a></li>
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
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>


<!--学院介绍主体-->

<div class="my-nav">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2 nav-body-left">
                <!--选项卡-->
                <ul class="nav nav-pills nav-stacked">
                    <!--data-toggle="tab" 触发js切换面板效果-->
                    <li><a href="#pane1" data-toggle="tab">学院简介</a></li>
                    <li><a href="#pane2" data-toggle="tab">发展历史</a></li>
                    <li><a href="#pane3" data-toggle="tab">取得成就</a></li>
                </ul>
            </div>
            <div class="rol-sm-11">
                <span>首页&nbsp;>&nbsp;</span>
                <span>学院介绍&nbsp;>&nbsp;</span>
                <span id="textshow">学院介绍</span>
                <!--面板-->
                <div class="tab-content">
                    <div class="tab-pane active" id="pane1">
                        <h2>学院简介</h2>
                        <p>米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。</p>
                        <p>米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。</p>

                        <p>米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。</p>

                        <p>米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。</p>

                        <p>米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。</p>

                        <p>米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。</p>


                        <p>米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。
                            米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。
                            米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。
                            米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。
                            米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。
                            米克学院创办于2014年，至今已有4年历史，在四年内，培养了一批又一批的学员。</p>

                    </div>
                    <div class="tab-pane" id="pane2">

                        2014创办->2015年进行线下培训模式->2017年准备开展线下线下教育模式->2018年正式开始互联网教育模式
                    </div>
                    <div class="tab-pane" id="pane3">
                        <h2>2014年至今，培训超过3万名学员</h2>
                        <h3>学员满意度高达：<b>90%</b></h3>
                        <h3>学员就业率高达：<b>80%</b></h3>
                        <h3>学员平均薪资：<b>7000/月</b></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!--
作者：wpersmile@qq.com
时间：2018-04-25
描述：footer
-->

<div class="footer-body">
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
