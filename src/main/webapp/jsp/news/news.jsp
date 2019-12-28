<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>新闻中心</title>
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
         <div class="blog-page" id="showNewsList">
            <div class="breadcrumb-area">
               <ul>
                  <li><a href="${PATH}/jsp/index.jsp">首页</a></li>
                  <li><span>新闻</span></li>
               </ul>
            </div>
            <h2 class="page-title">新闻中心</h2>
            <div class="search_bar">
	            <form class="col-lg-6 col-md-8 offset-lg-3 offset-md-2">
	            	<div class="row">
	            		<div class="col-md-10">
	            			<input type="text" v-model="newsKeyworld" placeholder="输入关键字">
	            		</div>
	            		<div class="col-md-2">
	            			<button v-on:click="findByKw" type="button" class="btn theme-btn" style="width: 100%;height: 100%;padding: 0"><i class="fas fa-search"></i></button>
	            		</div>
	            	</div>
	            </form>
            </div><br>	
            <div class="blog-area mb-0">
               <div class="row">
                  <div class="col-lg-6 col-md-6" v-for="item in news">
                     <div class="blog">
                        <a :href="'${PATH}/news/getByNewsIdent/'+item.newsIdent"><img style="width: 620px;height: 413px" :src="item.coverImg" alt="Image"></a>
                        <div class="datetime">
                           <span><i class="far fa-calendar-alt"></i> {{item.createTime | moment }}</span>
                           <!-- <span><i class="far fa-edit"></i> Gixco-Creative</span> -->
                        </div>
                        <h4 class="title"><a :href="'${PATH}/news/getByNewsIdent/'+item.newsIdent">{{item.newsTitle}}</a></h4>
                        <div class="post-text">
                           <p>{{item.newsSubheading}}</p>
                        </div>
                        <div class="read-more"><a :href="'${PATH}/news/getByNewsIdent/'+item.newsIdent">阅读全文</a></div>
                     </div>
                  </div>
               </div>
               <div class="pagination-area">
                  <nav aria-label="Page navigation example">
                     <ul class="pagination">
                        <li class="page-item">
                           <a class="page-link" href="javascript:void(0);" v-on:click="previous(current-1)" aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span>
                           <span class="sr-only">上一页</span>
                           </a>
                        </li>
                        <li class="page-item"  v-for="item in pages" v-bind:class="{active: item==current }" ><a class="page-link" href="javascript:;" v-on:click="jumpToPage(item)">{{item}}</a></li>
                        <li class="page-item">
                           <a class="page-link" href="javascript:void(0);" v-on:click="next(current+1)" aria-label="Next">
                           <span aria-hidden="true">&raquo;</span>
                           <span class="sr-only">下一页</span>
                           </a>
                        </li>
                     </ul>
                  </nav>
               </div>
            </div>
         </div>
      </div>
     <!-- 静态引入底部 -->
      <%@ include file="/jsp/common/footer.jsp"%>
       <script src="${PATH}/static/js/comment.js"></script>
       <script src="${PATH}/static/layui/layui.all.js"></script>
   </body>
<script>
	var showNewsList = new Vue({
		el:"#showNewsList",
		data:{
			news:[],
			newsKeyworld:"",
			current:1,		//当前页初始化
			pages:[]
		},created: function () {
			//供应商
			this.$http.post("${PATH}/news/getNewsListByShow",{
					keyword:"all",
					page:1,
				}).then(function(response){
				//成功
				this.pages=response.body.pages;
				this.current=response.body.current;
				this.news=response.body.records;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},methods:{
			findByKw:function(){
				this.$http.post("${PATH}/news/getNewsListByShow",{
					keyword:this.newsKeyworld,
					page:1,
				}).then(function(response){
					//成功
					this.pages=response.body.pages;
					this.current=response.body.current;
					this.news=response.body.records;
				},function(response) {
					//错误
					console.log("系统错误！")
				});
			},previous:function(page){	//上一页
				if(page<1){
					layui.layer.msg("不存在上一页！")
				}else{
					this.$http.post("${PATH}/news/getNewsListByShow",{
						keyword:this.newsKeyworld,
						page:page,
					}).then(function(response){
						//成功
						this.pages=response.body.pages;
						this.current=response.body.current;
						this.news=response.body.records;
					},function(response) {
						console.log("系统错误！")
					});
				}
			},next:function(page){	//下一页
				if(page>this.pages){
					layui.layer.msg("不存在下一页！")
				}else{
					this.$http.post("${PATH}/news/getNewsListByShow",{
						keyword:this.newsKeyworld,
						page:page,
					}).then(function(response){
						//成功
						this.pages=response.body.pages;
						this.current=response.body.current;
						this.news=response.body.records;
					},function(response) {
						console.log("系统错误！")
					});
				}
			},jumpToPage:function(page){
				this.$http.post("${PATH}/news/getNewsListByShow",{
					keyword:this.newsKeyworld,
					page:page,
				}).then(function(response){
					//成功
					this.pages=response.body.pages;
					this.current=response.body.current;
					this.news=response.body.records;
				},function(response) {
					console.log("系统错误！")
				});
			}
		
		}
	})
	Vue.filter('moment', function (value, formatString) {
	    formatString = formatString || 'YYYY-MM-DD HH:mm:ss';
	    return moment(value).format(formatString);
	});
</script>
</html>
