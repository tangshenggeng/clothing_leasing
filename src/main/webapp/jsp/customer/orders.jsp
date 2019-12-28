<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<!DOCTYPE html>
<html class="no-js">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>我的订单</title>
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
                  <li><span>订单中心</span></li>
               </ul>
            </div>
            <div class="row"  id="myOrders">
               <div class="col-12">
                  <form >
                     <div class="table-content table-responsive">
                        <table class="table">
                           <thead>
                              <tr>
                                 <th>订单号</th>
                                 <th>总价</th>
                                 <th>支付方式</th>
                                 <th>收货人</th>
                                 <th>收货地址</th>
                                 <th>联系方式</th>
                                 <th>状态</th>
                                 <th>下单时间</th>
                                 <th>操作</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr v-for="item in orders">
                                 <td class="product-thumbnail">{{item.orderNum}}</td>
                                 <td class="product-price"><span class="amount">{{item.totalPrice}} 元</span></td>
                                 <td class="product-name">{{item.payWay}}</td>
                                 <td class="product-quantity">
                                    {{item.consignee}}
                                 </td>
                                 <td class="product-subtotal"  style="width: 200px"><span class="amount"> {{item.address}}</span></td>
                                 <td class="product-name">{{item.phone}}</td>
                                 <td class="product-name" style="color: orange;">{{item.orderState}}</td>
                                 <td class="product-name">{{item.createTime | moment}}</td>
                                 <td class="product-remove">
                                 	<a v-if="item.orderState==='待发货'||item.orderState==='确认收货'||item.orderState==='返还中'" href="javascript:;"  v-on:click="urgeDeliver(item.orderNum)">查看</a>
                                 	<a v-if="item.orderState==='待发货'" href="javascript:;"  v-on:click="modifyAddr(item)" >修改</a>
                                 	<a v-if="item.orderState==='已发货'" href="javascript:;"  v-on:click="lookExpress(item.expressCom,item.expressNum)">查看物流</a>
									<a v-if="item.orderState==='已发货'" href="javascript:;"  v-on:click="confirmGet(item.orderNum)">确认收货</a>
									<a v-if="item.orderState==='确认收货'" href="javascript:;"  v-on:click="giveBack(item.orderNum)" >返还</a>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <%@ include file="/jsp/common/footer.jsp"%>
     <script src="${PATH}/static/js/comment.js"></script>
<script src="${PATH}/static/layui/layui.all.js"></script>
      <!-- 模态框 -->
<div style="display: none;" id="modifyOrderInfoModel">
	<div  style="margin: 20px 20px">
		<form id="orderInfoModifyForm" class="form-horizontal">	
			<input type="hidden" id="modifyOrderNum"  name="orderNum"/>
			<div class="form-group">
				<label for="modifyConsignee">收货人：</label>
				<input type="text" name="consignee" class="form-control" id="modifyConsignee" placeholder="请输入" required="required">
			</div>
			<div class="form-group">
				<label for="modifyPhone">联系方式：</label>
				<input type="number" name="phone"  class="form-control" id="modifyPhone" placeholder="请输入" required="required">
			</div>
			<div class="form-group">
				<label>修改地址：</label>
				<textarea class="site_area" id="orderAddrInput" required="required" name="address"></textarea>
			</div>
			<input type="button" id="sumbitModifyOrderBtn"  value="修改" class="btn btn-primary btn-sm">
		</form>
	</div>
</div>
<div style="display: none;" id="lookCloInfoModel">
	<div  style="margin: 20px 20px">
		<div class="panel panel-default">
			  <div class="panel-body" id="cloInfoDiv">
			    
			  </div>
			</div>
	</div>
</div>
<div style="display: none;" id="writeAddrModal">
	<div class="layui-card">
		<div  style="margin: 20px 20px">
			<div class="site_con">
				<div class="form_group">
					<label>物流公司：</label>
					<input type="text" id="expressComInput" readonly="readonly">
				</div>
				<div class="form_group">
					<label>物流订单号：</label>
					<input type="text" id="expressNumInput"  readonly="readonly">
				</div>
			</div>
		</div>
	</div>
