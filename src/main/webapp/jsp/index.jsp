<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js" lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>首页</title>
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
      <!-- 静态引入头部 --><div class="container">
      <%@ include file="/jsp/common/header.jsp"%>
      </div>
      
      <div class="slidebar">
         <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
               <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
               <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active" style="background-image: url('${PATH}/jsp/assets/images/slider/slider04-4.jpg')">
                  <!--  <div class="carousel_caption">
                     <h1>Appearance</h1>
                     <h2>Classic Design For Office</h2>
                     <p>It is a long established fact that a reader will be happy</p>
                     <a href="shop.html">View Now</a>
                     </div> -->
               </div>
               <div class="carousel-item" style="background-image: url('${PATH}/jsp/assets/images/slider/slider04-2.jpg')">
                  <!--  <div class="carousel_caption">
                     <h1>Megastore</h1>
                     <h2>Design Event on Pixel Mart</h2>
                     <p>It is a long established fact that a reader will be happy</p>
                     <a href="shop.html">More View</a>
                     </div> -->
               </div>
               <div class="carousel-item" style="background-image: url('${PATH}/jsp/assets/images/slider/slider04-1.jpg')">
                  <!-- <div class="carousel_caption">
                     <h1>Clearance</h1>
                     <h2>Retail Design Show Event</h2>
                     <p>It is a long established fact that a reader will be happy</p>
                     <a href="shop.html">View Now</a>
                     </div> -->
               </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
            </a>
         </div>
      </div>
      <div class="banner-offer">
         <div class="col-12">
            <div class="row">
               <div class="banner-left banner">
                  <div class="banner-img">
                     <img src="${PATH}/jsp/assets/images/promo-left.png" alt="Image">
                  </div>
                  <div class="banner-content">
                     <h3>Watch - 25%</h3>
                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                     <a href="shop.html">View Now</a>
                  </div>
               </div>
               <div class="banner-middle banner">
                  <div class="banner-img">
                     <img src="${PATH}/jsp/assets/images/banner07.png" alt="Image">
                  </div>
                  <div class="banner-content">
                     <h3>Hand Bag - 30%</h3>
                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                     <a href="shop.html">View Now</a>
                  </div>
               </div>
               <div class="banner-right banner">
                  <div class="banner-img">
                     <img src="${PATH}/jsp/assets/images/promo-right.png" alt="Image">
                  </div>
                  <div class="banner-content">
                     <h3>Lights - 20%</h3>
                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                     <a href="shop.html">View Now</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="container">
         <div class="service-area">
            <div class="row">
               <div class="col-sm-12">
                  <ul>
                     <li>
                        <h4>免费送货</h4>
                        <p>江西境内免费送货上门</p>
                     </li>
                     <li>
                        <h4>极速发货</h4>
                        <p>下单2个小时内发货</p>
                     </li>
                     <li>
                        <h4>24小时在线</h4>
                        <p>服务支持24/7在线</p>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
        
      </div>
      <div class="countdownTimer-area">
         <div class="container">
            <div class="row">
               <div class="col-lg-6 col-md-12 col-sm-12">
                  <div class="left-image">                     
                     <img src="${PATH}/jsp/assets/images/bag.png" alt="image">
                  </div>
               </div>
               <div class="col-lg-6 col-md-12 col-sm-12">
                  <div class="timer-right">
                     <h2>信赖我们</h2>
                    <!--  <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p> -->
                     <div class="timer">
                        <div>
                           <span class="days">213</span> 
                           <div class="smalltext">商品数</div>
                        </div>
                        <div>
                           <span class="hours">312</span> 
                           <div class="smalltext">交易量</div>
                        </div>
                        <div>
                           <span class="minutes">321</span> 
                           <div class="smalltext">顾客数</div>
                        </div>
                       <!--  <div>
                           <span class="seconds"></span> 
                           <div class="smalltext">Seconds</div>
                        </div> -->
                        <p id="time-up"></p>
                     </div>
                     <div class="view-all"><a href="${PATH}/clothing/toGetAllClothingPage">所有产品</a></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="container">
         <div class="mini-products-area">
            <div class="row">
               <div class="col-lg-6 col-md-12 col-sm-12">
                  <div class="titlebar">
                     <div class="title">
                        <h1>最新</h1>
                     </div>
                     <div class="next-back">
                        <span><a data-slide="prev" href="#Carousel-4" class="left carousel-control">上一页</a></span>
                        <span><a data-slide="next" href="#Carousel-4" class="right carousel-control">下一页</a></span>
                     </div>
                  </div>
                  <div class="mini-carousel-area">
                     <div id="Carousel-4" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner" id="newestClothing">
                           <div class="carousel-item active">
                              <div class="product-item">
                                 <Ul>
                                    <li v-for="(item,index) in newestClothings" v-if="index < 6">
                                       <div class="mini-img">
                                          <img class="pic-1" :src="item.clothingImgOne" alt="服装图">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">{{item.clothingName}}</a></div>
                                          <div class="price">￥ {{item.clothingPrice}}
                                          </div>
                                          <a class="add-to-cart" :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">加入购物车</a>
                                       </div>
                                    </li>
                                 </Ul>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <div class="product-item">
                                 <Ul>
                                   <li v-for="(item,index) in newestClothings" v-if="index >= 6">
                                       <div class="mini-img">
                                          <img class="pic-1" :src="item.clothingImgOne" alt="服装图">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">{{item.clothingName}}</a></div>
                                          <div class="price">￥ {{item.clothingPrice}}
                                          </div>
                                          <a class="add-to-cart" :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">加入购物车</a>
                                       </div>
                                    </li>
                                 </Ul>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-6 col-md-12 col-sm-12">
                  <div class="titlebar">
                     <div class="title">
                        <h1>畅销</h1>
                     </div>
                     <div class="next-back">
                        <span><a data-slide="prev" href="#Carousel-5" class="left carousel-control">上一页</a></span>
                        <span><a data-slide="next" href="#Carousel-5" class="right carousel-control">下一页</a></span>
                     </div>
                  </div>
                  <div class="mini-carousel-area">
                     <div id="Carousel-5" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner"  id="sellwellClothing">
                           <div class="carousel-item active">
                              <div class="product-item">
                                 <Ul>
                                    <li v-for="(item,index) in sellwellClothings" v-if="index < 6">
                                       <div class="mini-img">
                                          <img class="pic-1" :src="item.clothingImgOne" alt="服装图">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">{{item.clothingName}}</a></div>
                                          <div class="price">￥ {{item.clothingPrice}}
                                          </div>
                                          <a class="add-to-cart" :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">加入购物车</a>
                                       </div>
                                    </li>
                                 </Ul>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <div class="product-item">
                                 <Ul>
                                    <li v-for="(item,index) in sellwellClothings" v-if="index >= 6">
                                       <div class="mini-img">
                                          <img class="pic-1" :src="item.clothingImgOne" alt="服装图">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">{{item.clothingName}}</a></div>
                                          <div class="price">￥ {{item.clothingPrice}}
                                          </div>
                                          <a class="add-to-cart" :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">加入购物车</a>
                                       </div>
                                    </li>
                                 </Ul>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="blog-area" id="getNewsByIndex">
            <h1>最新新闻</h1>
            <div class="row">
               <div class="col-lg-4 col-md-12 col-sm-12" v-for="item in news">
                  <div class="blog">
                     <img style="width: 403px;height: 269px" :src="item.coverImg" alt="Image">                     
                     <div class="datetime">
                        <span><i class="far fa-calendar-alt"></i>  {{item.createTime | moment }}</span>
                        <!-- <span><i class="far fa-edit"></i> Gixco-Creative</span> -->
                     </div>
                     <h4 class="title"><a :href="'${PATH}/news/getByNewsIdent/'+item.newsIdent">{{item.newsTitle}}</a></h4>
                     <div class="post-text">
                        <p>{{item.newsSubheading}}</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- <div class="newsletter-area">
            <div class="newsletter">
               <h3>KEEP UPDATED</h3>
               <p>Sign up for our newletter to recevie updates an exlusive offers</p>
               <div class="newsletter-form">
                  <input type="text" class="newsl" name="newsletter" placeholder="Enter your email">
                  <button class="newsletter-btn">Subscribe</button>
               </div>
            </div>
         </div> -->
         <div class="brands-area">
            <div class="carousel-area">
               <div id="brands" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <div class="brands-item">
                           <div class="row">
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand1.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand2.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand3.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand4.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand5.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand1.png" alt="brands">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item">
                        <div class="brands-item">
                           <div class="row">
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand5.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand4.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand3.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand2.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand1.png" alt="brands">
                              </div>
                              <div class="col-md-2 col-sm-12">
                                 <img src="${PATH}/jsp/assets/images/brands/brand5.png" alt="brands">
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <!-- 静态引入底部 -->
      <%@ include file="/jsp/common/footer.jsp"%>
      <%-- <script src="${PATH}/jsp/assets/js/timer.js"></script> --%>
      <script src="${PATH}/static/js/comment.js"></script>
   </body>
