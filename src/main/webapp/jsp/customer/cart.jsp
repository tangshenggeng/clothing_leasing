<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>购物车</title>
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
      <%-- <link rel="stylesheet" href="${PATH}/static/layui/css/layui.css"> --%>
   </head>
   <style>

		input[type=number] {  
    -moz-appearance:textfield;  
}  
input[type=number]::-webkit-inner-spin-button,  
input[type=number]::-webkit-outer-spin-button {  
    -webkit-appearance: none;  
    margin: 0;  
}  
	
	
</style>
   <body>
      <div class="container">
          <%@ include file="/jsp/common/header.jsp"%>
         <div class="cart-page">
            <div class="breadcrumb-area">
               <ul>
                  <li><a href="index.html">首页</a></li>
                  <li><span>购物车</span></li>
               </ul>
            </div>
            <div class="row"  id="cartItems">
               <div class="col-12">
                  <form action="#">
                     <div class="table-content table-responsive">
                        <table class="table">
                           <thead>
                              <tr>
                                 <th>图片</th>
                                 <th>服装名</th>
                                 <th>价格 / 件</th>
                                 <th>数量</th>
                                 <th>小计</th>
                                 <th>操作</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr v-for="item in carts">
                                 <td class="product-thumbnail"><a :href="'${PATH}/clothing/toAddCartPage/'+item.cloIdent"><img :src="item.cloImg" alt=""></a></td>
                                 <td class="product-name"><a :href="'${PATH}/clothing/toAddCartPage/'+item.cloIdent">{{item.cloName}}</a></td>
                                 <td class="product-price"><span class="amount">{{item.cloPrice}} 元</span></td>
                                 <td class="product-quantity">
                                    <div class="cart-plus-minus">
                                       <input type="text" :value="item.cloNum">
                                       <div class="dec qtybutton" v-on:click="updateCloNum(item.cartId,--item.cloNum)">-</div>
                                       <div class="inc qtybutton" v-on:click="updateCloNum(item.cartId,++item.cloNum)">+</div>
                                    </div>
                                 </td>
                                 <td class="product-subtotal"><span class="amount">{{item.cloPrice * item.cloNum}} 元</span></td>
                                 <td class="product-remove"><a href="javascript:;" v-on:click="delCart(item.cartId)"><i class="far fa-trash-alt"></i></a></td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </form>
                  <div class="row">
                     <div class="col-lg-5 ml-auto">
                        <div class="cart-page-total">
                           <h2>购物车总计</h2>
                           <ul>
                              <li>总计 <span>{{getTotal.totalPrice}} 元</span></li>
                           </ul>
                           <a class="btn theme-btn" href="javascript:;" v-on:click="sumbitOrder(getTotal.cartIds,getTotal.totalPrice)">下单</a>
                        </div>
                     </div>
                  </div>              
               </div>
            </div>
         </div>
      </div>
      <%@ include file="/jsp/common/footer.jsp"%>
      <script src="${PATH}/static/layui/layui.all.js"></script>
      <!-- 模态框 -->
<div style="display: none;" id="writeAddrModal">
	<div class="layui-card">
		<div  style="margin: 20px 20px">
				<form id="orderInfo" class="form-horizontal">	
					<input type="hidden" id="cartIds" name="cartIds"/>
					<input type="hidden" value="${custId}" name="custId"/>
					<input type="hidden" id="totalPriceInput" name="totalPrice"/>
					<div class="form-group">
					    <label class="radio-inline">
						  <input type="radio" name="payWay" value="到付" checked="checked">货到付款
						</label>&nbsp;&nbsp;&nbsp;&nbsp;
					    <label class="radio-inline">
						  <input type="radio" name="payWay" value="微信"> 微信支付
						</label>&nbsp;&nbsp;&nbsp;&nbsp;
					    <label class="radio-inline">
						  <input type="radio" name="payWay" value="支付宝"> 支付宝
						</label>&nbsp;&nbsp;&nbsp;&nbsp;
					    <label class="radio-inline">
						  <input type="radio" name="payWay" value="银联"> 银联卡支付
						</label>&nbsp;&nbsp;&nbsp;&nbsp;
					  </div>
					
					<div class="form-group">
						<label for="myname" class="col-sm-2 control-label">收件人：</label>
						<input type="text" id="myname"  class="form-control" required="required" name="consignee">
					</div>
					<div class="form-group">
						<label for="myaddr" class="col-sm-2 control-label">详细地址：</label>
						<textarea class="form-control" id="myaddr" required="required" name="address" rows="3"></textarea>
					</div>
					<div class="form-group">
						<label  for="myphone" class="col-sm-2 control-label">手机：</label>
						<input type="number" id="myphone"  required="required" name="phone"  class="form-control">
					</div>
					<input type="button" class="btn btn-primary" id="sumbitOrderBtn"  value="提交" />
				</form>
		</div>
	</div>
