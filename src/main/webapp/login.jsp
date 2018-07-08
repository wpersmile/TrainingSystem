<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/3/28
  Time: 15:11
  To change this template use Files | Settings | Files Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户登录-米克学院</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>

    <script>
        function checkPhone(){

            var phone=document.getElementById("inPhone").value;
            if(phone===""){
                document.getElementById("check-phone-error").innerText="用户名不能为空";
                return false;
            }
            else {

                document.getElementById("check-phone-error").innerText="";
                return true;
            }
        }
        function checkPass(){
            var pass=document.getElementById("inPass").value;
            if(pass===""){
                document.getElementById("check-pass-error").innerText="密码不能为空";
                return false;
            }
            else {
                document.getElementById("check-pass-error").innerText="";
                return true;
            }
        }

        function submitForm(){
            if(checkPhone()&&checkPass()){
                document.getElementById("myForm").submit();
            }
        }
    </script>

    <style type="text/css">
        body{
            background-image: url("img/login.jpg");
        }
        .hello{
            margin-bottom: 30px;;
        }
        .container{
            margin-top: 80px;
        }
        .row-style{
            background:#DBDBDB;
            border-radius: 18px;
        }
        .form-login{
            padding: 20px 8px 20px 8px;
        }
        .btn-style{
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-size{
            width: 100%;
        }
        .reg-url{
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="hello">
        <div class="row">
            <div class="col-sm-3 col-md-4"></div>
            <div class="col-sm-9 col-md-8 col-xs-12">
                <h1>欢迎登录米克学院</h1>
                <p style="font-size: 20px;">精彩学习每一天</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-sm-3"></div>
        <div class="col-md-4 col-sm-6 col-xs-12 row-style">
            <%--对登录信息判断--%>
            <c:if test="${sessionScope.message!=null}">
                <br/>
                <span  class="label label-warning" id="check-submit-error" style="font-size: 15px">${sessionScope.message}</span>
                ${sessionScope.message=null}
            </c:if>
            <!--用户登陆表单-->
            <form action="LoginServlet" method="post" class="form-login" id="myForm">
                <div class="form-group">
                    <label for="inPhone">手机</label>
                    <input type="text" class="form-control" id="inPhone" name="phone" placeholder="phone" onblur="checkPhone()"/>
                    <span  class="label label-warning" id="check-phone-error"></span>
                </div>

                <div class="form-group">
                    <label>密码</label>
                    <input type="password" class="form-control" id="inPass" name="password" placeholder="pass" onblur="checkPass()"/>
                    <span  class="label label-warning" id="check-pass-error"></span>
                </div>
            </form>
            <div class="reg-url">
                <a href="register.jsp">没有账号？点击注册</a>
            </div>
            <div class="btn-style">
                <button type="submit" class="btn btn-primary btn-size" onclick="submitForm()">登录</button>
            </div>
        </div>
        <div class="col-md-4 col-sm-3"></div>
    </div>
</div>

<footer class="footer navbar-fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4" style="text-align: center;">
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