<script>
var newestClothing = new Vue({
	el:"#newestClothing",
	data:{
		newestClothings:[]
	},created: function () {
		//供应商
		this.$http.get("${PATH}/clothing/getNewestClothingByShow").then(function(response){
			//成功
			this.newestClothings=response.body;
		},function(response) {
			//错误
			console.log("系统错误！")
		});
	}          		
});
var sellwellClothing = new Vue({
	el:"#sellwellClothing",
	data:{
		sellwellClothings:[]
	},created: function () {
		//供应商
		this.$http.get("${PATH}/clothing/getSellWellClothingByShow").then(function(response){
			//成功
			this.sellwellClothings=response.body;
		},function(response) {
			//错误
			console.log("系统错误！")
		});
	}          		
});
var getNewsByIndex = new Vue({
	el:"#getNewsByIndex",
	data:{
		news:[]
	},created: function () {
		//供应商
		this.$http.get("${PATH}/news/getNewsByIndex").then(function(response){
			console.log(response.body)
			//成功
			this.news=response.body;
		},function(response) {
			//错误
			console.log("系统错误！")
		});
	}          		
});
Vue.filter('moment', function (value, formatString) {
    formatString = formatString || 'YYYY-MM-DD HH:mm:ss';
    return moment(value).format(formatString);
});
</script>
</html>
