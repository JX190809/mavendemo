<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/9
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
	<title>登录页面</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>

	<script>
		//Demo
		// layui.use('form', function(){
		// 	var form = layui.form;
		//
		// 	//监听提交
		// 	form.on('submit(formDemo)', function(data){
		// 		layer.msg(JSON.stringify(data.field));
		// 		return false;
		// 	});
		// });

		function reg() {
			var path=$("#path").val();
			location.href=path+"/jsp/reg.jsp";
		}

		function login() {
			var account=$("#account").val();
			var password=$("#password").val();
			var path=$("#path").val();
			if(""!=account&&null!=account&&""!=password&&null!=password){
				$.ajax({
						url: path+"/admin/ajaxLogin",
						type: "POST",
						data: {"account":account,"password":password},
						datatype: "text",
						success: function (msg) {
							if (msg == "success") {
								alert("登录成功");
								location.href = "${pageContext.request.contextPath}/admin/path/menu";
							} else{
								alert("账号密码错误");
							}
						},
						error: function () {
							alert("网络繁忙！")
						}
					}
				);
			}else{
				alert("账号密码不能为空")
			}
		}
	</script>
	<style>
		.layui-form{
			margin-left: 550px;
			margin-top: 100px;
		}
	</style>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<%--<form action="${pageContext.request.contextPath}/admin/login" method="post" enctype="application/x-www-form-urlencoded" accept-charset="UTF-8">--%>
<div class="layui-form">
	<div class="layui-form-item">
		<label class="layui-form-label">账号框</label>
		<div class="layui-input-inline">
			<input type="text" name="account" required id="account" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">密码框</label>
		<div class="layui-input-inline">
			<input type="password" name="password" id="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
		</div>
<%--		<div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
	</div>

	<div class="layui-form-item">
		<div class="layui-input-block">
<%--			<button type="submit" class="layui-btn">立即提交</button>--%>
			<button class="layui-btn" onclick="login()">立即提交</button>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" onclick="reg()">注册</button>
		</div>
	</div>
</div>
<%--</form>--%>
<%--<div class="layui-form">--%>
<%--	<div class="layui-form-item">--%>
<%--		<div class="layui-input-block">--%>
<%--			<button class="layui-btn" onclick="reg()">注册</button>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>
</body>
</html>
