<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/images/blog_show_icon.png" />博客信息
    </div>
    
    <div class="blog_title">
        <h3><strong>${blog.title }</strong></h3>
    </div>
    
    <div class="blog_info">
        <p>发布时间: 『<fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>』 博客类别: ${blog.blogType.typeName }</p>
    </div>
    
    <div class="blog_content">
        ${blog.content }
    </div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/images/comment_icon.png" />评论信息
    </div>
</div>
