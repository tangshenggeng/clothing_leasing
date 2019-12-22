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
                        <h4>Free Shipping</h4>
                        <p>Free Shippment on this area</p>
                     </li>
                     <li>
                        <h4>Money Back</h4>
                        <p>100% Money back  - 30 days</p>
                     </li>
                     <li>
                        <h4>24h support</h4>
                        <p>Services support fast 24/7</p>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="product-carousel">
            <div class="tab-products">
               <ul class="nav nav-tabs" id="myTab1" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">Arrival</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Winter</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="tab-3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">Summer</a>
                  </li>
               </ul>
               <div class="tab-content" id="myTabContent-1">
                  <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab-1">
                     <div class="tab-product-1">
                        <div class="titlebar">
                           <div class="next-back">
                              <span><a data-slide="prev" href="#Carousel-1" class="left carousel-control">Back</a></span>
                              <span><a data-slide="next" href="#Carousel-1" class="right carousel-control">Next</a></span>
                           </div>
                        </div>
                        <div class="carousel-area">
                           <div id="Carousel-1" class="carousel slide" data-ride="carousel">
                              <div class="carousel-inner">
                                 <div class="carousel-item active">
                                    <div class="product-item">
                                       <div class="row">
                                          <Ul>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-3-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-3-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-4-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-4-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-3-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-3-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-8-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-8-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                          </Ul>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="carousel-item">
                                    <div class="product-item">
                                       <div class="row">
                                          <Ul>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="#">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-9-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-9-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-4-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-4-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-7-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-7-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-8-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-8-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
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
                  <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab-2">
                     <div class="tab-prouct-2">
                        <div class="titlebar">
                           <div class="next-back">
                              <span><a data-slide="prev" href="#Carousel-2" class="left carousel-control">Back</a></span>
                              <span><a data-slide="next" href="#Carousel-2" class="right carousel-control">Next</a></span>
                           </div>
                        </div>
                        <div class="carousel-area">
                           <div id="Carousel-2" class="carousel slide" data-ride="carousel">
                              <div class="carousel-inner">
                                 <div class="carousel-item active">
                                    <div class="product-item">
                                       <div class="row">
                                          <Ul>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-8-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-8-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-4-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-4-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-7-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-7-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-8-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-8-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                          </Ul>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="carousel-item">
                                    <div class="product-item">
                                       <div class="row">
                                          <Ul>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-2-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-2-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-2-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-2-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-1-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-1-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-1-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-1-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
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
                  <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab-3">
                     <div class="tab-prouct-3">
                        <div class="titlebar">
                           <div class="next-back">
                              <span><a data-slide="prev" href="#Carousel-3" class="left carousel-control">Back</a></span>
                              <span><a data-slide="next" href="#Carousel-3" class="right carousel-control">Next</a></span>
                           </div>
                        </div>
                        <div class="carousel-area">
                           <div id="Carousel-3" class="carousel slide" data-ride="carousel">
                              <div class="carousel-inner">
                                 <div class="carousel-item active">
                                    <div class="product-item">
                                       <div class="row">
                                          <Ul>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-5-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-5-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-6-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-6-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-5-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-5-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-6-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-6-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                          </Ul>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="carousel-item">
                                    <div class="product-item">
                                       <div class="row">
                                          <Ul>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-3-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-3-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-4-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/men-4-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-3-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-3-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
                                                </div>
                                             </li>
                                             <li>
                                                <div class="product-grid">
                                                   <div class="product-image">
                                                      <a href="configurable.html">
                                                      <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-4-1.jpg" alt="Product image">
                                                      <img class="pic-2" src="${PATH}/jsp/assets/images/products/women-4-2.jpg" alt="Product image">
                                                      </a>
                                                      <ul class="social">
                                                         <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                         <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                         <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li>
                                                      </ul>
                                                   </div>
                                                   <h3 class="title">Lorem ipsum dolor</h3>
                                                   <div class="product-content">
                                                      <div class="price">$16.00
                                                         <span>$20.00</span>
                                                      </div>
                                                      <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                                   </div>
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
                     <h2>Sale up to 45%!</h2>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
                     <div class="timer">
                        <div>
                           <span class="days" id="day"></span> 
                           <div class="smalltext">Days</div>
                        </div>
                        <div>
                           <span class="hours" id="hour"></span> 
                           <div class="smalltext">Hours</div>
                        </div>
                        <div>
                           <span class="minutes" id="minute"></span> 
                           <div class="smalltext">Minutes</div>
                        </div>
                        <div>
                           <span class="seconds" id="second"></span> 
                           <div class="smalltext">Seconds</div>
                        </div>
                        <p id="time-up"></p>
                     </div>
                     <div class="view-all"><a href="shop.html">View all Products</a></div>
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
                        <h1>Bestseller</h1>
                     </div>
                     <div class="next-back">
                        <span><a data-slide="prev" href="#Carousel-4" class="left carousel-control">Back</a></span>
                        <span><a data-slide="next" href="#Carousel-4" class="right carousel-control">Next</a></span>
                     </div>
                  </div>
                  <div class="mini-carousel-area">
                     <div id="Carousel-4" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                           <div class="carousel-item active">
                              <div class="product-item">
                                 <Ul>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-1-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-2-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-3-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-4-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-5-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-2-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                 </Ul>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <div class="product-item">
                                 <Ul>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-3-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-9-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-5-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-8-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-6-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-7-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
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
                        <h1>Featured</h1>
                     </div>
                     <div class="next-back">
                        <span><a data-slide="prev" href="#Carousel-5" class="left carousel-control">Back</a></span>
                        <span><a data-slide="next" href="#Carousel-5" class="right carousel-control">Next</a></span>
                     </div>
                  </div>
                  <div class="mini-carousel-area">
                     <div id="Carousel-5" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                           <div class="carousel-item active">
                              <div class="product-item">
                                 <Ul>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-3-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-9-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-5-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-8-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-6-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-7-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                 </Ul>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <div class="product-item">
                                 <Ul>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-6-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-8-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-3-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-4-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/women-5-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="mini-img">
                                          <img class="pic-1" src="${PATH}/jsp/assets/images/products/men-2-1.jpg" alt="Product image">
                                       </div>
                                       <div class="mini-content">
                                          <div class="title"><a href="configurable.html">Lorem ipsum dolor</a></div>
                                          <div class="price">$16.00
                                             <span>$20.00</span>
                                          </div>
                                          <a class="add-to-cart" href="cart.html">Add To Cart</a>
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
         <div class="blog-area">
            <h1>Blogs</h1>
            <div class="row">
               <div class="col-lg-4 col-md-12 col-sm-12">
                  <div class="blog">
                     <img src="${PATH}/jsp/assets/images/blog1.jpg" alt="Image">                     
                     <div class="datetime">
                        <span><i class="far fa-calendar-alt"></i> April, 30 2017</span>
                        <span><i class="far fa-edit"></i> Gixco-Creative</span>
                     </div>
                     <h4 class="title"><a href="blog-detail.html">String Pocket Shelving Burgundy</a></h4>
                     <div class="post-text">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-12 col-sm-12">
                  <div class="blog">
                     <img src="${PATH}/jsp/assets/images/blog2.jpg" alt="Image">                     
                     <div class="datetime">
                        <span><i class="far fa-calendar-alt"></i> April, 30 2017</span>
                        <span><i class="far fa-edit"></i> Gixco-Creative</span>
                     </div>
                     <h4 class="title"><a href="blog-detail.html">String Pocket Shelving Burgundy</a></h4>
                     <div class="post-text">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-12 col-sm-12">
                  <div class="blog">
                     <img src="${PATH}/jsp/assets/images/blog3.jpg" alt="Image">                     
                     <div class="datetime">
                        <span><i class="far fa-calendar-alt"></i> April, 30 2017</span>
                        <span><i class="far fa-edit"></i> Gixco-Creative</span>
                     </div>
                     <h4 class="title"><a href="blog-detail.html">String Pocket Shelving Burgundy</a></h4>
                     <div class="post-text">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="newsletter-area">
            <div class="newsletter">
               <h3>KEEP UPDATED</h3>
               <p>Sign up for our newletter to recevie updates an exlusive offers</p>
               <div class="newsletter-form">
                  <input type="text" class="newsl" name="newsletter" placeholder="Enter your email">
                  <button class="newsletter-btn">Subscribe</button>
               </div>
            </div>
         </div>
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
   </body>
</html>
