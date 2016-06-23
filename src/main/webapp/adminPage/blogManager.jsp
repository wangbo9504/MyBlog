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
        function formatBlogType(val,row) {
        	if(val!=null) {
    			return val.typeName;
        	}else {
        		return "<font color='red'>该博格无类别!出现错误!</font>";
        	}
    	}
        
        function formatTitle(val,row) {
        	return "<span id='titleLink'><a target='_blank' href='${pageContext.request.contextPath}/blog/articles/"+row.id+".html'>"+val+"</a></span>";
        }
    
    	function deleteBlog() {
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
			$.messager.confirm('系统提示',"您确定要删除	这<font color=red>"+rows.length+"</font>条数据么?",function(r) {
				if(r) {
					$.post('${pageContext.request.contextPath}/admin/blog/delete.action',{'ids':ids},function(result) {
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
    	
    	function searchBlog() {
    		$('#dg').datagrid('load',{
    			title:$('#s_title').val()
    		});
    	}
    	
    	function editBlog() {
    		var rows = $('#dg').datagrid("getSelections");
    		if(rows.length!=1) {
    			$.messager.alert("系统提示","请选择一条数据进行编辑");
    			return;
    		}
    		var row = rows[0];
    		window.parent.openTab("修改博客","modifyBlog.jsp?id="+row.id,"icon-writeblog");
    	}
    </script>
</head>
<body style="margin: 5px;">
    <table id="dg" class="easyui-datagrid" title="博客信息" data-options="
            fitColumns:true,
            fit:true,
            pagination:true,
            url:'${pageContext.request.contextPath}/admin/blog/list.action',
            toolbar:'#toolbar'
    ">
        <thead>
            <tr>
                <th field="cb" checkbox="true" align="center"></th>
                <th field="id" width="20" align="center">编号</th>
                <th field="title" width="120" align="center" formatter="formatTitle">博客标题</th>
                <th field="releaseDate" width="50" align="center">发布日期</th> 
                <th field="blogType" width="50" align="center" formatter="formatBlogType">博客类别</th> 
            </tr>
        </thead>
    </table>
    
    <div id="toolbar">
        <div>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editBlog()">修改</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBlog()">删除</a>
        </div>
        <div>&nbsp;博客标题:&nbsp;<input type="text" name="s_title" id="s_title"/>
            <a href="javascript:searchBlog()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
        </div>
    </div>
</body>
</html>
