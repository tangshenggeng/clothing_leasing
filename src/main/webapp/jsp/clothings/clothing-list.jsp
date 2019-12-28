<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>服装列表</title>
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
         <div class="shop-area">
            <div class="breadcrumb-area">
               <ul>
                  <li><a href="${PATH}/jsp/index.jsp">主页</a></li>
                  <li><span>服装列表</span></li>
               </ul>
            </div>
            <div class="row">
               <!-- <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12">
                  <div class="sidebar-area">
                     <div class="shop-widget">
                        <div class="widget-title">
                           <h2>categories</h2>
                        </div>
                        <div class="widget-content">
                           <ul id="accordion">
                              <li>
                                 <h4>Collection <span class="plusminus">-</span></h4>
                                 <ul style="display: block;">
                                    <li><a href="shop.html">Golf</a></li>
                                    <li><a href="shop.html">Cricket</a></li>
                                    <li><a href="shop.html">Football</a></li>
                                 </ul>
                              </li>
                              <li>
                                 <h4>Technology <span class="plusminus">+</span></h4>
                                 <ul>
                                    <li><a href="shop.html">Macbook</a></li>
                                    <li><a href="shop.html">Ipad</a></li>
                                    <li><a href="shop.html">Iphone</a></li>
                                 </ul>
                              </li>
                              <li>
                                 <h4>Furniture <span class="plusminus">+</span></h4>
                                 <ul>
                                    <li><a href="shop.html">Chairs</a></li>
                                    <li><a href="shop.html">Tables</a></li>
                                    <li><a href="shop.html">Storage</a></li>
                                    <li><a href="shop.html">Office</a></li>
                                 </ul>
                              </li>
                           </ul>
                        </div>
                     </div>
                     <div class="shop-widget">
                        <div class="widget-title">
                           <h2>Shop By</h2>
                        </div>
                        <div class="widget-content">
                           <ul>
                              <li>
                                 <h4>Manufacturer</h4>
                                 <ul>
                                    <li><a href="shop.html">Adidas</a><span>(20)</span></li>
                                    <li><a href="shop.html">Converse</a><span>(16)</span></li>
                                    <li><a href="shop.html">Nike</a><span>(10)</span></li>
                                    <li><a href="shop.html">Gucci</a><span>(25)</span></li>
                                 </ul>
                              </li>
                           </ul>
                        </div>
                     </div>
                     <div class="shop-widget">
                        <h3>Price Filter</h3>
                        <div class="widget-content">
                           <div id="slider-range"></div>
                           <input type="text" id="amount">
                        </div>
                     </div>
                     <div class="shop-widget">
                        <div class="widget-content">
                           <ul>
                              <li>
                                 <h4>Color Options</h4>
                                 <ul>
                                    <li><a href="shop.html">Black</a><span>(8)</span></li>
                                    <li><a href="shop.html">White</a><span>(12)</span></li>
                                    <li><a href="shop.html">Blue</a><span>(10)</span></li>
                                    <li><a href="shop.html">Yellow</a><span>(14)</span></li>
                                    <li><a href="shop.html">Red</a><span>(17)</span></li>
                                    <li><a href="shop.html">Green</a><span>(20)</span></li>
                                 </ul>
                              </li>
                           </ul>
                        </div>
                     </div>
                     <div class="shop-widget">
                        <div class="widget-content">
                           <ul>
                              <li>
                                 <h4>Size Options</h4>
                                 <ul>
                                    <li><a href="shop.html">L</a><span>(8)</span></li>
                                    <li><a href="shop.html">M</a><span>(12)</span></li>
                                    <li><a href="shop.html">S</a><span>(10)</span></li>
                                    <li><a href="shop.html">XL</a><span>(14)</span></li>
                                    <li><a href="shop.html">XX</a><span>(17)</span></li>
                                 </ul>
                              </li>
                           </ul>
                        </div>
                     </div>
                     <div class="shop-widget">
                        <div class="widget-title">
                           <h2>Compare</h2>
                        </div>
                        <div class="widget-content">
                           <p>You have no items to compare.</p>
                        </div>
                     </div>
                  </div>
               </div> -->
               <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12" id="showClothingList">
                  <div class="shop-left-sidebar">
                     <div class="shop-banner">
                        <h3>新款2019</h3>
                        <h4>Furniture</h4>
                        <p>It is a long established fact that a reader will be<br>
                           distracted by the readable content.
                        </p>
                     </div>
                     <div class="shop-products">
                        <div class="filter-bar">
                           <div class="row">
                              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                 <div class="prd-tab">
                                    <ul class="nav nav-tabs" id="myTab1" role="tablist">
                                       <li class="nav-item">
                                          <a class="nav-link active" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true"><i class="fas fa-list-ul"></i></a>
                                       </li>
                                       <li class="nav-item">
                                          <a class="nav-link" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><i class="fas fa-th-large"></i></a>
                                       </li>
                                    </ul>
                                 </div>
                                 <div class="product-showing">
                                 	
                                    <!-- <form action="#">
                                       <select name="pro-filter" id="pro-filter">
                                          <option value="" v-on:click="getByCondition('getAll')">默认排序</option>
                                          <option value="3" v-on:click="getByCondition('getByTime')">最新产品</option>
                                          <option value="2" v-on:click="getByCondition('getByStock')">销量最高</option>
                                       </select>
                                    </form> -->
                                 </div>
                              </div>
                              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                 <div class="product-showing">
                                    <p><a href="javascript:void(0);" v-on:click="getByCondition('getAll')">默认排序</a></p>
                                 </div>
                                 <div class="product-showing">
                                    <p><a href="javascript:void(0);" v-on:click="getByCondition('getByTime')">最新产品</a></p>
                                 </div>
                                 <div class="product-showing">
                                    <p><a href="javascript:void(0);" v-on:click="getByCondition('getByStock')">销量最高</a></p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="tab-content" id="myTabContent-1">
                           <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab-1">
                              <div class="shop-grid">
                                 <div class="product-item">
                                    <div class="row">
                                       <Ul style="width: 100%;">
                                          <li v-for="item in clothingList">
                                             <div class="product-grid">
                                                <div class="product-image">
                                                   <a :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">
                                                   <img class="pic-1" :src="item.clothingImgOne" alt="Product image">
                                                   <img class="pic-2" :src="item.clothingImgTwo" alt="Product image">
                                                   </a>
                                                   <ul class="social">
                                                      <!-- <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                                      <li><a href="#" data-tip="Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                      <li><a href="#" data-tip="Compare"><i class="fas fa-exchange-alt"></i></a></li> -->
                                                   </ul>
                                                </div>
                                                <h3 class="title">{{item.clothingName}}</h3>
                                                <div class="product-content">
                                                   <div class="price">￥ {{item.clothingPrice}}
                                                      
                                                   </div>
                                                   <a class="add-to-cart" :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">加入购物车</a>
                                                </div>
                                             </div>
                                          </li>
                                          
                                       </Ul>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab-2">
                              <div class="shop-list">
                                 <Ul>
                                    <li v-for="item in clothingList">
                                       <div class="product-list">
                                          <div class="row">
                                             <div class="col-xl-4 col-lg-5 col-md-5 col-sm-12">
                                                <div class="product-image">
                                                   <a :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">
                                                   <img class="pic-1" :src="item.clothingImgOne" alt="Product image">
                                                   <img class="pic-2" :src="item.clothingImgTwo" alt="Product image">
                                                   </a>                                                
                                                </div>
                                             </div>
                                             <div class="col-xl-8 col-lg-7 col-md-7 col-sm-12">
                                                <div class="list-content">
                                                   <h3><a :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">{{item.clothingName}}</a></h3>
                                                   <p>{{item.clothingDescribe}}</p>
                                                   <div class="price">￥ {{item.clothingPrice}}
                                                   </div>
                                                   <div class="listcart-area">
                                                      <div class="list-cart">
                                                         <a class="add-to-cart" :href="'${PATH}/clothing/toAddCartPage/'+item.clothingIdent">加入购物车</a>
                                                      </div>
                                                      <div class="social">
                                                         
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </li>
                                    
                                 </Ul>
                              </div>
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
                              <li class="page-item " v-for="item in pages" v-bind:class="{active: item==current }" ><a class="page-link" href="javascript:;" v-on:click="jumpToPage(item)">{{item}}</a></li>
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
         </div>
      </div>
     <%@ include file="/jsp/common/footer.jsp"%>
