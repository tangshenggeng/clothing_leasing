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
		<a>发布新闻</a>
	</blockquote>
		<div class="layui-form" style="margin-top: 50px">
		<div class="layui-row">
			<div class="layui-col-md10 " >
				<div class="layui-form-item">
					<label class="layui-form-label">标题</label>
					<div class="layui-input-block">
						<input type="text"  id="newTitleInput"
							placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">副标题</label>
					<div class="layui-input-block">
						<textarea  placeholder="请输入" id="newSubheadingInput" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">展示图</label>
					<div class="layui-input-block">
					<input type="hidden" id="showImgInput" />
						<div class="layui-upload-drag" id="subheadingImg">
						  <i class="layui-icon"></i>
						  <p>点击上传，或将文件拖拽到此处（只能上传一张）</p>
						</div>
						<div class="layui-upload-list">
					    <img class="layui-upload-img" id="previewImg">
					    <p id="demoText"></p>
					  </div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">正文</label>
					<div class="layui-input-block">
						<div id="editor">
					        <p>内容图片大小不超过1M，不超过5张（删除这段话开始编写新闻）</p>
					    </div>
					</div>
				</div>
				 <div class="layui-form-item">
				    <label class="layui-form-label">状态</label>
				    <div class="layui-input-block" id="newsState">
				      <input type="radio" name="state" value="展示" title="展示" checked>
				      <input type="radio" name="state" value="隐藏" title="隐藏">
				    </div>
				  </div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" type="button" id="addNewsBtn">添加</button>
						<button type="reset" id="resetBtn" class="layui-btn layui-btn-primary">重置</button>
					</div>
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
<script src="${PATH}/static/wangEditor/release/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    editor.customConfig.menus = [
    	'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
        'code',  // 插入代码
        'undo',  // 撤销
        'redo'  // 重复
    ]
 	// 关闭粘贴样式的过滤
    editor.customConfig.pasteFilterStyle = false
    // 忽略粘贴内容中的图片
    editor.customConfig.pasteIgnoreImg = true
 	editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    editor.customConfig.uploadImgServer = '${PATH}/news/uploadTextImg'  // 上传图片到服务器
   	// 隐藏“网络图片”tab
    editor.customConfig.showLinkImg = false
 	// 将图片大小限制为 3M
    editor.customConfig.uploadImgMaxSize = 1 * 1024 * 1024
 	// 限制一次最多上传 5 张图片
    editor.customConfig.uploadImgMaxLength = 5
  	//自定义文件名字
    editor.customConfig.uploadFileName = 'file';
    editor.customConfig.customAlert = function (info) {
    	layui.layer.msg("图片格式或大小有误",{icon:5})
    }
    editor.customConfig.uploadImgHooks = {
    	    before: function (xhr, editor, files) {
    	    },
    	    success: function (xhr, editor, result) {
    	    },
    	    fail: function (xhr, editor, result) {
    	    	layui.layer.msg(result.msg,{icon:5})
    	    },
    	    error: function (xhr, editor) {
    	    	layui.layer.msg("图片格式或大小有误",{icon:5})
    	    },
    	    timeout: function (xhr, editor) {
    	    	layui.layer.msg("图片上传超时！",{icon:5})
    	    },
    	    // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
    	    customInsert: function (insertImg, result, editor) {
    	    	var url = result.data
	        	insertImg(url)	//回显
    	    }
    	}
    editor.create()
    
</script>
<script>
//拖拽上传
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  upload.render({
	  	elem: '#subheadingImg'
		,url: '${PATH}/news/uploadCoverImg'
	   	,accept: 'images' //视频
	    ,acceptMime:"image/*"
	    ,exts:'jpg|png'
	    ,number:1
	    ,size:1024	//图片不超过1M
	    ,done: function(res){
	      console.log(res)
	      //如果上传失败
	      if(res.code > 0){
	        return layer.msg(res.msg,{icon:5});
	      }
	      //上传成功
	      $("#showImgInput").val(res.data);
	      $("#previewImg").attr("src",res.data);
	      layer.msg(res.msg,{icon:6})
	    },error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
	      demoText.find('.demo-reload').on('click', function(){
	        uploadInst.upload();
	      });
		 }
	});
  })
$("#addNewsBtn").click(function(){
	layui.use('layer', function(){
		  var layer = layui.layer;
		var text = editor.txt.html()
		var title = $("#newTitleInput").val();
    	var coverImg = $("#showImgInput").val();
		var subheading = $("#newSubheadingInput").val();
		var state = $('#newsState input[name="state"]:checked').val();
		if(title==""){
			layer.msg("请输入标题！")
			return false;
		}
		if(coverImg==""){
			layer.msg("请上传展示图！")
			return false;
		}
		if(subheading==""){
			layer.msg("请输入副标题！")
			return false;
		}
		$.ajax({
			url:"${PATH}/news/addNews",
			method:"POST",
			contentType: "application/json",//必须指定，否则会报415错误
	        dataType : 'json',
			data:JSON.stringify({
				text:text,
				title:title,
				coverImg:coverImg,
				subheading:subheading,
				state:state
			}),success:function(res){
				if(res.code==100){
					layer.msg(res.extend.msg,{icon:6},function(){
						location.reload() 
					})
				}else{
					layer.msg(res.extend.msg,{icon:5})	
				}
			},error:function(){
				layer.msg("系统错误")
			}
		});
		
	
	})
    	
		
		
})
</script>
<script>
	
</script>
</body>
</html>