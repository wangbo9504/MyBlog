<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改博客页面</title>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <link href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css" rel="stylesheet" />
    
    <script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script>
    	function submitData() {
    		var title = $('#title').val();
    		var blogTypeId = $("#blogTypeId").combobox("getValue");
    		var content = UE.getEditor('editor').getContent();
    		
    		if(title==null || title=="") {
    			alert("请输入标题!");
    		}else if(blogTypeId==null || blogTypeId=="") {
    			alert("请选择博客类别!");
    		}else if(content==null || content=="") {
    			alert("请输入内容！");
    		}else {
    			$.post("${pageContext.request.contextPath}/admin/blog/save.action",{'id':"${param.id}",'title':title,'blogType.id':blogTypeId,'content':content,'summary':UE.getEditor('editor').getContentTxt().substr(0,155)},function(result){
        			if(result.success) {
        				alert("博客发布成功!");
        				resetValue();
        			}else {
        				alert("发布博客失败!");
        			}
        		},'json');
    		}	
    	}
    	
    	// 重置数据
    	function resetValue(){
    		$("#title").val("");
    		$("#blogTypeId").combobox("setValue","");
    		UE.getEditor('editor').setContent("");
    	}
    </script>
</head>

<body style="margin: 10px">
    <div id="p" class="easyui-panel" title="编写博客" style="padding: 10px">
        <table cellspacing="20px">
            <tr>
                <td width="80px">博客标题:</td>
                <td><input type="text" id="title" name="title" style="width: 400px;" /></td>
            </tr>
            <tr>
                <td width="80px">博客类别:</td>
                <td>
                    <select class="easyui-combobox" id="blogTypeId" name="blogType.id" style="width: 154px" data-options="editable:'false',panelHeight:'auto'">
                        <option value="">请选择博客类别...</option>
                        <c:forEach var="blogType" items="${blogTypeList }">
                            <option value="${blogType.id }">${blogType.typeName }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td valign="top">博客内容:</td>
                <td>
                    <script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布博客</a>
                </td>
            </tr>
        </table>
    </div>
    
     <script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');

	ue.addListener("ready",function(){
		UE.ajax.request("${pageContext.request.contextPath}/admin/blog/getById.action", {
			method: "post",
			async : false,  
			data:{"id":"${param.id}"},
			onsuccess:function(result){
				result = eval("(" + result.responseText + ")");  
				$('#title').val(result.title);
				$('#blogTypeId').combobox("setValue",result.blogType.id);
				UE.getEditor('editor').setContent(result.content);
			}
		});
	});
	</script>
</body>
</html>
