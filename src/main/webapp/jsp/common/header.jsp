<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${PATH}/static/vue/vue.min.js"></script>
<script type="text/javascript" src="${PATH}/static/vue/vue-resource.min.js"></script>
         <header class="header">
            <div class="topcontain">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12">
                     <div class="logo">
                        <a href="${PATH}/jsp/index.jsp"><img src="${PATH}/jsp/logo.png" style="width: 50px;height: 37px" alt="Logo" /></a>
                     </div>
                  </div>
                  <div class="col-xl-5 col-lg-3 col-md-2 col-sm-12">
                     <div class="menubar">
                        <nav id="mobile-menu">
                           <ul id="navClassify">
                              <li>
                                 <a href="${PATH}/jsp/index.jsp">首页</a>
                              </li>
	                              <li>
	                                 <a href="shop.html">服装</a>
	                                 <ul class="mega-menu" style="min-width:200px;width: 200px">
	                                    <li style="width:100%">
	                                       <a href="#">服装分类</a>
	                                       <ul id="getClassifyDiv">
	                                          <li v-for="item in classifys"><a :href="'${PATH}/clothing/'+item.ident">{{item.name}}</a></li>
	                                       </ul>
	                                    </li>
	                                 </ul>
	                              </li>
	                              <li>
	                                 <a href="blog-2-col.html">新闻</a>
	                                 <ul class="submenu">
	                                 	<!-- 博客的分类 -->
	                                 	<li><a href="/clothing_leasing/clothing/72BAFA6FA7">节日服</a></li>
	                                 </ul>
	                              </li>
                              <li>
                                 <a href="#">关于我们</a>
                                 <ul class="submenu">
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="register.html">Register</a></li>
                                    <li><a href="cart.html">Shopping Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="wishlist.html">Wishlist</a></li>
                                    <li><a href="404.html">404</a></li>
                                 </ul>
                              </li>
                              <li><a href="contact.html">联系我们</a></li>
                           </ul>
                        </nav>
                     </div>
                  </div>
                  <div class="col-xl-4 col-lg-6 col-md-7 col-sm-12">
                     <div class="head_right">
                        <div class="login_bar">
                           <ul>
								<c:choose>
									<c:when test="${not empty sessionScope.name}">
										<li class="shop-cart">
		                                 <i class="fas fa-user"></i> 欢迎您：<em>${sessionScope.name}</em>
		                                 <ul class="minicart">
		                                    <li>
		                                       <div class="checkout-btn">
		                                          <a href="${PATH}/order/getMyOrders/${sessionScope.ident}">我的订单</a>
		                                       </div>
		                                    </li>
		                                    <li>
		                                       <div class="checkout-btn">
		                                          <a href="${PATH}/customer/loginOut">退出登录</a>
		                                       </div>
		                                    </li>
		                                 </ul>
		                              </li>
									</c:when>
									<c:when test="${empty sessionScope.name}">
									 	<li><a href="${PATH}/jsp/customer/login.jsp">登录</a></li>
                             			<li><a href="${PATH}/jsp/customer/register.jsp">注册</a></li>
									</c:when>
								</c:choose>
                              <li class="search">
                                 <a href="#"><i class="fas fa-search"></i></a>
                                 <div class="search_bar">
                                    <form>
                                       <input type="text" name="search" placeholder="输入服装关键字">
                                       <span class="search_icon"><i class="fas fa-search"></i></span>
                                    </form>
                                 </div>
                              </li>
                              <li><a href="${PATH}/jsp/admin-login.jsp">后台登录</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-12 d-xl-none">
                     <div class="mobile-menu"></div>
                  </div>
               </div>
            </div>
            <script>
            	var getClassifyDiv = new Vue({
            		el:"#getClassifyDiv",
            		data:{
            			classifys:[]
            		},created: function () {
            			//供应商
            			this.$http.get("${PATH}/classify/getClassifyByShow").then(function(response){
            				console.log(response.body)
            				//成功
            				this.classifys=response.body;
            			},function(response) {
            				//错误
            				console.log("系统错误！")
            			});
            		}          		
            	});
            </script>
         </header>

