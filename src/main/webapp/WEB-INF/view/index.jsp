<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>健丽宝后台</title>
  <link rel="stylesheet" href="${PATH}/static/layui/css/layui.css">
  <!--[if lt IE 9]>
  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <%@ include file="/WEB-INF/view/common/header.jsp"%>
  <%-- <%@ include file="/WEB-INF/view/common/left-nav.jsp"%>  --%>
  <div class="layui-container" style="overflow-y: auto;position: fixed;top: 60px;bottom: 44px;left: 12%">
    <div style="padding: 15px;">
    	<div class="row">
			<div class="layui-col-md12">
				<div class="card">
					<div class="card-header">
						<h2>留言</h2><br>
						<button class="layui-btn layui-btn-danger" type="button" id="delByIds"><i class="layui-icon layui-icon-delete"></i>删除选中</button>
					</div>
					<div class="card-body">
						<table id="dataListTb" lay-filter="dataTbFilter" class="table table-responsive table-hover">

						</table>
					</div>
				</div>
			</div>
		</div>
    </div>
  </div>
  
  <div class="layui-container" style="position: fixed;left: 0px;right: 0;bottom: 0;height: 44px;line-height: 44px;padding: 0 15px;background-color:#eee;">
    © 	健丽宝服装租赁工作室后台管理
  </div>
</div>
<script src="${PATH}/static/js/jquery2.0-min.js"></script>
<script src="${PATH}/static/layui/layui.all.js"></script>	

<script>
layui.use('table', function(){
  var table = layui.table;
  table.render({
    elem: '#dataListTb'
    ,height: 400
    ,url: '${PATH}/contact/getAllContact' //数据接口
    ,page: true //开启分页
    ,id:"dataListTbId"
    ,cols: [[ //表头
      {field : 'contactId',
		title : '#',
		type:"checkbox",
		align : "center"}
      ,{field: 'contactName', title: '称呼'}
      ,{field: 'contactEmail', title: '邮箱'}
      ,{field: 'contactPhone', title: '联系方式'} 
      ,{field: 'contactSort', title: '类型'}
      ,{field: 'contactMessage', title: '内容'}
      ,{field : 'createTime',
			title : '创建时间',
			sort:true,
			align : "center"
			,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
    ]]
    ,parseData : function(res) { //res 即为原始返回的数据
		console.log(res)
		return {
			"code" : res.status, //解析接口状态
			"msg" : res.message, //解析提示文本
			"count" : res.total, //解析数据长度
			"data" : res.data
		//解析数据列表
		};
	}
  });
});
//批量删除
$("#delByIds").click(function() {
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table, layer = layui.layer;
		layer.confirm('真的删除行么', function(index) {
			var checkStatus = table.checkStatus('dataListTbId');
			var datas = checkStatus.data
			var ids = new Array();
			$(datas).each(function() {
				ids.push($(this)[0].contactId);
			})

			if (ids.length == 0) {
				layer.msg("请选择数据！");
				return false;
			}
			$.ajax({
				url : "${PATH}/contact/delContactsByIds",
				method : "POST",
				contentType : "application/json",//必须指定，否则会报415错误
				dataType : 'json',
				data : JSON.stringify(ids),
				success : function(res) {
					console.log(res)
					if (res.code == 100) {
						layer.msg(res.extend.msg, {
							icon : 6
						}, function() {
							table.reload('dataListTbId', {
								  url: '${PATH}/contact/getAllContact'
								});
						});
					} else {
						layer.msg(res.extend.msg, {
							icon : 5
						}, function() {
							table.reload('dataListTbId', {
								  url: '${PATH}/contact/getAllContact'
								});
						});
					}
				},
				error : function() {
					layer.msg("系统错误！", {
						icon : 5
					}, function() {
						table.reload('dataListTbId', {
							  url: '${PATH}/contact/getAllContact'
							});
					});
				}
			});
			layer.close(index);
		});
	});
})
</script>
</body>
</html>