<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layui-header" >
    <div class="layui-logo"><img src="${PATH}/jsp/logo.png" class="layui-nav-img"></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="${PATH}/admin/index"><span style="color: white;font-family: monospace;">首页</span></a></li>
      <!-- <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li> -->
      <li class="layui-nav-item">
        <a href="javascript:;"><i class="layui-icon layui-icon-group"></i> 客户管理</a>
        <dl class="layui-nav-child">
          <dd><a href="${PATH}/customer/toAddCustPage">添加客户</a></dd>
          <dd><a href="${PATH}/customer/toNormalCustPage">正常顾客</a></dd>
          <dd><a href="${PATH}/customer/toAbnormalCustPage">异常顾客</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;"><i class="layui-icon layui-icon-list"></i> 分类管理</a>
        <dl class="layui-nav-child">
          <dd><a href="${PATH}/classify/toAddClassifyPage">添加分类</a></dd>
          <dd><a href="${PATH}/classify/toShowClassifyPage">展示的分类</a></dd>
          <dd><a href="${PATH}/classify/toHideClassifyPage">隐藏的分类</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;"><i class="layui-icon layui-icon-chart-screen"></i> 服装管理</a>
        <dl class="layui-nav-child">
          <dd><a href="${PATH}/clothing/toAddClothingPage">添加服装</a></dd>
          <dd><a href="${PATH}/clothing/toShowClothingPage">展示的服装</a></dd>
          <dd><a href="${PATH}/clothing/toHideClothingPage">隐藏的服装</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;"><i class="layui-icon layui-icon-tabs"></i> 订单管理</a>
        <dl class="layui-nav-child">
          <dd><a href="${PATH}/order/toBeforeSendOrderPage">待发货</a></dd>
          <dd><a href="${PATH}/order/toAfterSendOrderPage">已发货</a></dd>
          <dd><a href="${PATH}/order/toConfirmOrderPage">确认收货</a></dd>
          <dd><a href="${PATH}/order/toGiveBackOrderPage">返还中</a></dd>
          <dd><a href="${PATH}/order/toCompleteOrderPage">完成</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;"><i class="layui-icon layui-icon-log"></i> 新闻管理</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          ${sessionScope.admin}
        </a>
        <dl class="layui-nav-child">
          <!-- <dd><a href="#">基本资料</a></dd>
          <dd><a href="#">安全设置</a></dd> -->
          <dd><a href="${PATH}/admin/loginOut">退出登录</a></dd>
        </dl>
      </li>
      <!-- <li class="layui-nav-item"><a href="">退了</a></li> -->
    </ul>
    <script type="text/javascript">
    	var admin = "${sessionScope.admin}"
    	if(admin==""){
    		alert("登录超时！请重新登录")
    		window.location.href="${PATH}/admin/loginOut";
    	}
    </script>
  </div>