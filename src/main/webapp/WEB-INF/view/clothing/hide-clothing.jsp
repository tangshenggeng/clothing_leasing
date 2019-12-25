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
  <div class="layui-container">
    <div style="padding: 15px;">
    	<blockquote class="layui-elem-quote">
		<a href="${PATH}/admin/index">主页</a> /
		<a>展示的服装</a>
	</blockquote>
		<form class="layui-form" id="kwCustForm">
		<div class="layui-col-md3">
				<div class="layui-form-item">
					<label class="layui-form-label">关键字</label>
					<div class="layui-input-block">
						<input type="text" name="classifyName"  placeholder="请输入" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-form-item">
					<label class="layui-form-label">分类</label>
					<div class="layui-input-block">
						<select name="clothingClassifyId" lay-verify="required" id="seleClassifyId">
						  <option value="0">请选择</option>
						  <option v-for="item in classifys" :value="item.classifyId" v-text="item.classifyName"></option>
						</select> 
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
						<h2>展示的服装列表</h2><br>
						<button class="layui-btn layui-btn-danger" type="button" id="delByIds"><i class="layui-icon layui-icon-delete"></i>删除选中</button>
						<button class="layui-btn " type="button" id="exceptionCustBtn"><i class="layui-icon layui-icon-upload-drag"></i>展示选中</button>
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
<div style="display: none;" id="editModal">
		<form class="layui-form layui-col-md10 layui-col-md-offset1" style="margin-top: 50px">
		<input type="hidden" id="clothingId_edit" name="clothingId" >
			<div class="layui-form-item">
				<label class="layui-form-label">分类名</label>
				<div class="layui-input-block">
					<input type="text" name="clothingName" id="clothingName_edit" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">价格</label>
				<div class="layui-input-block">
					<input type="number" name="clothingPrice" id="clothingPrice_edit" required lay-verify="number"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">库存</label>
				<div class="layui-input-block">
					<input type="number" name="clothingStock" id="clothingStock_edit" required lay-verify="number"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
					<label class="layui-form-label">描述</label>
					<div class="layui-input-block">
					<textarea name="clothingDescribe" id="clothingDescribe_edit" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
					</div>
				</div>
			  <div class="layui-form-item">
			<label class="layui-form-label">上传图片</label>
				<div class="layui-input-block">
					<div class="layui-upload">
					  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
					  <div class="layui-upload-list">
					    <table class="layui-table">
					      <thead>
					        <tr><th>文件名</th>
					        <th>大小</th>
					        <th>预览</th>
					        <th>状态</th>
					        <th>操作</th>
					      </tr></thead>
					      <tbody id="demoList"></tbody>
					    </table>
					  </div>
					  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
					</div> 
				</div>
			</div>
			<div class="layui-form-item">
				    <label class="layui-form-label">分类</label>
				    <div class="layui-input-block">
				    	<select name="clothingClassifyId" lay-verify="required" id="seleClassifyId_edit">
						  <option v-for="item in classifys" :value="item.classifyId" v-text="item.classifyName"></option>
						</select> 
				    </div>
				  </div>
			<div class="layui-form-item">
			    <label class="layui-form-label">状态</label>
			    <div class="layui-input-block">
			      <input type="radio" name="clothingState" value="展示" title="展示">
			      <input type="radio" name="clothingState" value="隐藏" title="隐藏" checked="checked">
			    </div>
			  </div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="editClassify">修改</button>
					<button type="reset" id="resetBtn" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	
</div>
<div style="display: none;" id="detailModal" align="center">

	<blockquote class="layui-elem-quote layui-quote-nm">
		<div>
			所属分类：<span id="detailClassifyNmae"></span><br>
			描述：<span id="detailDescribe"></span>
		</div>
		<div class="layui-carousel" id="test1" lay-filter="test1">
		  <div carousel-item=""  style="height: 380px">
		    <div><img id="detailImgOne" style="width: 300px;height: 380px"></div>
		    <div><img id="detailImgTwo" style="width: 300px;height: 380px"></div>
		    <div><img id="detailImgThree" style="width: 300px;height: 380px"></div>
		  </div>
		</div> 
	</blockquote>	
	