<script src="${PATH}/static/layui/layui.all.js"></script>	
</body>
<script>
var showClothingList = new Vue({
	el:"#showClothingList",
	data:{
		clothingList:[],
		condition:"${condition}",
		ident:"${ident}",
		keyword:"${keyword}",
		current:1,		//当前页初始化
		pages:[]
	},created: function () {
		//供应商
		this.$http.post("${PATH}/clothing/getClothingList",{
			condition:this.condition,
			ident:this.ident,
			keyword:this.keyword,
			page:1,
		}).then(function(response){
			//成功
			this.pages=response.body.pages;
			this.current=response.body.current;
			this.clothingList=response.body.records;
		},function(response) {
			//错误
			console.log("系统错误！")
		});
	},methods:{
		previous:function(page){	//上一页
			if(page<1){
				layui.layer.msg("不存在上一页！")
			}else{
				this.$http.post("${PATH}/clothing/getClothingList",{
					condition:this.condition,
					ident:this.ident,
					keyword:this.keyword,
					page:page,
				}).then(function(response){
					//成功
					this.clothingList=response.body.records;
					this.pages=response.body.pages;
					this.current=response.body.current;
				},function(response) {
					console.log("系统错误！")
				});
			}
		},next:function(page){	//下一页
			if(page>this.pages){
				layui.layer.msg("不存在下一页！")
			}else{
				this.$http.post("${PATH}/clothing/getClothingList",{
					condition:this.condition,
					ident:this.ident,
					keyword:this.keyword,
					page:page,
				}).then(function(response){
					console.log(response.body)
					//成功
					this.clothingList=response.body.records;
					this.pages=response.body.pages;
					this.current=response.body.current;
				},function(response) {
					console.log("系统错误！")
				});
			}
		},jumpToPage:function(page){
			this.$http.post("${PATH}/clothing/getClothingList",{
				condition:this.condition,
				ident:this.ident,
				keyword:this.keyword,
				page:page,
			}).then(function(response){
				//成功
				this.clothingList=response.body.records;
				this.pages=response.body.pages;
				this.current=response.body.current;
			},function(response) {
				console.log("系统错误！")
			});
		},getByCondition:function(kw){
			this.condition = kw
			this.$http.post("${PATH}/clothing/getClothingList",{
				condition:this.condition,
				ident:this.ident,
				keyword:this.keyword,
				page:this.current,
			}).then(function(response){
				//成功
				this.clothingList=response.body.records;
				this.pages=response.body.pages;
				this.current=response.body.current;
			},function(response) {
				console.log("系统错误！")
			});
		}
		
	}         		
});


</script>
</html>
