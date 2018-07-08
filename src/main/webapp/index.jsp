<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/3/8
  Time: 19:08
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
    <title>米克学院-做有情怀的、良心的IT培训</title>
    <meta name="keywords" content="培训,IT培训,java培训,大数据培训,前端培训,后台开发,云计算">
    <meta name="description" content="米克学院从事线上线下IT培训，课程多样，内容丰富，致力于高素质软件开发人才的培训与培养。">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>

    <style type="text/css">
        .body-carousel{
            margin-top: 51px;
        }
        .body-1{
            font-size: 18px;
            background-color: #DDDDDD;
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
            <a class="navbar-brand" href="index.html">米克学院</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="about.html">学院介绍</a></li>
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
<!--轮播图-->

<div id="carousel-example-generic" class="carousel slide body-carousel" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item">
            <img src="img/2.jpg" alt="IT培训-米克学院">
        </div>
        <div class="item active">
            <img src="img/1.jpg" alt="IT培训-米克学院">
        </div>
        <div class="item">
            <img src="img/3.jpg" alt="IT培训-米克学院">
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!--
	作者：wpersmile@qq.com
	时间：2018-04-25
	描述：主要内容
-->
<div class="body-1">

    <div class="container">
        <div class="row">
            <div class="col-sm-1 col-md-2"></div>
            <div class="col-sm-11 col-xs-12 col-md-10">

                <h1>互联网行业风口独舞 黄金时代强势崛起</h1>
                <br>
                <br>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-11 col-xs-12 col-md-11">
                <p>以“让学员技术靠谱、做人更靠谱”为使命，传承极致的工匠精神，深耕PHP、Java、大数据、Python全栈+人工智能、Linux云计算、UI设计、前端全栈、网络营销等学科教研，拥有来自北大、清华和BAT等知名校企的专兼职教师数百名。</p>
                <br>
                <p>课程体系每年升级，定期微调，讲师、项目经理均为专职，培养体系严谨、实用；大牛讲师，学员打分体系，讲师好不好你说了算！</p>
                <br>
                <p>课上采用案例式教学，通俗易懂，课下项目经理一对一辅导强化训练，学与练交叉进行强化记忆，你所要做的就是认真听，勤于问，乐于练。</p>
                <br>
                <p>学不会，无限期免费重修；找工作，无限期免费推荐。毕业后，你会发现JavaEE高手的圈子里到处都是你的人脉，让你在职场更加如虎添翼。</p>
                <br>
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
    <span>想了解更多？米克学院唯一咨询群：</span>
    <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=cb271d05c55ab6a456af02f1918dcc5e48348c48428d26341158c4ba9a659f0e">
        <img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="米克学院官方咨询群" title="米克学院官方咨询群"></a>
    <br>
    <a href="about.jsp">关于我们</a>|
    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=775016131&site=qq&menu=yes">联系我们</a>|
    <a target="_blank" href="https://www.csdn.net/">学习论坛</a>|
    <a target="_blank" href="https://github.com/wpersmile">Github</a>
    <br />
    <span>Copyright © 2018-2018 All Rights Reserved</span>|
    <span>米克学院版权所有</span>
</div>

</body>
</html>














<%--<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/bootstrap.css">


    !-- Bootstrap theme -->
    <link href="../../dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="theme.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <title>米克IT-培训基地</title>
</head>
<body>
<div class="top">
    <a href="index.jsp"><img src="bmp/logo.png"></a>
</div>
<div class="nav">
    <div class="left-head">
    </div>
    <div class="center-head">
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="subject.jsp">课程分类</a></li>
            <li><a href="">机构介绍</a></li>
            <li><a href="">金牌讲师</a></li>
            <li><a href="file.jsp">资料下载</a></li>
        </ul>
    </div>

    <div class="right-head">
        <c:if test="${sessionScope.user==null}">
            <ul>
                <li><a href="register.jsp">注册</a></li>
                <li><a href="login.jsp">登陆</a></li>
            </ul>
        </c:if>
        <c:if test="${sessionScope.user!=null}">
            <a href="<%=basePath+"MeServlet"%>">个人中心</a>
        </c:if>
    </div>
</div>



&lt;%&ndash;
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">米克培训基地</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">首页</a></li>
                <li><a href="#about">结构介绍</a></li>
                <li><a href="#contact">金牌讲师</a></li>
                <li><a href="subject.jsp">课程分类</a></li>
                <li><a href="file.jsp">资料下载</a></li>

                <c:if test="${sessionScope.user==null}">
                    <li><a href="register.jsp">注册</a></li>
                    <li><a href="login.jsp">登录</a></li>
                </c:if>

                <c:if test="${sessionScope.user!=null}">
                    <li><a href="<%=basePath+"MeServlet"%>" >个人中心</li>
                </c:if>

            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

&ndash;%&gt;


<div class="center-body">
    <p>这是网站主体内容</p>
</div>
<div class="footer">
    <p>这是底边</p>
</div>




















<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>




</body>
</html>--%>