</div>
<script src="${PATH}/static/js/jquery2.0-min.js"></script>	
<script src="${PATH}/static/layui/layui.all.js"></script>
<script src="${PATH}/static/vue/vue.min.js"></script>
<script src="${PATH}/static/vue/vue-resource.min.js"></script>

<script>
	var seleClassifyId = new Vue({
		el:"#seleClassifyId",
		data:{
			classifys:[],
		},created: function () {
			//展示品牌
			this.$http.get("${PATH}/classify/getAllClassify").then(function(response){
				//成功
				this.classifys=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},updated:function(){
			layui.form.render('select'); 
		}
	})
	var seleClassifyId_edit = new Vue({
		el:"#seleClassifyId_edit",
		data:{
			classifys:[],
		},created: function () {
			//展示品牌
			this.$http.get("${PATH}/classify/getAllClassify").then(function(response){
				//成功
				this.classifys=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},updated:function(){
			layui.form.render('select'); 
		}
	})
</script>	
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
			url : '${PATH}/clothing/getHideClothingList',
			text : {
				none : '未找到数据'
			},
			size : 'sm ',
			contentType: "application/json",//必须指定，否则会报415错误
		    dataType : 'json',
			method:"POST",
			id:"dataListTbId",
			page : true //开启分页
			,
			where : {
				kwdata : data
			},
			cols : [ [ //表头
			{
				field : 'clothingId',
				title : '#',
				type:"checkbox",
				align : "center"
			}, {
				field : 'clothingIdent',
				title : '服装序号',
				align : "center"
			},{
				field : 'clothingName',
				title : '服装名称',
				align : "center"
			}, {
				field : 'clothingPrice',
				title : '价格',
				sort:true,
				align : "center"
			},{
				field : 'clothingStock',
				title : '库存',
				sort:true,
				align : "center"
			},{
				field : 'createTime',
				title : '创建时间',
				sort:true,
				align : "center"
				,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
			},{
				fixed : 'right',
				width : 150,
				title : '操作',
				align : 'center',
				toolbar : '#barDemo'
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
			  	if(layEvent === 'edit'){ //编辑
			  		$("#clothingId_edit").val(data.clothingId)
			  		$("#clothingName_edit").val(data.clothingName)
			  		$("#clothingPrice_edit").val(data.clothingPrice)
			  		$("#clothingStock_edit").val(data.clothingStock)
			  		$("#clothingDescribe_edit").val(data.clothingDescribe)
			  		$("#seleClassifyId_edit option").each(function(){
							var val = $(this).val()
							if(val == data.clothingClassifyId){
								$(this).attr("selected","selected")
							}
						});
			  		layui.form.render('select');
					var index = layer.open({
						title : '修改',
						fix : true,
						resize : false,
						move : false,
						area : [ '1000px', '600px' ],
						shadeClose : false,
						type : 1,
						content : $('#editModal'),
						cancel : function(index, layero) {
							$('#editModal').css("display", "none")
						}
					});
			  	  } else if(layEvent === 'detail'){
			  		  $("#detailImgOne").attr("src",data.clothingImgOne)
			  		  $("#detailImgTwo").attr("src",data.clothingImgTwo)
			  		  $("#detailImgThree").attr("src",data.clothingImgThree)
			  		  $("#detailDescribe").text(data.clothingDescribe)
			  		  $.ajax({
			  			  url:"${PATH}/classify/getById/"+data.clothingClassifyId,
			  			  method:"get",
			  			  success:function(res){
			  		  		$("#detailClassifyNmae").text(res.classifyName)
			  			  }
			  		  });
			  		var index = layer.open({
						title : '查看信息',
						fix : true,
						resize : false,
						move : false,
						area : [ '1000px', '500px' ],
						shadeClose : false,
						type : 1,
						content : $('#detailModal'),
						cancel : function(index, layero) {
							$('#detailModal').css("display", "none")
						}
					});
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
					ids.push($(this)[0].clothingId);
				})

				if (ids.length == 0) {
					layer.msg("请选择数据！");
					return false;
				}
				$.ajax({
					url : "${PATH}/clothing/delClothingByIds",
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
	//批量隐藏
	$("#exceptionCustBtn").click(function() {
		layui.use([ 'table', 'layer' ], function() {
			var table = layui.table, layer = layui.layer;
			layer.confirm('确认展示服装吗？', function(index) {
				var checkStatus = table.checkStatus('dataListTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function() {
					ids.push($(this)[0].clothingId);
				})
				if (ids.length == 0) {
					layer.msg("请选择数据！");
					return false;
				}
				$.ajax({
					url : "${PATH}/clothing/showClothingByIds",
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
	layui.use(['layer','form'], function(){
		var layer = layui.layer,
		form = layui.form;
		form.on('submit(editClassify)', function(data){
			  var datas = data.field
			  $.ajax({
				url:"${PATH}/classify/editClassify",
				data:datas,
				method:"post",
				success:function(res){
					if(res.code==100){
						layer.msg(res.extend.msg,{icon:6},function(){
							layer.closeAll()
							renderTb();
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
	layui.use(['carousel', 'form'], function(){
		  var carousel = layui.carousel
		  ,form = layui.form;
		  //常规轮播
		  carousel.render({
		    elem: '#test1'
		    ,arrow: 'always'
		  });
	});
	
</script>
<script>
var arrayObj = new Array();
layui.use(['upload','layer'], function(){
	  var $ = layui.jquery,
	  layer = layui.layer
	  ,upload = layui.upload;
	//多文件列表示例
	  var demoListView = $('#demoList')
	  ,uploadListIns = upload.render({
	    elem: '#testList'
	    ,url: '${PATH}/clothing/uploadClothingImg'
	    ,accept: 'file'
	    ,multiple: true
	    ,auto: false
	    ,bindAction: '#testListAction'
	    ,number:3
	    ,choose: function(obj){   
	      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
	      //读取本地文件
	      obj.preview(function(index, file, result){
	        var tr = $(['<tr id="upload-'+ index +'">'
	          ,'<td>'+ file.name +'</td>'
	          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
	          ,'<td>'+ '<img style="width: 100px;height: 100px" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'+'</td>'
	          ,'<td>等待上传</td>'
	          ,'<td>'
	            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
	            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
	          ,'</td>'
	        ,'</tr>'].join(''));
	        //单个重传
	        tr.find('.demo-reload').on('click', function(){
	          obj.upload(index, file);
	        });
	        //删除
	        tr.find('.demo-delete').on('click', function(){
	          delete files[index]; //删除对应的文件
	          tr.remove();
	          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
	        });
	        demoListView.append(tr);
	      });
	    },before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
	    	
	    }
	    ,done: function(res, index, upload){
	      if(res.code == 0){ //上传成功
	    	arrayObj.push(res.data)
	        var tr = demoListView.find('tr#upload-'+ index)
	        ,tds = tr.children();
	        tds.eq(3).html('<span style="color: #5FB878;">上传成功</span>');
	        tds.eq(4).html(''); //清空操作
	        tds.eq(5).html(''); //清空操作
	        return delete this.files[index]; //删除文件队列已经上传成功的文件
	      }
	      this.error(index, upload);
	    }
	    ,error: function(index, upload){
	      var tr = demoListView.find('tr#upload-'+ index)
	      ,tds = tr.children();
	      tds.eq(3).html('<span style="color: #FF5722;">上传失败</span>');
	      tds.eq(4).find('.demo-reload').removeClass('layui-hide'); //显示重传
	    }
	  });
	  
})
layui.use(['layer','form'], function(){
	var layer = layui.layer,
	form = layui.form;
	form.on('submit(editClassify)', function(data){
		  var $ = layui.jquery,
		  layer = layui.layer;
			if(arrayObj.length>3){
				layer.msg("只允许上传三张图片！",function(){
					location.reload(true);
				})
				return false;
			}
			var datas = data.field
			datas.clothingImgOne=arrayObj[0]
			datas.clothingImgTwo=arrayObj[1]
			datas.clothingImgThree=arrayObj[2]
		  $.ajax({
			url:"${PATH}/clothing/editClothing",
			data:datas,
			method:"post",
			success:function(res){
				if(res.code==100){
					layer.msg(res.extend.msg,{icon:6},function(){
						location.reload(true);
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
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit">编辑</a>
</script>
</body>
</html>