<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function loadimage() {
		document.getElementById("randImage").src="${pageContext.request.contextPath}/image.jsp?"+Math.random();
	}
	
	function submitData() {
		var imageCode = $("#imageCode").val();
		var content = $("#content").val();
		if(content==null || content=="") {
			alert("评论不能为空!");
		} else if(imageCode==null || imageCode=="") {
			alert("请填写验证码!")
		} else {
			$.ajax({
			    type:"POST",
			    url:"${pageContext.request.contextPath}/comment/save.action",
			    data:"content="+content+"&"+"imageCode="+imageCode+"&"+"blog.Id="+${blog.id },
			    dataType:"json",
			    success:function(data) {
			    	if(data.success) { 
			    		window.location.reload();
			    	} else {
			    		alert(data.errorInfo);
			    	}
			    }
			});
		}
	}
</script>

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
    
    <div class="commentDatas">
        <c:choose>
            <c:when test="${commentList.size()==0 }">
                                                        暂无评论
            </c:when>
            <c:otherwise>
                <c:forEach items="${commentList }" var="comment" varStatus="status">
                    <div class="comment"> 
                        <span id="font1">${status.index+1 }楼&nbsp;&nbsp;&nbsp;&nbsp;${comment.userIp }:&nbsp;&nbsp;&nbsp;&nbsp;</span><span>${comment.content }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="font2">[&nbsp;<fmt:formatDate value="${comment.commentDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>]&nbsp;</span>
                    </div> 
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/images/publish_comment_icon.png" />发表评论
    </div>
    
    <div class="publish_comment">
        <textarea style="width: 100%" rows="3" id="content" name="content" placeholder="来说两句吧..."></textarea>
        <div class="verCode">
                            验证码:&nbsp;<input type="text" id="imageCode" name="imageCode" size="12"/>&nbsp;<img onclick="javascript:loadimage();" title="换一张试试" src="${pageContext.request.contextPath}/image.jsp" id="randImage" width="60" height="21"/>
        </div>
        <div class="publishButton">
            <button class="btn btn-primary" type="button" onclick="submitData()">发表评论</button>
        </div>
   </div>
</div>
