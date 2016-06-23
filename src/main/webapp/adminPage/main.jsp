<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>博客后台系统</title>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <link href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/styles/admin/main.css" rel="stylesheet" />
    <script>
    	var url;
    	function openTab(text,url,iconCls) {
    		if($('#tabs').tabs("exists",text)) {
    			$('#tabs').tabs("select",text);
    		}else {
    			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/adminPage/"+url+"'></iframe>";
    			$('#tabs').tabs("add",{
    				title:text,
    				iconCls:iconCls,
    				closable:true,
    				content:content
    			})
    		}
    	}
    
    	function openPasswordModifyDialog() {
    		$('#dlg').dialog('open').dialog("setTitle","修改密码");
    		url="${pageContext.request.contextPath}/admin/blogger/modifyPassword.action";
    	}
    	
    	function resetValue(){
    		$("#newPassword").val("");
    		$("#newPassword2").val("");
    	}
    	
    	function modifyPassword() {
    		$('#fm').form("submit",{
    			url:url,
    			onSubmit:function() {
    				var newPassword = $('#newPassword').val();
    				var newPassword2 = $('#newPassword2').val();
    				if(!$(this).form("validate")){
    					return false;
    				}
    				if(newPassword!=newPassword2) {
    					$.messager.alert('系统提示',"确认密码输入错误!");
    					return false;
    				}
    				return true;
    			},
    			success:function(result) {
    				var result=eval('('+result+')');
    				if(result.success) {
    					$.messager.alert("系统提示","密码修改成功，下一次登录生效！");
    					resetValue();
    					$("#dlg").dialog("close");
    				}else {
    					$.messager.alert('系统提示',"密码修改失败!");
    					return;
    				}
    			}
    		});
    	}
    	
    	function refreshSystem() {
    		$.post("${pageContext.request.contextPath}/admin/system/refreshSystem.action",{},function(result){
    			if(result.success) {
    				$.messager.alert("系统提示","已成功刷新系统缓存!");
    			}else {
    				$.messager.alert("系统提示","刷新系统缓存失败！");
    			}
    		},"json");
    	}
    	
    	function logout() {
    		$.messager.confirm("系统提示","您确定要退出系统吗？",function(r){
    			if(r){
    				window.location.href='${pageContext.request.contextPath}/admin/blogger/logout.action';
    			} 
    		 });
    	}
    </script>
</head>
<body>
    <div id="box" class="easyui-layout" data-options="fit:true">
        <div class="north" data-options="region:'north'">
            <div id="logo"><img src="${pageContext.request.contextPath}/static/images/main.png" alt="博客管理系统" /></div>
            <div id="userName">当前用户:&nbsp;<span style="color:red">${currentUser.userName }</span></div>
        </div>

        <div class="west" data-options="region:'west',split:true" title="导航菜单">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="常用操作" data-options="selected:true,iconCls:'icon-item'" style="padding: 10px">
                    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px" onclick="openTab('写博客','writeBlog.jsp','icon-writeblog')">写博客</a>
                </div>
                
                <div title="博客管理" data-options="iconCls:'icon-bkgl'" style="padding: 10px">
                    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px" onclick="openTab('写博客','writeBlog.jsp','icon-writeblog')">写博客</a>
                     <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px" onclick="openTab('博客信息管理','blogManager.jsp','icon-bkgl')">博客信息管理</a>
                </div>
                
                <div title="博客类别管理" data-options="iconCls:'icon-bklb'" style="padding: 10px">
                    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px" onclick="openTab('博客类别管理','blogTypeManager.jsp','icon-bklb')">博客类别信息管理</a>
               </div>
               
                <div title="评论信息管理" data-options="iconCls:'icon-plgl'" style="padding: 10px">
                    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px" onclick="openTab('评论信息管理','commentManager.jsp','icon-plgl')">评论信息管理</a>
                </div>
                
                <div title="系统管理" data-options="iconCls:'icon-system'" style="padding: 10px">
                    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px" onclick="openPasswordModifyDialog()">修改密码</a>
                    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'" style="width: 150px" onclick="refreshSystem()">刷新系统缓存</a>
                    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px" onclick="logout()">安全退出</a>
                </div>
            </div>
        </div>
        
        <div class="center" data-options="region:'center'">
            <div class="easyui-tabs" id="tabs" data-options="fit:true,border:false">
                <div title="首页" data-options="iconCls:'icon-home'">
                     <div id="welcome" style="background-image: url('${pageContext.request.contextPath}/static/images/welcome.png');">
                        <p id="font1">Wecome</p>
                        <p id="font2">博客信息管理后台</p>
                        <p id="font3">BLOG INFORMATION MANAGEMENT SYSTEM</p>
                     </div>
                </div>
            </div> 
        </div>
        
        <div class="south" data-options="region:'south'"><p class="foot">Copyright 2016 王博的博客   V1.0</p></div>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:200px;padding: 10px 20px" data-options="
        closed:true,
        buttons:'#dlg-buttons'
    ">
        <form id="fm" method="post">
            <table cellspacing="8px">
           		<tr>
           			<td>用户名：</td>
           			<td><input type="text" id="userName" name="userName" readonly="readonly" value="${currentUser.userName }" style="width: 200px"/></td>
           		</tr>
           		<tr>
           			<td>新密码：</td>
           			<td><input type="password" id="newPassword" name="newPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
           		</tr>
           		<tr>
           			<td>确认新密码：</td>
           			<td><input type="password" id="newPassword2" name="newPassword2" class="easyui-validatebox" required="true" style="width: 200px"/></td>
           		</tr>
       	    </table>
        </form>
    </div>
    
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="modifyPassword()">保存</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="closePasswordModifyDialog()">关闭</a>
    </div>
</body>
</html>