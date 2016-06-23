<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="row">
<div class="col-md-12" style="padding-top: 10px">
<nav class="navbar navbar-inverse">
          <div class="container">
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/myPage/info.jsp" target="_blank">关于博主</a></li>
                <li><a href="#contact">联系我</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">博客后台</a></li>
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