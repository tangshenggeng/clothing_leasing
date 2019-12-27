<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>加入购物车</title>
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
         </div>
         
         <div class="shop-detail" style="padding-left: 50px">
            <div class="breadcrumb-area">
               <ul>
                  <li><a href="${PATH}/jsp/index.jsp">主页</a></li>
                  <li><span>购物车</span></li>
               </ul>
            </div>
            <div class="row">
               <div class="col-xl-5 col-lg-5 col-12">
                  <div class="product-detail-img">
                     <div class="large-image">
                        <div class="tab-content" id="myTabContent-1">
                           <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab-1">
                              <img src="${clo.clothingImgOne}" alt="image">
                           </div>
                           <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab-2">
                              <img src="${clo.clothingImgTwo}" alt="image">
                           </div>
                           <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab-3">
                              <img src="${clo.clothingImgThree}" alt="image">
                           </div>
                        </div>
                     </div>
                     <div class="thumb-img-tabs">
                        <ul class="nav nav-tabs" id="myTab1" role="tablist">
                           <li class="nav-item">
                              <a class="nav-link active" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true"><img src="${clo.clothingImgOne}" alt="Product image"></a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><img src="${clo.clothingImgTwo}" alt="Product image"></a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" id="tab-3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false"><img src="${clo.clothingImgThree}" alt="Product image"></a>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="col-xl-7 col-lg-7 col-12">
                  <div class="product-detail-content">
                     <div class="title">
                        <h1>${clo.clothingName}</h1>
                     </div>
                     <div class="rating">
                        
                     </div>
                     <div class="price">￥ ${clo.clothingPrice }
                     </div>
                     <div class="desc">
                        <p>${clo.clothingDescribe}</p>
                     </div>
                     <div class="attribute">
                        <p><span>编号:</span>${clo.clothingIdent }</p>
                        <p><span>库存:</span><span class="instock">${clo.clothingStock }</span></p>
                     </div>
                     <div class="quantity">
                        <label>数量:</label>                      
                        <div class="cart-plus-minus">
                           <input type="text" id="clotingCount" value="50">
                           <div class="dec qtybutton">-</div>
                           <div class="inc qtybutton">+</div>
                        </div>
                     </div>
                     <div class="cart-options">
                        <form class="cart-form">
                           <button type="button" id="addCartBtn" class="btn theme-btn">加入购物车</button>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
      </div>
      <%@ include file="/jsp/common/footer.jsp"%>
      <script src="${PATH}/static/layui/layui.all.js"></script>
   </body>
<script>
$("#addCartBtn").click(function(){
	layui.use( 'layer', function() {
		var layer = layui.layer;
		var custId = "${sessionScope.ident}"
		if(custId==""){
			layer.msg("请登录！",function(){
				window.location.href="${PATH}/customer/loginOut";
			});
		}
		var cloId = "${clo.clothingId}"
		var count = $("#clotingCount").val()
		if(count==""||count==0){
			layer.msg("请输入数量！");
			return false;
		}
		$.ajax({
			url:"${PATH}/cart/addCartByCust",
			method:"post",
			contentType: "application/json",//必须指定，否则会报415错误
	        dataType : 'json',
			data:JSON.stringify({
				custId:custId,cloId:cloId,count:count
			}),
			success:function(res){
				if(res.code==100){
					layer.msg(res.extend.msg,{icon:6},function(){
						location.reload()
					})
				}else{
					layer.msg(res.extend.msg,{icon:5})	
				}
			},error:function(){
				layer.msg("系统错误")
			}
		});
	})
});
</script>
</html>
