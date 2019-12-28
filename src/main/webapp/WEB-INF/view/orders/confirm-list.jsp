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
<style>
input[type=number] {  
    -moz-appearance:textfield;  
}  
input[type=number]::-webkit-inner-spin-button,  
input[type=number]::-webkit-outer-spin-button {  
    -webkit-appearance: none;  
    margin: 0;  
}  
</style>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <%@ include file="/WEB-INF/view/common/header.jsp"%>
  <%-- <%@ include file="/WEB-INF/view/common/left-nav.jsp"%>  --%>
  <div class="layui-container" style="overflow-y: auto;position: fixed;top: 60px;bottom: 44px;left: 12%">
    <div style="padding: 15px;">
    	<blockquote class="layui-elem-quote">
		<a href="${PATH}/admin/index">主页</a> /
		<a>确认收货的订单</a>
	</blockquote>
		<form class="layui-form" id="kwCustForm">
		<div class="layui-col-md3">
				<div class="layui-form-item">
					<label class="layui-form-label">订单号</label>
					<div class="layui-input-block">
						<input type="text" name="orderNum"  placeholder="请输入" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">支付方式</label>
					<div class="layui-input-block">
						<select name="payway">
					        <option value="0">请选择</option>
					        <option value="到付">货到付款</option>
					        <option value="微信">微信支付</option>
					        <option value="支付宝">支付宝</option>
					        <option value="银联">银联卡支付</option>
					      </select>
					</div>
				</div>
			</div>
		<div class="layui-col-md3">
				<div class="layui-form-item">
					<label class="layui-form-label">关键字</label>
					<div class="layui-input-block">
						<input type="text" name="keyword"  placeholder="请输入" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			
			<div class="layui-col-md6">
				<div class="layui-form-item">
					<label class="layui-form-label range-label">日期</label>
					<div class="layui-input-inline">
						<input type="text" id="start_date" placeholder="请选择" name="start_date"
							autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid">-</div>
					<div class="layui-input-inline">
						<input type="text" id="end_date" placeholder="请选择" name="end_date"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" type="button" id="kwFormBtn">筛选</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form><br>
		<div class="row">
			<div class="layui-col-md12">
				<div class="card">
					<div class="card-header">
						<h2>确认收货的订单列表</h2><br>
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
<!-- 模态框 -->
	<!--查看服装信息  -->
	<div style="display: none;" id="lookCloInfoModel">
	<div  style="margin: 20px 20px">
		<div class="panel panel-default">
			  <div class="panel-body" id="cloInfoDiv">
			    
			  </div>
			</div>
	</div>
</div>
	
