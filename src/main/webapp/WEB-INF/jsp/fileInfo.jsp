<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>文件搜索</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/layui/layui.js" media="all"></script>
	<%
		String path=request.getContextPath();
	%>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">

<!-- 增加搜索条件 -->
<div class="demoTable">
	<div class="layui-inline">
		<input class="layui-input" name="name" id="name" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload">搜索</button><br/>
</div>
<!-- -->

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
	<button type="button" class="layui-btn" lay-event="download">下载</button>
</script>

<script charset="UTF-8">
	layui.use('table', function(){
		var table = layui.table;
		$ = layui.jquery;
		var path=$("#path").val();
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 500
			,url: path+"/admin/findFile" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'fid', title: 'ID', width:80, sort: true, fixed: 'left'}
				,{field: 'name', title: '文件名', width:100}
				,{field: 'score', title: '下载积分', width:100}
				,{field: 'account', title: '上传用户', width:100}
				,{field: 'type', title: '文件类型', width:100}
				,{field: 'time', title: '上传时间', width:200}
				,{field: 'state', title: '审核状态', width:100}
				,{field: 'right', title: '操作', width:100, align:'center', toolbar:'#barDemo'}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/findFile" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						name: $("#name").val()
					}
				});
			}
		});
	});

	//将表单转为js对象数据
	function serializeObject($, array){
		var obj=new Object();
		$.each(array, function(index,param){
			if(!(param.name in obj)){
				obj[param.name]=param.value;
			}
		});
		return obj;
	};
</script>
</body>
</html>