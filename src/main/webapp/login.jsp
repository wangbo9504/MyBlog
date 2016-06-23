<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>博客系统后台登录页面</title> 
    <link href="${pageContext.request.contextPath}/static/styles/login.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/login.js"></script>
</head> 

<body>
    <div class="top_div"></div>
    <form action="${pageContext.request.contextPath}/blogger/login.action"  method="post" onsubmit="return checkForm()">
    <div class="backgroud">
        <div style="width: 165px; height: 96px; position: absolute;">
        <div class="tou"></div>
        <div class="initial_left_hand" id="left_hand"></div>
        <div class="initial_right_hand" id="right_hand"></div></div>
        <p style="padding: 30px 0px 10px; position: relative;">
            <span class="u_logo"></span>
            <input class="ipt" id="userName" type="text" placeholder="请输入用户名" name="userName"> 
        </p>    
        <p style="position: relative;">
            <span class="p_logo"></span>         
            <input class="ipt" id="password" type="password" name="password" placeholder="请输入密码">   
        </p>
        <p style="color: red" id="error">${errorInfo }</p> 
        <div class="buttonbox">
            <p style="margin: 0px 35px 20px 45px;">
            <span style="float:left;">Java博客后台系统</span>
            <span style="float: right;"><input type="submit" class="login" value="登录" /></span>         
            </p>
        </div>
        <div style="padding-top: 30px">Copyright © 2016 王博的博客</div>
    </div>
    </form>
    </body>
</html>