<script src="${PATH}/static/js/jquery2.0-min.js"></script>	
<script src="${PATH}/static/layui/layui.all.js"></script>
<script src="${PATH}/static/vue/vue.min.js"></script>
<script src="${PATH}/static/vue/vue-resource.min.js"></script>
<script>
$(function() {
	renderTb();
});
function renderTb() {
	var data = $("#kwCustForm").serializeArray();
	layui.use(['table','util','form'], function() {
		var table = layui.table
		,util = layui.util;
		//第一个实例
		table.render({
			elem : '#dataListTb',
			height :400,
			url : '${PATH}/order/getConfirmList',
			text : {
				none : '未找到数据'
			},
			title:"确认收货订单表格",
			size : 'sm ',
			contentType: "application/json",//必须指定，否则会报415错误
		    dataType : 'json',
			method:"POST",
			id:"dataListTbId",
			toolbar : "#toolbarDemo",
			defaultToolbar : [ 'filter','exports' ],
			page : true //开启分页
			,
			where : {
				kwdata : data
			},
			cols : [ [ //表头
			{
				field : 'orderId',
				title : '#',
				rowspan : 2,
				type:"checkbox",
				align : "center"
			}, {
				field : 'orderNum',
				title : '订单号',
				minWidth:128,
				rowspan : 2,
				align : "center"
			},{
				field : 'orderState',
				title : '状态',
				minWidth:128,
				style:"color:orange",
				rowspan : 2,
				align : "center"
			},{
				title : '收货人',
				colspan : 3,
				minWidth:78,
				align : "center"
			}, {
				field : 'payWay',
				title : '支付方式',
				rowspan : 2,
				minWidth:78,
				align : "center"
			},{
				field : 'expressCom',
				title : '物流公司',
				rowspan : 2,
				minWidth:78,
				align : "center"
			},{
				field : 'expressNum',
				title : '物流单号',
				rowspan : 2,
				minWidth:128,
				align : "center"
			},{
				field : 'totalPrice',
				title : '合计（元）',
				rowspan : 2,
				minWidth:120,
				sort:true,
				align : "center"
			},{
				field : 'createTime',
				title : '创建时间',
				sort:true,
				minWidth:171,
				rowspan : 2,
				align : "center"
				,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
			},{
				fixed : 'right',
				width : 150,
				rowspan : 2,
				title : '操作',
				align : 'center',
				toolbar : '#barDemo'
				} ], [ {
					field : 'consignee',
					title : '姓名',
					minWidth:78,
					align : "center"
				}, {
					field : 'address',
					title : '地址',
					minWidth:128,
					align : "center"
				}, {
					field : 'phone',
					title : '电话',
					minWidth:128,
					align : "center"
				} ] ],
				parseData : function(res) { //res 即为原始返回的数据
					console.log(res)
					return {
						"code" : res.status, //解析接口状态
						"msg" : res.message, //解析提示文本
						"count" : res.total, //解析数据长度
						"data" : res.data
					//解析数据列表
					};
				}
			})
			table.on('tool(dataTbFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			  	var data = obj.data; //获得当前行数据
			  	var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			  	if(layEvent === 'detail'){
			  		$.ajax({
						url:"${PATH}/order/getByOrderNum/"+data.orderNum,
						method:"get",
						success:function(res){
							$("#cloInfoDiv").html(res.cloName)
						}
					});
			  		layui.layer.open({
						title : '查看服装信息',
						fix : true,
						resize : false,
						move : false,
						area : [ '600px', '230px' ],
						shadeClose : false,
						type : 1,
						anim: 5,
						content : $('#lookCloInfoModel'),
						cancel : function(index, layero) {
							$('#lookCloInfoModel').css("display", "none")
						}
					 })
			  	  }else if(layEvent === 'LAYTABLE_TIPS'){
			  	    layer.alert('Hi，头部工具栏扩展的右侧图标。');
			  	  }
			});
		
		});
	}
	//批量删除
	$("#delByIds").click(function() {
		layui.use([ 'table', 'layer' ], function() {
			var table = layui.table, layer = layui.layer;
			layer.confirm('真的删除行么', function(index) {
				var checkStatus = table.checkStatus('dataListTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function() {
					ids.push($(this)[0].orderId);
				})

				if (ids.length == 0) {
					layer.msg("请选择数据！");
					return false;
				}
				$.ajax({
					url : "${PATH}/order/delOrderByIds",
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
								renderTb();
							});
						} else {
							layer.msg(res.extend.msg, {
								icon : 5
							}, function() {
								renderTb();
							});
						}
					},
					error : function() {
						layer.msg("系统错误！", {
							icon : 5
						}, function() {
							renderTb();
						});
					}
				});
				layer.close(index);
			});
		});
	})
	
	layui.use('laydate', function() {
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem : '#start_date' //指定元素,
			,
			eventElem : '#start_date',
			trigger : 'click'
		});
		laydate.render({
			elem : '#end_date' //指定元素,
			,
			eventElem : '#end_date',
			trigger : 'click'
		});
	});
	//筛选
	$("#kwFormBtn").click(function() {
		renderTb();
	});
	
</script>

<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
  </div>
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
</script>
</body>
</html>