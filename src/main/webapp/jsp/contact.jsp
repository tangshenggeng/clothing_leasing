<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>联系我们</title>
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
         <div class="contact-page">
            <div class="breadcrumb-area">
               <ul>
                  <li><a href="${PATH}/jsp/index.jsp">主页</a></li>
                  <li><span>联系我们</span></li>
               </ul>
            </div>
            <h2 class="page-title">联系我们</h2>
            <div class="contact-info col-12">
               <div class="form-row">
                  <div class="col-md-4">
                     <div class="contact text-center">
                        <i class="fas fa-envelope"></i>
                        <h4>邮箱</h4>
                        <p>admin@gixco.com</p>
                        <p>info@gixco.com</p>
                     </div>
                  </div>
                  <div class="col-md-4">
                     <div class="contact text-center">
                        <i class="fas fa-map-marker-alt"></i>
                        <h4>地址</h4>
                        <p>清河九栋</p>
                        <p>清河九栋</p>
                     </div>
                  </div>
                  <div class="col-md-4">
                     <div class="contact text-center">
                        <i class="fas fa-phone"></i>
                        <h4>电话</h4>
                        <p>+002 825887445</p>
                        <p>+002 487874577</p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-10 offset-md-1">
               <form  method="post" id="addContactForm">
                  <div class="contact-form">
                     <div class="form-row">
                        <div class="form-group col-md-6">
                           <label >称呼 <span class="required">*</span></label>
                           <input type="text" required="required" id="contactName_input" name="contactName">
                        </div>
                        <div class="form-group col-md-6">
                           <label>邮箱 <span class="required">*</span></label>
                           <input type="email" required="required"  id="contactEmail_input" name="contactEmail">
                        </div>
                        <div class="form-group col-md-6">
                           <label>联系方式</label>
                           <input type="text" name="contactPhone">
                        </div>
                        <div class="form-group col-md-6">
                           <label>类型</label>
                           <input type="text" name="contactSort" placeholder="比如：申请合作">
                        </div>
                        <div class="form-group col-12">
                           <label>内容 <span class="required">*</span></label>
                           <textarea name="contactMessage" id="message" cols="30" rows="10" spellcheck="false"></textarea>
                        </div>
                        <div class="form-group">
                           <button class="btn theme-btn mr-2" type="button" id="addContactBtn">提交</button>                                   
                           <button class="btn theme-btn mr-2" type="reset" id="resetBtn">提交</button>                                   
                        </div>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <!-- <div id="contact-map" class="contact-map"></div> -->
      <%@ include file="/jsp/common/footer.jsp"%>
      
      <script src="${PATH}/static/layui/layui.all.js"></script>
   </body>
<script>
	$("#addContactBtn").click(function(){
		var datas = $("#addContactForm").serialize();
		
		var message = $("#message").val()
		var name = $("#contactName_input").val()
		var email = $("#contactEmail_input").val()
		if(message==""||name==""||email==""){
			layui.layer.msg("必填项不能为空！")
			return false;
		}
		$.ajax({
			url:"${PATH}/contact/addContact",
			method:"post",
			data:datas,
			success:function(res){
				if(res.code==100){
					layui.layer.msg(res.extend.msg,{icon:6},function(){
						$("#resetBtn").click();
					})
				}else{
					layui.layer.msg(res.extend.msg,{icon:5},function(){
						$("#resetBtn").click();
					})	
				}
			},error:function(){
				layui.layer.msg("系统错误")
			}
		})
	})
</script>
</html>
