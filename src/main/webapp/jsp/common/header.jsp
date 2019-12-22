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
                           <ul>
                              <li>
                                 <a href="${PATH}/jsp/index.html">首页</a>
                                 <%-- <ul class="submenu">
                                    <li><a href="${PATH}/jsp/index.html">Home Style 1</a></li>
                                    <li><a href="index2.html">Home Style 2</a></li>
                                    <li><a href="index3.html">Home Style 3</a></li>
                                    <li><a href="index4.html">Home Style 4</a></li>
                                 </ul> --%>
                              </li>
                              <li>
                                 <a href="shop.html">产品</a>
                                 <ul class="mega-menu">
                                    <li>
                                       <a href="shop.html">Furniture Category</a>
                                       <ul>
                                          <li><a href="shop.html">Small Storage</a></li>
                                          <li><a href="shop.html">Chaise beds</a></li>
                                          <li><a href="shop.html">Stools &amp; Benches</a></li>
                                          <li><a href="shop.html">Lounge Chairs</a></li>
                                          <li><a href="shop.html">Sofa armchairs</a></li>
                                       </ul>
                                    </li>
                                    <li>
                                       <a href="shop.html">Furniture Category</a>
                                       <ul>
                                          <li><a href="shop.html">Lounge Chairs</a></li>
                                          <li><a href="shop.html">Small Storage</a></li>
                                          <li><a href="shop.html">Chaise beds</a></li>
                                          <li><a href="shop.html">Stools &amp; Benches</a></li>
                                          <li><a href="shop.html">Small Storage</a></li>
                                       </ul>
                                    </li>
                                    <li>
                                       <a href="shop.html">Furniture Category</a>
                                       <ul>
                                          <li><a href="shop.html">Small Storage</a></li>
                                          <li><a href="shop.html">Chaise beds</a></li>
                                          <li><a href="shop.html">Stools &amp; Benches</a></li>
                                          <li><a href="shop.html">Lounge Chairs</a></li>
                                          <li><a href="shop.html">Sofa armchairs</a></li>
                                       </ul>
                                    </li>
                                 </ul>
                              </li>
                              <li>
                                 <a href="shop.html">Shop</a>
                                 <ul class="mega-menu">
                                    <li>
                                       <a href="shop.html">Shop View</a>
                                       <ul>
                                          <li><a href="shop.html">Shop Grid</a></li>
                                          <li><a href="list-view.html">Shop List</a></li>
                                          <li><a href="shop.html">Shop 3 Column</a></li>
                                          <li><a href="shop-full.html">Shop Full View</a></li>
                                          <li><a href="shop-4-column.html">Shop 4 Column</a></li>
                                       </ul>
                                    </li>
                                    <li>
                                       <a href="shop.html">Shop View</a>
                                       <ul>
                                          <li><a href="shop-sidebar-left.html">Sidebar Left</a></li>
                                          <li><a href="shop-sidebar-right.html">Sidebar Right</a></li>
                                          <li><a href="cart.html">Shopping Cart</a></li>
                                          <li><a href="wishlist.html">My Wishlist</a></li>
                                          <li><a href="checkout.html">Checkout</a></li>
                                       </ul>
                                    </li>
                                    <li>
                                       <a href="shop.html">Product Types</a>
                                       <ul>
                                          <li><a href="simple.html">Simple Product</a></li>
                                          <li><a href="configurable.html">Configurable Product</a></li>
                                          <li><a href="left-thumb.html">Thumb Left Product</a></li>
                                       </ul>
                                    </li>
                                 </ul>
                              </li>
                              <li>
                                 <a href="blog-2-col.html">Blog</a>
                                 <ul class="submenu">
                                    <li><a href="blog-2-col.html">Blog 2 Column</a></li>
                                    <li><a href="blog-2-col-mas.html">Blog 2 Col Masonry</a></li>
                                    <li><a href="blog-3-col.html">Blog 3 Column</a></li>
                                    <li><a href="blog-3-col-mas.html">Blog 3 Col Masonry</a></li>
                                    <li><a href="blog-detail.html">Blog Details</a></li>
                                    <li><a href="blog-detail-audio.html">Blog Audio</a></li>
                                    <li><a href="blog-detail-video.html">Blog Video</a></li>
                                    <li><a href="blog-detail-gallery.html">Blog Gallery</a></li>
                                    <li><a href="blog-left-sidebar.html">Blog left sidebar</a></li>
                                 </ul>
                              </li>
                              <li>
                                 <a href="#">Pages</a>
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
                              <li><a href="contact.html">Contact</a></li>
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
         </header>
<%-- 
<div class="header_con">
	<div class="header">
		<div class="welcome fl">欢迎来到草原兴发!</div>
		<div class="fr">
			<c:choose>
				<c:when test="${not empty sessionScope.name}">
					<div class="login_info fl">
						欢迎您：<em>${sessionScope.name}</em>
					</div>
					<div class="user_link fl">
						<span>|</span>
						<a href="${PATH}/pages/user_center_info.jsp">用户中心</a>
						<span>|</span>
						<a href="${PATH}/cart/getMyCart/${sessionScope.ident}">我的购物车</a>
						<span>|</span>
						<a href="${PATH}/order/getMyOrders/${sessionScope.ident}">我的订单</a>
						<span>|</span>
						<a href="${PATH}/customer/loginOut">退出登录</a>
					</div>
				</c:when>
				<c:when test="${empty sessionScope.name}">
					<div class="login_btn fl">
						<span>|</span>
						<a href="${PATH}/pages/login.jsp">登录</a>
						<span>|</span>
						<a href="${PATH}/pages/register.jsp">注册</a>
						<span>|</span>
						<a href="${PATH}/pages/admin-login.jsp">后台登录</a>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>		
</div>
<div class="search_bar clearfix">
		<a href="${PATH}/pages/index.jsp" class="logo fl"><img style="border:0;width:100px;height:75px;" src="${PATH}/pages/images/logo.png"></a>
		<div class="search_con fl">
			<form action="${PATH}/food/findFoodsByKeyWords" method="post">
				<input type="text" class="input_text fl" name="foodName" placeholder="搜索商品">
				<input type="submit" class="input_btn fr" value="搜索">
			</form>
			
		</div>
		<c:choose>
		<c:when test="${not empty sessionScope.name}">
			<div class="guest_cart fr">
				<a href="${PATH}/cart/getMyCart/${sessionScope.ident}" class="cart_name fl">我的购物车</a>
				<div class="goods_count fl" id="show_count">*</div>
			</div>
		</c:when>
		</c:choose>
	</div> --%>