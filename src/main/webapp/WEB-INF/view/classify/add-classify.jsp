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
		<a>添加分类</a>
	</blockquote>
		<form class="layui-form layui-col-md6 layui-col-md-offset3" style="margin-top: 150px">
			<div class="layui-form-item">
				<label class="layui-form-label">分类名</label>
				<div class="layui-input-block">
					<input type="text" name="classifyName" required lay-verify="required"
						placeholder="请输入标题" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">权重</label>
				<div class="layui-input-block">
					<input type="number" name="classifyWeight" required lay-verify="number"
						placeholder="请输入标题" autocomplete="off" class="layui-input">
				</div>
			</div>
			 <div class="layui-form-item">
			    <label class="layui-form-label">状态</label>
			    <div class="layui-input-block">
			      <input type="radio" name="isShow" value="展示" title="展示" checked>
			      <input type="radio" name="isShow" value="隐藏" title="隐藏">
			    </div>
			  </div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="addClassify">添加</button>
					<button type="reset" id="resetBtn" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
    </div>
  </div>
  
  <div class="layui-container" style="position: fixed;left: 0px;right: 0;bottom: 0;height: 44px;line-height: 44px;padding: 0 15px;background-color:#eee;">
    © 	健丽宝服装租赁工作室后台管理
  </div>
</div>
<script src="${PATH}/static/js/jquery2.0-min.js"></script>	
<script src="${PATH}/static/layui/layui.all.js"></script>
	
<script>
layui.use(['layer','form'], function(){
	var layer = layui.layer,
	form = layui.form;
	form.on('submit(addClassify)', function(data){
		  var datas = data.field
		  $.ajax({
			url:"${PATH}/classify/addClassify",
			data:datas,
			method:"post",
			success:function(res){
				if(res.code==100){
					layer.msg(res.extend.msg,{icon:6},function(){
						$("#resetBtn").click();
					})
				}else{
					layer.msg(res.extend.msg,{icon:5})	
				}
			},error:function(){
				layer.msg("系统错误")
			}
		  });
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
});
</script>
</body>
</html>