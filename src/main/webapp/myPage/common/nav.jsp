<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="row">
<div class="col-md-12" style="padding-top: 10px">
<nav class="navbar navbar-inverse">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">导航栏</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
                <li><a href="#about">关于博主</a></li>
                <li><a href="#contact">联系我</a></li>
              </ul>
                
                <form class="navbar-form navbar-right" style="padding-right:40px"> 
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="请输入要查询的关键字..."/>
                        <button class="btn btn-default" type="submit">搜索</button>
                    </div>
               </form>
              
            </div>
          </div>
</nav>
</div>
</div>