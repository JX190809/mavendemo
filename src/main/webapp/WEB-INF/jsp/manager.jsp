<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/17
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>权限管理</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/layui/layui.js" media="all"></script>
	<%
		String path=request.getContextPath();
	%>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="rid">
<div class="layui-form-item">
	<div class="layui-input-block">
		<button class="layui-btn" onclick="f(1)">管理员</button>
	</div>
</div>

<div class="layui-form-item">
	<div class="layui-input-block">
		<button class="layui-btn" onclick="f(2)">用户</button>
	</div>
</div>

<div id="test1"></div>

<div class="layui-form-item">
	<div class="layui-input-block">
		<button class="layui-btn" id="btn" onclick="confirm()" style="display: none;">确定</button>
	</div>
</div>
<script>
	function f(rid){
		var path=$("#path").val();
		$("#btn").show();
		$("#rid").val(rid);
		$.ajax({
				url: path+"/admin/manager",
				async: true,
				type: "POST",
				data: {"rid":rid},
				datatype: "text",
				success: function (str) {
					var obj=[];
					for(var i=0;i<str["has"].length;i++){
						obj.push(str["has"][i].id)
					}
					console.log(obj)
					s(str["all"],obj);
				},
				error: function () {
					alert("网络繁忙！")
				}
			}
		);

	}


	function s(all,obj){
		layui.use(['tree','util'],function(){
			var tree = layui.tree;
			//渲染
				tree.render({
					elem: '#test1'  //绑定元素
					,data: all
					,showCheckbox: true
					,id:'id'
				});
			tree.setChecked('id',obj);
		});
	}
	
	function confirm() {
		var path=$("#path").val();
		var rid=$("#rid").val();
		var tree = layui.tree;

		var checkData=[];
		checkData = tree.getChecked('id')
		console.log(checkData);

		$.ajax({
				url: path+"/admin/updateManager",
				async: true,
				type: "POST",
				data: {"rid":rid,"checkData":JSON.stringify(checkData)},
				datatype: "text",
				success: function (str) {
					alert("分配成功");
					f(rid);
				},
				error: function () {
					alert("网络繁忙！")
				}
			}
		);
	}

</script>

</body>
</html>
