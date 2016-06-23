<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">
    <title>${pageTitle }</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/styles/list.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/styles/view.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/styles/comment.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/styles/nav.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/favicon.ico" rel="SHORTCUT ICON">
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="container">
        <jsp:include page="/myPage/common/head.jsp" />
        
        <jsp:include page="/myPage/common/nav.jsp" />
    
    <div class="row">
        <div class="col-md-9">
            <jsp:include page="${mainPage }"></jsp:include>
        </div>
        
        <div class="col-md-3">
            <div class="data_list">
                <div class="data_list_title">
                    <img src="${pageContext.request.contextPath}/static/images/user_icon.png" />&nbsp;&nbsp;博主信息
                </div>
                
                <div class="user_image">
                    <img alt="博主" src="${pageContext.request.contextPath}/static/images/blogger.jpg" />
                </div>
            </div>
            
            <div class="data_list">
                 <div class="data_list_title">
                    <img src="${pageContext.request.contextPath}/static/images/byType_icon.png" />&nbsp;&nbsp;按日志类别
                 </div>
                 
                 <div class="datas">
                    <ul>
                        <c:forEach items="${blogTypeList }" var="blogType">
                            <li><a href="${pageContext.request.contextPath}/index.html?typeId=${blogType.id }">${blogType.typeName }(${blogType.blogCount })</a></li>
                        </c:forEach>
                    </ul>
                 </div>
            </div>
            
            <div class="data_list">
                <div class="data_list_title">
                    <img src="${pageContext.request.contextPath}/static/images/byDate_icon.png" />&nbsp;&nbsp;按日志日期
                 </div>
                 
                 <div class="datas">
                    <ul>
                        <c:forEach items="${blogDateList }" var="blogDate">
                            <li><a href="${pageContext.request.contextPath}/index.html?releaseDateStr=${blogDate.releaseDateStr }">${blogDate.releaseDateStr }(${blogDate.blogCount })</a></li>
                        </c:forEach>
                    </ul>
                 </div>
            </div>
        </div>
    
    
    </div>

    <jsp:include page="/myPage/common/foot.jsp"></jsp:include>
    </div>
  </body>
</html>
