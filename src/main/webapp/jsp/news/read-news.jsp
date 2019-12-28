<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>阅读新闻</title>
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
         <div class="blog-page">
            <div class="breadcrumb-area">
               <ul>
                  <li><a href="${PATH}/jsp/index.jsp">主页</a></li>
                  <li><span>阅读博客</span></li>
               </ul>
            </div>
            <h2 class="page-title">${news.newsTitle}</h2>
            <div class="blog-area mb-0">
               <div class="row">
                  <div class="col-md-10 offset-md-1">
                     <div class="blog">
                        <%-- <img src="${news.coverImg}" alt="Image"> --%>
                        <div class="datetime">
                           <span><i class="far fa-calendar-alt"></i> ${news.createTime}</span>
                           <!-- <span><i class="far fa-edit"></i> Gixco-Creative</span> -->
                        </div>
                        <h4 class="title">${news.newsSubheading}</h4>
                        <div class="post-text">
                        	${news.newsText}
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12">
                           <!-- <div class="blog-post-tag">
                              <span>Tags:</span>
                              <a href="blog-2-col.html">Lorem</a>
                              <a href="blog-2-col.html">Health</a>                        
                           </div> -->
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                           <div class="blog-share-icon">
                              <span>分享: </span>
                              <a href="#"><i class="fab fa-facebook-f"></i></a>
                              <a href="#"><i class="fab fa-twitter"></i></a>
                              <a href="#"><i class="fab fa-instagram"></i></a>
                              <a href="#"><i class="fab fa-pinterest"></i></a>                              
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-md-12">
                           <div class="content-nav">
                              <div class="content-prev">
                                 <a href="javascript:history.go(-1)"><span><i class="fas fa-arrow-left"></i> 返回</span></a>
                              </div>
                              <!-- <div class="content-next">
                                 <a href="blog-detail.html" rel="next"><span>Next Post <i class="fas fa-arrow-right"></i></span>Cosby sweater eu banh</a>
                              </div> -->
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
       <%@ include file="/jsp/common/footer.jsp"%>
       <script src="${PATH}/static/layui/layui.all.js"></script>
   </body>
<script>
	var error = "${error}"
	if(!error==""){
		layui.layer.msg("error",function(){
			window.location.href="${PATH}/jsp/news/news.jsp";
		})
	}
</script>
</html>
