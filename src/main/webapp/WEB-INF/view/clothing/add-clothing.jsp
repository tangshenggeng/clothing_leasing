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
		<a>添加服装</a>
	</blockquote>
		<form class="layui-form" style="margin-top: 50px">
		<div class="layui-row">
			<div class="layui-col-md6" >
				<div class="layui-form-item">
				<label class="layui-form-label">名称</label>
				<div class="layui-input-block">
					<input type="text" name="clothingName" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">价格</label>
					<div class="layui-input-block">
						<input type="number" name="clothingPrice" required lay-verify="number"
							placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">库存</label>
					<div class="layui-input-block">
						<input type="number" name="clothingStock" required lay-verify="number"
							placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">描述</label>
					<div class="layui-input-block">
					<textarea name="clothingDescribe" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
					</div>
				</div>
				 <div class="layui-form-item">
				    <label class="layui-form-label">状态</label>
				    <div class="layui-input-block">
				      <input type="radio" name="clothingState" value="展示" title="展示" checked>
				      <input type="radio" name="clothingState" value="隐藏" title="隐藏">
				    </div>
				  </div>
				 <div class="layui-form-item">
				    <label class="layui-form-label">分类</label>
				    <div class="layui-input-block">
				    	<select name="clothingClassifyId" lay-verify="required" id="seleClassifyId">
						  <option value="0">请选择</option>
						  <option v-for="item in classifys" :value="item.classifyId" v-text="item.classifyName"></option>
						</select> 
				    </div>
				  </div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="addClassify">添加</button>
						<button type="reset" id="resetBtn" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			
			</div>
			
			<div class="layui-col-md6" >
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
	form.on('submit(addClassify)', function(data){
		  var $ = layui.jquery,
		  layer = layui.layer;
			if(arrayObj.length==0){
				layer.msg("请确认上传图片！")
				return false;
			}
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
			url:"${PATH}/clothing/addClothing",
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
</body>
</html>