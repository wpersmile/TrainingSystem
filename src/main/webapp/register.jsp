<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raind
  Date: 2018/3/26
  Time: 15:04
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
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="application/javascript" src="js/jquery-3.3.1.min.js" ></script>
    <script type="application/javascript" src="js/bootstrap.min.js" ></script>

    <style type="text/css">
        body{
            background: #EAEAEA;
        }
        .hello{
            margin-bottom: 20px;;
        }
        .container{
            margin-top: 60px;
        }
        .row-style{
            background:#DBDBDB;
            border-radius: 18px;
        }
        .form-login{
            padding: 20px 8px 10px 8px;
        }
        .btn-style{
            text-align: center;
            margin-bottom: 20px;
        }
        .log-url{
            text-align: right;

        }
        .btn-size{
            width: 100%;
        }
    </style>

    <script>

        function checkPhone() {

            var phone = document.getElementById('inPhone').value;
            if (phone===""){
                document.getElementById('phone-error').innerText="手机号不能为空";
                return false;
            }
            else if(!(/^1[34578]\d{9}$/.test(phone))){
                document.getElementById('phone-error').innerText="手机号有误";
                return false;
            }
            else {
                document.getElementById('phone-error').innerText="";
                return true;
            }
        }
    </script>

    <script>
        function checkMail(){
            var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
            var obj = document.getElementById("inEmail"); //要验证的对象
            if (obj===""){
                document.getElementById('email-error').innerText="邮箱格式有误，请重新输入";
                return false;
            }
           else if(!reg.test(obj.value)){ //正则验证不通过，格式不对
                document.getElementById('email-error').innerText="邮箱格式有误，请重新输入";
                return false;
            }else{
               document.getElementById('email-error').innerText="";
                return true;
            }
        }

        function pass() {
            var pass = document.getElementById('inPass').value;
            if (pass===""){
                document.getElementById('pass-error').innerText="密码不能为空，请重新输入";
            }
            else {
                document.getElementById('pass-error').innerText="";
            }
        }
        function checkPass() {

            var pass = document.getElementById('inPass').value;
            var check = document.getElementById('inCheckPass').value;
            if (pass!==""){
                if (pass===check){
                    document.getElementById('check-pass-error').innerText="";
                    return true;
                }
                else {
                    document.getElementById('check-pass-error').innerText="两次输入不一样，请重新输入";
                    return false;
                }
            }
            else {
                document.getElementById('check-pass-error').innerText="密码不能为空，请重新输入";
                return false;
            }
        }

        function checkRead() {
            if (!document.getElementById("read").checked) {
                document.getElementById('read-error').innerText="请勾选协议";
                return false;
            }
            else {
                document.getElementById('read-error').innerText="";
                return true;
            }

        }
        function submitForm() {
            if (checkPass() && checkPhone() && checkMail() && checkRead()){
                document.getElementById("myForm").submit();
            }
        }
    </script>
</head>
<body>

<div class="container">
    <div class="hello">
        <div class="row">
            <div class="col-sm-3 col-md-4"></div>
            <div class="col-sm-9 col-md-8 col-xs-12">
                <h1>欢迎注册米克培训会员</h1>
                <p style="font-size: 20px;">精彩学习每一天</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-sm-3"></div>
        <div class="col-md-4 col-sm-6 col-xs-12 row-style">
            <!--用户注册表单-->
            <form action="RegServlet" method="post" class="form-login" id="myForm">
                <div class="form-group">
                    <label for="inPhone">手机</label>
                    <input type="text" class="form-control" id="inPhone" name="phone" placeholder="phone" onblur="checkPhone()"/>
                    <span  class="label label-warning" id="phone-error"></span>
                </div>
                <div class="form-group">
                    <label>邮箱</label>
                    <input type="email" class="form-control" id="inEmail" name="email" placeholder="email" onblur="checkMail()"/>
                    <span  class="label label-warning" id="email-error"></span>
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input type="password" class="form-control" id="inPass" name="password" placeholder="pass" onblur="pass()"/>
                    <span  class="label label-warning" id="pass-error"></span>
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input type="password" class="form-control" id="inCheckPass" placeholder="pass"  onblur="checkPass()"/>
                    <span  class="label label-warning" id="check-pass-error"></span>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="read" checked="checked">
                        <a href="#">我已阅读并同意相关服务条款和隐私政策</a>
                        <span  class="label label-danger" id="read-error"></span>
                    </label>
                </div>
                <div class="log-url">
                    <a href="login.jsp">已有账户？点击登录</a>
                </div>
            </form>
            <div class="btn-style">
                <button type="submit" class="btn btn-primary btn-size" id="registerOk" onclick="submitForm()">登录</button>
            </div>
        </div>
        <div class="col-md-4 col-sm-3"></div>
    </div>
</div>

<%--逻辑判断处理--%>
<c:if test="${requestScope.type=='ok'}">
    <script>
        alert("注册成功");
        window.location.href="/login.jsp";
    </script>
</c:if>
<c:if test="${sessionScope.regMessage!=null}">
    <c:if test="${sessionScope.regMessage=='用户已经存在'}">
        <script>
            alert("注册失败,用户已存在");
        </script>
    </c:if>
</c:if>
<%--页底--%>
<footer class="footer ">
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4" style="text-align: center;">
                <span>Copyright © 2018-2018 All Rights Reserved</span>
                <br/>
                <span>版权所有：米克培训基地</span>
                <br/>
                <br/>
                <span>如遇到问题，请及时联系我们</span>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</footer>
</body>
</html>






<%--<html>
<head>
    <title>用户注册</title>
    <script>
        function checkPhone() {

            var phone = document.getElementById('inPhone').value;
            if(!(/^1[34578]\d{9}$/.test(phone))){
                alert("手机号码有误，请重新输入");
                return false;
            }
        }
    </script>

    <script>
        function checkPass() {

            var pass = document.getElementById('inPass').value;
            var check = document.getElementById('inCheck').value;
            if (pass!=""){
                if (pass==check){
                    return true;
                }
                else {
                    alert("两次输入密码不正确，请重新输入");
                    return false;
                }
            }
            else {
                alert("密码不能为空");
                return false;
            }
        }
        function submitForm() {
            if (checkPass()){
                document.getElementById("myForm").submit();
            }

        }
    </script>
</head>
<body>
<form action="RegServlet" method="post" id="myForm">
    <input type="text" name="phone" id="inPhone" placeholder="Phone Number" onblur="checkPhone()"><br>
    <input type="email" name="email" id="inEmail" placeholder="Email"><br>
    <input type="password" name="password" id="inPass" placeholder="Password"><br>
    <input type="password" name="check" id="inCheck" placeholder="Password" onblur="checkPass()"><br>
</form>
    <button type="submit" id="registerOk" onclick="submitForm()">确认注册</button>
<c:if test="${requestScope.type!=null}">
    <script>
        alert("注册成功");
        window.location.href="/login.jsp";
    </script>
</c:if>
<c:if test="${sessionScope.message!=null}">
    ${sessionScope.message}
    ${sessionScope.message=null}
</c:if>
</body>
</html>--%>
