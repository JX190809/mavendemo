<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>模块快速使用</title>
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
		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload">搜索</button><br/>
	<button data-method="dialog" class="layuibtn">新增数据</button>
	&nbsp;&nbsp;&nbsp;&nbsp;<button data-method="dialog2" class="layuibtn">修改数据</button>
	&nbsp;&nbsp;&nbsp;&nbsp;<button data-method="dialog3" class="layuibtn">删除数据</button>
</div>
<!-- -->

<table id="demo" lay-filter="test"></table>


<script charset="UTF-8">
	layui.use('table', function(){
		var table = layui.table;
		$ = layui.jquery;
		var path=$("#path").val();
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 500
			,url: path+"/admin/info" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
				,{field: 'name', title: '用户名', width:80}
				,{field: 'money', title: '余额', width:80}
				,{field: 'address', title: '地址', width:80}
				,{field: 'tel', title: '电话', width:150}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/info" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						key: $("#demoReload").val()
					}
				});
			}
		});
	});

	layui.use(['layer','form'], function(){
		var layer = layui.layer, $ = layui.jquery;
		var path=$("#path").val();
		$('.layuibtn').on('click', function(){

			var othis = $(this), //othis当前button对象
			method = othis.data('method');//data-method="dialog"中的值

			if(method == "dialog"){
				layer.open({
					type: 2,
					area: ['450px', '350px'],
					btn: ['添加', '取消'],
					btn1: function(index, layero){
						//layer.getChildFrame("form", index)获取iframe的表单
						//serializeArray jquery方法，将表单对象序列化为数组
						var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
						$.ajax({
							url: path+"/LoginServlet?method=add",
							type:'post',
							data: formData,
							success:function(data){
								layer.close(index);
								window.location.reload();
							},error:function (err) {
								console.log(err);
							}
						});
					},
					content: path+"/jsp/add.jsp" //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					,success: function(layero, index){
						console.log(layero, index);
					}
				});
			}else if(method == "dialog2"){
				layer.open({
					type: 2,
					area: ['500px', '450px'],
					btn: ['修改', '取消'],
					btn1: function(index, layero){
						//layer.getChildFrame("form", index)获取iframe的表单
						//serializeArray jquery方法，将表单对象序列化为数组
						var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
						$.ajax({
							url: path+"/LoginServlet?method=update",
							type:'post',
							data: formData,
							success:function(data){
								layer.close(index);
								window.location.reload();
							},error:function (err) {
								console.log(err);
							}
						});
					},
					content: path+"/jsp/update.jsp" //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					,success: function(layero, index){
						console.log(layero, index);
					}
				});
			}else if(method == "dialog3"){
				layer.open({
					type: 2,
					area: ['500px', '450px'],
					btn: ['删除', '取消'],
					btn1: function(index, layero){
						//layer.getChildFrame("form", index)获取iframe的表单
						//serializeArray jquery方法，将表单对象序列化为数组
						var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
						$.ajax({
							url: path+"/LoginServlet?method=delete",
							type:'post',
							data: formData,
							success:function(data){
								layer.close(index);
								window.location.reload();
							},error:function (err) {
								console.log(err);
							}
						});
					},
					content: path+"/jsp/delete.jsp" //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					,success: function(layero, index){
						console.log(layero, index);
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