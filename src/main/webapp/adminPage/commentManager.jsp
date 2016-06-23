<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>博客信息管理</title>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <link href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/styles/admin/blogManager.css" rel="stylesheet" /> 
    <script>
        function formatBlogTitle(val,row){
    		if(val==null){
    			return "<font color='red'>该博客已被删除！</font>";
    		}else{
    			return "<a target='_blank' href='${pageContext.request.contextPath}/blog/articles/"+val.id+".html'>"+val.title+"</a>";			
    		}
    	}
    
    	function deleteComment() {
    		var rows = $('#dg').datagrid('getSelections');
    		if(rows.length==0) {
    			$.messager.alert("系统提示","请选择要删除的数据!");
    			return;
    		}
    		var rowsIds = [];
    		for(var i=0;i<rows.length;i++) {
    			rowsIds.push(rows[i].id);
    		}
    		var ids = rowsIds.join(",");
			$.messager.confirm('系统提示',"您确定要删除	这<font color=red>"+rows.length+"</font>条类别么?",function(r) {
				if(r) {
					$.post('${pageContext.request.contextPath}/admin/comment/delete.action',{'ids':ids},function(result) {
						if(result.success) {
							$.messager.alert('系统提示',"数据已成功删除!");
							$('#dg').datagrid("reload");
						}else {
							$.messager.alert('系统提示',"数据删除失败!");
						}
					},'json');
				}
			});
    	}
    </script>
</head>
<body style="margin: 5px;">
    <table id="dg" class="easyui-datagrid" title="博客类别信息" data-options="
            fitColumns:true,
            pagination:true,
            rownumbers:'true',
            url:'${pageContext.request.contextPath}/admin/comment/list.action',
            fit:'true',
            toolbar:'#toolbar'
    ">
        <thead>
            <tr>
                <th field="cb" checkbox="true" align="center"></th>
                <th field="id" width="20" align="center">编号</th>
                <th field="blog" width="200" align="center" formatter="formatBlogTitle">博客标题</th>
                <th field="userIp" width="100" align="center">用户Ip</th>
                <th field="content" width="100" align="center">评论内容</th>
                <th field="commentDate" width="100" align="center">评论日期</th>
            </tr>
        </thead>
    </table>
    
    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteComment()">删除</a>
    </div>
    
</body>
</html>
