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
        .show-body{
            margin-top: 20px;
            margin-bottom: 20px;
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
                    <li><a href="#pane3" data-toggle="tab">学院优势</a></li>
                </ul>
            </div>
            <div class="col-sm-8">
                <span>首页&nbsp;>&nbsp;</span>
                <span>学院介绍&nbsp;>&nbsp;</span>
                <span id="textshow">学院介绍</span>
                <!--面板-->
                <div class="tab-content show-body" >
                    <div class="tab-pane active" id="pane1">
                        <img src="img/about01.png" class="img-responsive">
                        <br>
                        <p>米克学院教育（以下简称米克学院）是易第优（北京）教育咨询股份有限公司旗下品牌，致力于高素质软件开发人才的培训与培养。公司成立于2007年，总部设在北京，目前已在上海、广州、深圳、郑州、沈阳、成都、南京、杭州、宁波、石家庄、南昌等城市设立了教学中心，业务范围覆盖全国。2016年5月获得华图教育1.25亿元投资，同年9月挂牌新三板。</p>
                        <p>米克学院以“让学员技术靠谱、做人更靠谱”为使命，传承极致的工匠精神，深耕PHP、Java、大数据、Python全栈+人工智能、Linux云计算、UI设计、前端全栈、网络营销等学科教研，拥有来自北大、清华和BAT等知名校企的专兼职教师数百名。超前的产品研发、线上线下相结合的科学教学模式和严格的教务管理体系共同确保了教学质量，使数十万名学员、从业人员和IT爱好者受惠，为华为、阿里巴巴、腾讯、百度、联想、京东等国内7000多家企业输送数万名软件开发和网络营销人才。</p>
                        <p>除了强大的线下集中培训外，为在职和自学能力较强人士量身打造的IT云课堂，将线上课程与线下最新的面授课同步，并通过一对一贴身服务等措施，实现了优质的教学效果。米克学院还与国内200多所高等院校展开深度合作，让在校大学生参与真实的企业级项目研发，独立设计开发商业项目，享受到和米克学院学员一样的企业级项目实战训练，广受各界好评。</p>
                        <p>米克学院旗下拥有米克学院大学和兄弟会、智校云两家软件公司，集学历教育、技术培训和软件开发于一体。米克学院大学致力于为社会培养实用技能型人才，设有软件学院、工业机器人学院、创新学院，通过职业化管理和商业项目实战学习，培养满足企业需求的IT专业技术人才；兄弟会是一家以IT技术支持、项目外包、人才离岸外包等为主营业务的科技公司，为创业公司提供成建制的开发团队；北京智校云网络科技有限公司致力于为教育企业提供信息化产品，包含ERP系统、在线教育平台、教育周边小程序开发等。</p>
                        <p>米克学院在职业教育培训行业首创“零学费学习”模式，以优秀的教学效果和先进的经营模式赢得各界权威机构的认可，各类免费学习视频累计播放达数亿次。公司先后荣获腾讯网“年度特色职业教育品牌”、百度教育“2017年度新锐教育品牌”等多项荣誉。公司编写的教材《细说PHP》自2009年首次印刷以来再版8次，先后荣获51CTO“读者喜爱的原创IT技术图书奖”、电子工业出版社2013年年度畅销 IT 技术图书奖和2016年年度好书等数十项荣誉。公司的综合性职业发展自媒体《明哥聊求职》荣获“2017教育行业优秀自媒体”大奖。</p>
                        <p>米克学院将始终以强大的师资阵容、严苛的教学管理体系和先进的课程研发理念，致力于培养中国优秀的IT职业精英！</p>
                        
                    </div>
                    <div class="tab-pane" id="pane2">
                        <img src="img/about03.jpg" class="img-responsive">
                        <br>
                        <p>2006年11月 策划、筹建米克学院</p>
                        <p>2007年04月 北京易第优教育咨询有限公司（米克学院）注册成立</p>
                        <p>2007年04月 米克学院第一期PHP周末班开课</p>
                        <p>2007年10月 米克学院第一期PHP就业班开课</p>
                        <p>2007年12月 米克学院荣获“老学员一致认可的职业培训机构”殊荣</p>
                        <p>2008年10月 发布米克学院文化“无兄弟 不编程”</p>
                        <p>2009年10月 米克学院教材《细说PHP》出版</p>
                        <p>2010年04月 米克学院总部迁址中关村软件园</p>
                        <p>2010年10月 米克学院引入职业化管理模式：学员就是职员，提升就业竞争力</p>
                        <p>2010年11月 米克学院国内首推“零学费学习”模式</p>
                        <p>2011年03月 米克学院发布PHP学习视频突破500个</p>
                        <p>2011年11月 米克学院总部迁址育荣国际教育园区，占地一万多平米</p>
                        <p>2012年01月 《细说PHP》第七次印刷，销售量突破两万册，国内同类书籍销量较好</p>
                        <p>2012年03月 发布米克学院核心价值“优秀的教学、严格的管理、职业素质课贯穿”</p>
                        <p>2012年04月 发布米克学院精神“简单、踏实、不抛弃、不放弃、勇于担当、敢于亮剑”</p>
                        <p>2012年05月 米克学院PHP学习视频累计下载突破1000万次</p>
                        <p>2012年08月 同时在校学生超过1000人</p>
                        <p>2012年09月 米克学院第一期Android就业班开课</p>
                        <p>2012年10月 米克学院教材《细说PHP（第2版）》出版</p>
                        <p>2012年11月 《细说PHP》荣获51CTO“读者喜爱的原创IT技术图书”奖</p>
                        <p>2012年12月 米克学院上海校区成立</p>
                        <p>2013年01月 米克学院第六十期PHP就业班开课，累计培训PHP程序员突破5000人</p>
                        <p>2013年02月 上海校区第一期PHP就业班开课</p>
                        <p>2013年04月 学员就业合作企业超过2000家</p>
                        <p>2013年06月 发布国内首创的Java/安卓搞笑学习系列视频</p>
                        <p>2013年09月 发布全新Android视频学习教程，引领行业新标准</p>
                        <p>2013年10月 米克学院深度合作院校突破100家</p>
                        <p>2014年01月 《细说PHP》获电子工业出版社2013年年度畅销IT技术图书奖</p>
                        <p style="text-indent: 8em">米克学院2014新版PHP视频教程开始发布</p>
                        <p>2014年02月 米克学院云课堂正式上线</p>
                        <p>2014年03月 米克学院2014新版Linux视频教程发布</p>
                        <p>2014年04月 米克学院Unity首期班开课</p>
                        <p>2014年06月 米克学院云课堂注册用户突破万人</p>
                        <p>2014年07月 米克学院团队在微软&触控Cocos2d-x黑客松获奖</p>
                        <p style="text-indent: 8em">米克学院Cocos2d-x首期班开课</p>
                        <p>2014年08月 米克学院发布Linux云计算架构师课程</p>
                        <p>2014年09月 米克学院论坛注册会员人数突破30万</p>
                        <p>2014年10月 Linux运维工程师首期班开课</p>
                        <p>2014年11月 UI设计师首期班开课</p>
                        <p style="text-indent: 8em">《明哥聊求职》在线职场课程发布</p>
                        <p>2014年12月 米克学院广东校区成立</p>
                        <p>2015年03月 米克学院沈阳校区成立</p>
                        <p>2015年05月 米克学院获千万级投资</p>
                        <p>2015年06月 米克学院北京第二校区投入运营</p>
                        <p style="text-indent: 8em">米克学院&GMGC手游学院成立</p>
                        <p style="text-indent: 8em">米克学院&博彦科技人才孵化基地成立</p>
                        <p style="text-indent: 8em">米克学院发布iOS课程</p>
                        <p style="text-indent: 8em">米克学院发布HTML5课程</p>
                        <p>2015年09月 米克学院扬州校区成立</p>
                        <p style="text-indent: 8em">米克学院郑州校区成立</p>
                        <p>2015年10月 米克学院济南校区成立</p>
                        <p style="text-indent: 8em">米克学院与LUPA全面开展合作</p>
                        <p style="text-indent: 8em">米克学院与玖富集团达成战略合作</p>
                        <p>2016年1月 《跟米克学院学PHP》出版</p>
                        <p>2016年02月 米克学院成都校区成立</p>
                        <p>2016年03月 米克学院杭州校区成立</p>
                        <p>2016年04月 米克学院南京校区成立
                        米克学院打造IT培训行业新标准“5包服务”</p>
                        <p>2016年05月 获华图资本1.25亿元战略投资</p>
                        <p style="text-indent: 8em">米克学院股改完成，更名为“易第优（北京）教育咨询股份有限公司”</p>
                        <p>2016年06月 米克学院推出JAVAEE+大数据学科</p>
                        <p style="text-indent: 8em">米克学院推出精品课程IT培优项目</p>
                        <p>2016年07月 米克学院推出全栈工程师学科</p>
                        <p>2016年08月 米克学院深圳校区成立</p>
                        <p>2016年09月 米克学院新三板挂牌上市（股票代码：839467）</p>
                        <p>2016年10月 米克学院太原校区成立</p>
                        <p>2016年11月 米克学院大连校区成立</p>
                        <p>2017年01月 《跟米克学院学PHP 精要版》出版</p>
                        <p>2017年02月 《跟米克学院学PHP》获评2016年电子工业出版社年度好书</p>
                        <p>2017年03月 米克学院宁波校区成立</p>
                        <p style="text-indent: 8em">米克学院成都第二校区成立</p>
                        <p>2017年05月 《明哥聊求职》出版</p>
                        <p style="text-indent: 8em">西安校区成立</p>
                        <p>2017年07月 徐州校区成立</p>

                        <p>2017年11月 米克学院教育获2017腾讯网“年度特色职业教育品牌”大奖</p>
                        <p style="text-indent: 8em">《HTML5系列图书》出版</p>
                        <p>2017年12月 米克学院荣获百度教育“2017年度新锐教育品牌”大奖</p>

                        <p>2018年01月 《明哥聊求职》荣获“2017教育行业优秀自媒体”大奖</p>
                    </div>
                    <div class="tab-pane" id="pane3">
                        <img src="img/about02.jpg" class="img-responsive">
                        <h2>米克学院十大优势</h2>
                        <p>1、中国IT培训先锋，十一年专注IT教育，多学科教学，培养的PHP程序员更是遍布全国，从米克学院毕业，走到哪家企业都会有你的学哥学姐，堪称PHP程序员黄埔军校。</p>
                        <p>2、秉承“让学习成为一种习惯”的教育理念，授之以鱼更授之以渔，不仅教授技术更培养职业素质，坚持“无兄弟 不编程，不抛弃 不放弃”的信条，亦师亦友，教书育人。</p>
                        <p>3、相比其他机构，较早在业内推出“一个月免费预科学习，不满意不缴费”政策，让学员更充分了解米克学院，了解自己是否适合做软件开发后再做决定。</p>
                        <p>4、业内较早推出零学费入学，工作后分期还学费的学习模式，推荐就业，学员就业薪水高。</p>
                        <p>5、强大的师资阵容，严苛的讲师考核上岗及教学考评体系；实用先进的课程体系，与企业实际需求结合，避免大学式闭门造车的人才培养。</p>
                        <p>6、严格、科学、负责的教务管理体系，班主任全程监管，关注每个学员的学习状态，保障教学质量。</p>
                        <p>7、就业老师全程跟班，设有专业的职场实践课和就业指导课，企业进校招聘，为学员提供多渠道的就业服务。</p>
                        <p>8、企业级项目实战训练，让学员参与真实的企业级项目研发，学员独立设计开发自己的上线项目。</p>
                        <p>9、业内不多的几家——提供24小时开放机房的培训学校。</p>
                        <p>10、出版的PHP教材《跟米克学院学PHP》，在当当网等各大电商PHP类图书中销量突出。</p>
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