</div>
<div style="display: none;" id="giveBackComModel">
	<div class="layui-card">
			<div style="margin: 20px 20px">
				<form  class="form-horizontal" id="giveBackForm">
					<input type="hidden" id="giveBackOrderNum" name="orderNum"/>
					<div class="form-group">
						<label  for="giveBackExpressCom">物流公司：</label> 
						<input class="form-control" name="expressCom" id="giveBackExpressCom" type="text" >
					</div>
					<div class="form-group">
						<label for="giveBackExpressNum">物流订单号：</label> 
						<input class="form-control" name="expressNum" id="giveBackExpressNum"  type="text" >
					</div>
					<div class="form-group">
						<label >备注：</label> 
						<textarea name="returnReason" class="form-control" placeholder="备注信息（可不填，请原路寄回）" rows="3"></textarea>
					</div>
					<input type="button" id="sumbitGiveBackBtn"  value="确认" class="btn btn-primary btn-sm">
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
var myOrders = new	Vue({
	el:"#myOrders",
	data:{
		orders:[],
		custId:"${custId}"
	},created:function(){
		//购物车
		this.$http.get("${PATH}/order/getMyOrdersByShow/"+this.custId).then(function(response){
			console.log(response.body)
			//成功
			this.orders=response.body;
		},function(response) {
			//错误
			console.log("系统错误！")
		}); 
	},methods:{
		urgeDeliver:function(orderNum){		//查看
			console.log(orderNum)
			$.ajax({
				url:"${PATH}/order/getByOrderNum/"+orderNum,
				method:"get",
				success:function(res){
					console.log(res)
					$("#cloInfoDiv").html(res.cloName)
				}
			});
			layui.layer.open({
				title : '查看服装信息',
				fix : true,
				resize : false,
				move : false,
				area : [ '600px', '230px' ],
				shadeClose : false,
				type : 1,
				anim: 5,
				content : $('#lookCloInfoModel'),
				cancel : function(index, layero) {
					$('#lookCloInfoModel').css("display", "none")
				}
			 })
		},
		lookExpress:function(com,num){	//查看物流
			$("#expressComInput").val(com)
			$("#expressNumInput").val(num)
			layui.layer.open({
				title : '查看物流',
				fix : true,
				resize : false,
				move : false,
				area : [ '600px', '300px' ],
				shadeClose : false,
				type : 1,
				anim: 5,
				content : $('#writeAddrModal'),
				cancel : function(index, layero) {
					$('#writeAddrModal').css("display", "none")
				}
			 })
		},confirmGet:function(orderNum){	//确认收货
			layer.confirm('确认收货吗?', {icon: 3, title:'提示'}, function(index){
				$.ajax({
					url:"${PATH}/order/confirmGetByCust/"+orderNum,
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
			  layer.close(index);
			});
		},modifyAddr:function(item){	//修改地址
			$("#modifyOrderNum").val(item.orderNum)
			$("#orderAddrInput").val(item.address)
			$("#modifyConsignee").val(item.consignee)
			$("#modifyPhone").val(item.phone)
			layui.layer.open({
				title : '修改地址',
				fix : true,
				resize : false,
				move : false,
				area : [ '800px', '500px' ],
				shadeClose : false,
				type : 1,
				anim: 3,
				content : $('#modifyOrderInfoModel'),
				cancel : function(index, layero) {
					$('#modifyOrderInfoModel').css("display", "none")
				}
			 })
		},giveBack:function(orderNum){		//返还
			$("#giveBackOrderNum").val(orderNum)
			layui.layer.open({
				title : '返还服装',
				fix : true,
				resize : false,
				move : false,
				area : [ '800px', '500px' ],
				shadeClose : false,
				type : 1,
				anim: 3,
				content : $('#giveBackComModel'),
				cancel : function(index, layero) {
					$('#giveBackComModel').css("display", "none")
				}
			 })
		}
		
	}
});
Vue.filter('moment', function (value, formatString) {
    formatString = formatString || 'YYYY-MM-DD HH:mm:ss';
    return moment(value).format(formatString);
});
//修改地址
$("#sumbitModifyOrderBtn").click(function(){
	layui.use('layer' , function() {
		var layer = layui.layer;
		var name = $("#orderAddrInput").val()
		var consignee = $("#modifyConsignee").val()
		var phone = $("#modifyPhone").val()
		if(name==""||consignee==""||phone==""){
			layer.msg("请正确填写信息！")
			return false;
		}
		var datas = $("#orderInfoModifyForm").serialize() 		 
	 	$.ajax({
	 		url:"${PATH}/order/modifyOrderInfoByCust",
	 		method:"POST",
	 		data:datas,
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
//修改地址
$("#sumbitGiveBackBtn").click(function(){
	layui.use('layer' , function() {
		var layer = layui.layer;
		var name = $("#giveBackExpressCom").val()
		var consignee = $("#giveBackExpressNum").val()
		if(name==""||consignee==""){
			layer.msg("请正确填写物流信息！")
			return false;
		}
		var datas = $("#giveBackForm").serialize() 		 
	 	$.ajax({
	 		url:"${PATH}/order/giveBackByCust",
	 		method:"POST",
	 		data:datas,
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
