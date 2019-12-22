<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>      
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>客户登录</title>
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
                  <li><span>后台登录</span></li>
               </ul>
            </div>
            <form action="${PATH}/admin/loginInto" method="post">
               <div class="login-form">
                  <h2 class="page-title">后台登录</h2>
                  <div class="row">
                     <div class="col-lg-6 col-md-8 offset-lg-3 offset-md-2">
                        <div class="form-group">
                           <label for="text">用户名<span class="required">*</span></label>
                           <input type="text" name="adminName"  id="text">
                        </div>
                        <div class="form-group">
                           <label for="password">密码 <span class="required">*</span></label>
                           <input type="password"  name="adminPassword"  id="password">
                        </div>
                        <div class="form-group">
                           <button type="submit" class="btn theme-btn mr-2">登录</button>
                           <p class="checkbox-area">
                              <!-- <label>
                                 <input type="checkbox"> 记住我 
                              </label> -->
                              <%-- <span><a href="${PATH}/jsp/customer/forget-pwd.jsp">忘记密码?</a></span> --%>
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
   <script type="text/javascript">
	var error = "${msg}"
	if(error!=""){
		layui.layer.msg(error,{icon:5})
	}

</script>
</html>
