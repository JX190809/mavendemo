<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/16
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>导航</title>
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
</head>
<body>
<ul class="layui-nav" lay-filter="">
<%--	<li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/main.jsp">用户管理</a></li>--%>
<%--	<li class="layui-nav-item layui-this"><a href="">权限管理</a></li>--%>
<%--	<li class="layui-nav-item"><a href="">帮助</a></li>--%>
<%--	<li class="layui-nav-item">--%>
<%--		<a href="javascript:;">其它</a>--%>
<%--		<dl class="layui-nav-child"> <!-- 二级菜单 -->--%>
<%--			<dd><a href="">移动模块</a></dd>--%>
<%--			<dd><a href="">后台模版</a></dd>--%>
<%--			<dd><a href="">电商平台</a></dd>--%>
<%--		</dl>--%>
<%--	</li>--%>
<%--	<li class="layui-nav-item"><a href="">社区</a></li>--%>
	<c:if test="${not empty menuList}">
		<c:forEach items="${menuList}" var="roleMenu">
			<li class="layui-nav-item"><a href="${pageContext.request.contextPath}/${roleMenu.menu.url}">${roleMenu.menu.mname}</a>
			<c:if test="${not empty roleMenu.childList}">
				<dl class="layui-nav-child">
				<c:forEach items="${roleMenu.childList}" var="childList">
					<dd><a href="${pageContext.request.contextPath}/${childList.menu.url}">${childList.menu.mname}</a></dd>
				</c:forEach>
				</dl>
			</c:if>
			</li>
		</c:forEach>
	</c:if>
</ul>

<script>
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
		var element = layui.element;

		//…
	});
</script>

</body>
</html>
