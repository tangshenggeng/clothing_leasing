<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>      
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>注册</title>
      <meta name="description" content="">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      
      <!-- FontAwesome -->
      <link rel="stylesheet" href="${PATH}/jsp/assets/css/all.css">
      <!-- Bootstrap v4.3.1 -->
      <link rel="stylesheet" href="${PATH}/jsp/assets/css/bootstrap.min.css">
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Oswald:300,400" rel="stylesheet">
      <!-- Global CSS -->
      <link rel="stylesheet" href="${PATH}/jsp/assets/css/normalize.css">
      <link rel="stylesheet" href="${PATH}/jsp/assets/css/main.css">
      <!-- Jquery ui -->
      <link rel="stylesheet" href="${PATH}/jsp/assets/css/jquery-ui.css">
      <!-- Responsive Menu CSS -->
      <link rel="stylesheet" href="${PATH}/jsp/assets/css/meanmenu.css">
      <!-- Theme CSS -->
      <link rel="stylesheet" href="${PATH}/jsp/assets/css/styles.css">   
   </head>
   <body>
      <div class="container">
         <%@ include file="/jsp/common/header.jsp"%>
         <div class="login-page">
            <div class="breadcrumb-area">
               <ul>
                  <li><a href="${PATH}/jsp/index.jsp">首页</a></li>
                  <li><span>注册</span></li>
               </ul>
            </div>
            <form action="${PATH}/customer/registerCust" method="post">
               <div class="login-form">
                  <h2 class="page-title">注册</h2>
                  <div class="row">
                     <div class="col-lg-6 col-md-8 offset-lg-3 offset-md-2">
                        <div class="form-group">
                           <label for="name">用户名 <span class="required">*</span></label>
                           <input type="text" name="custName" id="name">
                        </div>
                        <div class="form-group">
                           <label for="email">邮箱 <span class="required">*</span></label>
                           <input type="email" name="custEmail" id="email">
                           <input type="button" onclick="sendemail()" id="codeBtn" value="点击获取验证码"  class="btn theme-btn mr-2">
                        </div>
                        <div class="form-group">
                           <label for="password">验证码<span class="required">*</span></label>
                           <input type="text" name="formCode">
                        </div>
                        <div class="form-group">
                           <label for="password">密码 <span class="required">*</span></label>
                           <input type="password" name="formPwd1" id="password">
                        </div>
                        <div class="form-group">
                           <label for="confpassword">确认密码 <span class="required">*</span></label>
                           <input type="password" name="formPwd2" id="confpassword">
                        </div>
                        <div class="form-group">
                           <button type="submit" class="btn theme-btn mr-2">注册</button>
                           <a href="${PATH}/jsp/customer/login.jsp" class="btn theme-btn mr-2">登录</a>
                           <p class="checkbox-area">
                           </p>                          
                        </div>
                     </div>                    
                  </div>
               </div>
            </form>
         </div>
      </div>
      <!-- 静态引入底部 -->
      <%@ include file="/jsp/common/footer.jsp"%>
      <script src="${PATH}/static/layui/layui.all.js"></script>
   </body>
   <script>
   var error = "${error}"
   if(error!=""){
   	layui.layer.msg(error,{icon:5})
   }
   var success = "${success}"
   if(success!=""){
   	layui.layer.msg(success,{icon:6},function(){
   		window.location.href="${PATH}/jsp/customer/login.jsp";
   	})
   }
   </script>
   <script>
	 //验证码
	 var countdown=60; 
	 function sendemail(){
	 	layui.use('layer', function(){
	 	  	var layer = layui.layer;
	 	  	var obj = $("#codeBtn");
	 	    var email = $("#email").val();
	 	    var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	 	    if(!reg.test(email)){
	 	    	layer.msg("请输入正确的邮箱！",{icon:5});
	 	    	return;
	 	    }
	 	    $.ajax({
	 	    	url:"${PATH}/regiterCode/createEmailCode?regEmail="+email,
	 	    	method:"get",
	 	    	success:function(res){
	 	    		if(res.code==100){
	 	    			layer.msg(res.extend.msg,{icon:6});
	 	    		}else{
	 	    			layer.msg(res.extend.msg,{icon:5});
	 	    		}
	 	    	},error:function(){
	 	    		layer.msg("系统错误！",{icon:5});
	 	    		return;
	 	    	}
	 	    });
	 	    settime(obj);
	 	});
	     }
	 function settime(obj) { //发送验证码倒计时
	     if (countdown == 0) { 
	         obj.attr('disabled',false); 
	         //obj.removeattr("disabled"); 
	         obj.val("点击获取验证码");
	         countdown = 60; 
	         return;
	     } else { 
	         obj.attr('disabled',true);
	         obj.val("重新发送(" + countdown + ")");
	         countdown--; 
	     } 
	 setTimeout(function() { 
	     settime(obj) }
	     ,1000) 
	 }
   </script>
</html>
