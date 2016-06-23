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
    <script>
    	var url;
    	function deleteBlogType() {
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
					$.post('${pageContext.request.contextPath}/admin/blogType/delete.action',{'ids':ids},function(result) {
						if(result.success) {
							$.messager.alert('系统提示',"您已成功删除<font color=red>"+result.delNumber+"</font>条类别信息!");
							$('#dg').datagrid("reload");
						}else {
							$.messager.alert('系统提示',"<font color=red>"+rows[result.errorIndex].typeName+"</font>"+result.errorMsg);
						}
					},'json');
				}
			});
    	}
    	
    	function addBlogType() {
    		$('#dlg').dialog("open").dialog("setTitle","添加博客类别");
    		url="${pageContext.request.contextPath}/admin/blogType/save.action";
    	}
    	
    	function editBlogType() {
    		var rows = $('#dg').datagrid("getSelections");
    		if(rows.length!=1) {
    			$.messager.alert('系统提示',"请选择一条要编辑的数据");
    			return;
    		}
    		var row = rows[0];
    		$('#dlg').dialog("open").dialog("setTitle","修改博客类别");
    		$('#fm').form('load',row);
    		url= "${pageContext.request.contextPath}/admin/blogType/save.action?id="+row.id;
    	}
    	
    	function saveBlogType() {
    		$('#fm').form('submit',{
    			url:url,
    			onSubmit:function(){
    				return $(this).form('validate');
    			},
    			success:function(result) {
    				var result = eval('('+result+')');
    				if(result.errorMsg) {
    					$.messager.alert('系统提示',result.errorMsg);
    					return;
    				}else {
    					$.messager.alert('系统提示','保存成功!');
    					$('#typeName').val("");
    					$('#dlg').dialog('close');
    					$('#dg').datagrid('reload');
    				}
    			}
    		});
    	}
    	
    	function closeBlogTypeDialog() {
    		$('#dlg').dialog('close');
    		$('#typeName').val("")
    	}
    </script>
</head>
<body style="margin: 5px;">
    <table id="dg" class="easyui-datagrid" title="博客类别信息" data-options="
            fitColumns:true,
            pagination:true,
            rownumbers:'true',
            url:'${pageContext.request.contextPath}/admin/blogType/list.action',
            fit:'true',
            toolbar:'#toolbar'
    ">
        <thead>
            <tr>
                <th field="cb" checkbox="true" align="center"></th>
                <th field="id" width="20" align="center">编号</th>
                <th field="typeName" width="100" align="center">博客类别名称</th>
            </tr>
        </thead>
    </table>
    
    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBlogType()">添加</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editBlogType()">修改</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBlogType()">删除</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:350px;height:150px;padding: 10px 20px" data-options=
        "closed:true,
        buttons:'#dlg-buttons'
    ">
        <form id="fm" method="post">
            <table cellspacing="8px">
           		<tr>
           			<td>博客类别名称：</td>
           			<td><input type="text" id="typeName" name="typeName" class="easyui-validatebox" required="true"/></td>
           		</tr>
   	        </table>
        </form>
    </div>
    
    <div id="dlg-buttons">
     	<a href="javascript:saveBlogType()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
     	<a href="javascript:closeBlogTypeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
    </div>
</body>
</html>
