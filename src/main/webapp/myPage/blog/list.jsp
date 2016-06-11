<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/images/list_icon.png" />最新博客
    </div>
    
    <div class="datas">
        <ul>
             <c:forEach items="${blogList }" var="blog" >
                <li>
                    <p><span class="title"><a href="#">${blog.title }</a></span></p>
                    <p><span class="summary">${blog.summary }...</span></p> 
                    <span class="info">发表于<fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></span><br>
                </li> 
                <hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:  10px;" />
             </c:forEach>
        </ul>
    </div>
</div>