</div>
   </body>
<script>
 	var custId = "${sessionScope.ident}"
	if(custId==""){
		layer.msg("请登录！",function(){
			window.location.href="${PATH}/customer/loginOut";
		});
	}
 	var error = "${error}"
	if(error!=""){
		layui.layer.msg(error,function(){
			window.location.href="${PATH}/customer/loginOut";
		})
	}
</script>
<script>
var cartItems = new Vue({
	 el:"#cartItems",
	 data:{
		 carts:[],
		 custId:"${custId}"
	 },created:function(){
		//购物车
		this.$http.get("${PATH}/cart/getMyCartsByShow/"+this.custId).then(function(response){
			console.log(response.body)
			//成功
			this.carts=response.body;
		},function(response) {
			//错误
			console.log("系统错误！")
		}); 
	 },computed:{
		 //获取总价和产品总件数
	    getTotal:function(){
	        //获取productList中select为true的数据。
	        var _proList=this.carts,
			        totalPrice=0, 
			        totalNum =0
			        cartIds = new Array();;
	        for(var i=0,len=_proList.length;i<len;i++){
	            //总价累加
	            totalPrice+=_proList[i].cloNum*_proList[i].cloPrice;
	            totalNum += _proList[i].cloNum
	            cartIds.push(_proList[i].cartId);
	        }
	        //选择产品的件数就是_proList.length，总价就是totalPrice
	        return {totalNum:totalNum,totalPrice:totalPrice,cartIds:cartIds}
	    }
	 },methods:{
		 delCart:function(cartId){
			$.ajax({
				url:"${PATH}/cart/delById/"+cartId,
				method:"get",
				success:function(res){
					if(res.code==100){
						layui.layer.msg(res.extend.msg,{icon:6},function(){
							location.reload()   
						})
					}else{
						layui.layer.msg(res.extend.msg,{icon:5})	
					}
				},error:function(){
					layui.layer.msg("系统错误")
				}
			});
		 },sumbitOrder:function(cartIds,totalPrice){	//提交订单
			 layui.use('layer' , function() {
				 var layer = layui.layer;
				 $("#cartIds").val(cartIds)
				 $("#totalPriceInput").val(totalPrice)
				 layui.layer.open({
					title : '确认订单',
					fix : true,
					resize : false,
					move : false,
					area : [ '800px', '500px' ],
					shadeClose : false,
					type : 1,
					content : $('#writeAddrModal'),
					cancel : function(index, layero) {
						$('#writeAddrModal').css("display", "none")
					}
				 })
			 })
		 },updateCloNum:function(cartId,num){
			 $.ajax({
				 url:"${PATH}/cart/updateNum/"+cartId+"/"+num,
				 method:"get",
			 });
			 
		 }
	 }
})
$("#sumbitOrderBtn").click(function(){
	 layui.use('layer' , function() {
		var layer = layui.layer;
		var name = $("#myname").val()
		var addr = $("#myaddr").val()
		var phone = $("#myphone").val()
		if(name==""||addr==""||phone==""){
			layer.msg("请正确填写信息！")
			return false;
		}
		var datas = $("#orderInfo").serialize() 		 
	 	$.ajax({
	 		url:"${PATH}/order/addOrderByCust",
	 		method:"POST",
	 		data:datas,
	 		success:function(res){
				if(res.code==100){
					layer.msg("正在支付中...请稍等!",{icon:6,time: 6*1000},function(){
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
