<%--
  Created by IntelliJ IDEA.
  User: junlong
  Date: 2019-11-13
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<meta charset="utf-8">
	<title>新增</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
</head>
<body>
<form class="layui-form" action="" lay-filter="test1" onsubmit="return false;">
	<div class="layui-form-item" style="margin-top: 50px">
		<label class="layui-form-label">用户名</label>
		<div class="layui-input-inline">
			<input type="text" name="name" required  lay-verify="required" placeholder="请输入用户名" autocomplete="on" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">地址</label>
		<div class="layui-input-inline">
			<input type="text" name="address" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">电话</label>
		<div class="layui-input-inline">
			<input type="text" name="tel" required  lay-verify="required|phone|number" placeholder="请输入手机号" autocomplete="on" class="layui-input">
		</div>
	</div>

</form>

<script>
	//Demo
	layui.use('form', function(){
		var form = layui.form;
	});
</script>
</body>
</html>