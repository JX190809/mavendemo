<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/9
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<title>注册页面</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
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

		function login() {
			var account=$("#account").val();
			var password=$("#password").val();
			var path=$("#path").val();
			if(""!=account&&null!=account&&""!=password&&null!=password){
				$.ajax({
						url: path+"/LoginServlet?method=reg",
						async: true,
						type: "POST",
						data: {"account":account,"password":password},
						datatype: "text",
						success: function (msg) {
							if (msg == "success") {
								alert("注册成功");
								location.href = "${pageContext.request.contextPath}/jsp/login.jsp";
							} else{
								alert("账号已存在");
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
	<%
		String path=request.getContextPath();
	%>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form action="${pageContext.request.contextPath}/admin/reg" method="post" enctype="application/x-www-form-urlencoded" accept-charset="UTF-8">
<div class="layui-form">
	<div class="layui-form-item">
		<label class="layui-form-label">账号</label>
		<div class="layui-input-inline">
			<input type="text" name="account" required id="account" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">密码</label>
		<div class="layui-input-inline">
			<input type="password" name="password" id="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
		</div>
<%--		<div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
	</div>

	<div class="layui-form-item">
		<div class="layui-input-block">
			<button type="submit" class="layui-btn">立即提交</button>
<%--			<button class="layui-btn" onclick="login()">立即提交</button>--%>
		</div>
	</div>

</div>
</form>
</body>
</html>
