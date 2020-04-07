<%--
  Created by IntelliJ IDEA.
  User: junlong
  Date: 2019-11-13
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>删除</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
</head>
<body>
<form class="layui-form" action="" lay-filter="test1" onsubmit="return false;">
	<div class="layui-form-item">
		<label class="layui-form-label">单选框</label>
		<div class="layui-input-block">
			<c:if test="${not empty list}">
				<c:forEach var="test" items="${list}">
					<input type="radio" name="id" value="${test.id}" title="${test.id}">
				</c:forEach>
			</c:if>
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