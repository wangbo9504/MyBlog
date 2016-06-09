<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="zh-hans">
  <head>  
    <title>博客后台系统</title>

    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        * {
            font-family:"KaiTi";
        }
    </style>
  </head>
  
  <body>
  <h1 align="center">请登陆</h1>
  <div class="container">
    <form action="${pageContext.request.contextPath}/blogger/login.action" method="post" class="form-horizontal">
    <div class="form-group">
    <label for="userName" class="col-sm-4 control-label">账号:</label>
    <div class="col-sm-4">
    <input type="text" id="userName" name="userName" class="form-control" placeholder="用户名"/><span>${errorInfo }</span>
    </div>
    </div>
    <div class="form-group">
    <label for="password" class="col-sm-4 control-label">密码:</label>
    <div class="col-sm-4">
    <input type="password" id="password" name="password" class="form-control" placeholder="密码">
    </div>
    </div>
    <a href="user_registryUI.action" type="button" class="btn btn-success col-sm-offset-5">注册</a>
    <button type="submit" class="btn btn-primary col-sm-offset-1">登录</button>
    </form>
    </div>
  
    <script src="${pageContext.request.contextPath}/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script> 
  </body>
</html>