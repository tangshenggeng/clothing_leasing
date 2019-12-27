package com.yj.order.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.yj.cart.beans.Cart;
import com.yj.cart.service.CartService;
import com.yj.clothing.beans.Clothing;
import com.yj.clothing.service.ClothingService;
import com.yj.customer.beans.Customer;
import com.yj.customer.service.CustomerService;
import com.yj.order.beans.Order;
import com.yj.order.service.OrderService;
import com.yj.utils.AnalysisKeyWordsListUtils;
import com.yj.utils.Msg;
import com.yj.utils.UUIDUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 应建
 * @since 2019-12-27
 */
@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderSer;
	
	@Autowired
	private CustomerService custSer;
	
	@Autowired	
	private CartService cartSer;

	@Autowired
	private ClothingService cloSer;
	/**
	 * 填写快递信息
	 * */
	@RequestMapping(value="/writeExpressInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg writeExpressInfo(Order order) {
		List<Integer> list = analysisString(order.getCartIds());
		List<Order> orders = orderSer.selectBatchIds(list);
		for (Order o : orders) {
			o.setExpressCom(order.getExpressCom());
			o.setExpressNum(order.getExpressNum());
			o.setOrderState("已发货");
		}
		boolean b = orderSer.updateBatchById(orders);
		if(b) {
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg", "失败");
	}
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delOrderByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delOrderByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = orderSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	/**
	 * 得到展示的服装
	 * @return 
	 * @throws ParseException 
	 * */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/getBeforeSendList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getBeforeSendList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String orderNum = (String) afterMap.get("orderNum");
		String keyword = (String) afterMap.get("keyword");
		String payway = (String) afterMap.get("payway");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!orderNum.equals("")) {
			wrapper.eq("order_num", orderNum);
		}
		if(!payway.equals("0")) {
			wrapper.eq("pay_way", payway);
		}
		
		if(!keyword.equals("")) {
			wrapper.like("consignee", keyword).or().like("address",keyword).or().like("phone",keyword);
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		wrapper.eq("order_state","待发货").orderBy("order_id", false);
		Page<Map<String, Object>> mapsPage = orderSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有待发货的订单");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 查看订单的服装信息
	 * */
	@RequestMapping(value="/getByOrderNum/{orderNum}")
	@ResponseBody
	public Map<String, String> getByOrderNum(@PathVariable("orderNum")String orderNum) {
		Map<String,String> map = new HashMap<>();
		List<Cart> list = cartSer.selectList(new EntityWrapper<Cart>().eq("order_num", orderNum));
		String cloName = "";
		for (Cart cart : list) {
			Clothing clothing = cloSer.selectById(cart.getClothId());
			cloName += clothing.getClothingName()+"&nbsp;&nbsp;&nbsp;&nbsp;，";
		}
		map.put("cloName",cloName);
		return map;
	}
	
	/**
	 * 修改地址
	 * */
	@RequestMapping(value="/modifyOrderInfoByCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg modifyAddrByCust(Order o) {
		Order order = orderSer.selectOne(new EntityWrapper<Order>().eq("order_num", o.getOrderNum()).eq("order_state", "待发货"));
		if(order==null) {
			return Msg.fail().add("msg", "订单不存在或状态不符");
		}
		order.setAddress(o.getAddress());
		order.setConsignee(o.getConsignee());
		order.setPhone(o.getPhone());
		boolean b = orderSer.updateById(order);
		if(b) {
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg", "失败");
	}
	
	/**
	 * 获取我的订单
	 * @return 
	 * */
	@RequestMapping("/getMyOrdersByShow/{custId}")
	@ResponseBody
	public List<Order> getMyOrdersByShow(@PathVariable("custId")Integer custId) {
		List<Order> orders = orderSer.selectList(new EntityWrapper<Order>().ne("order_state", "完成").eq("cust_id", custId).orderBy("order_id", false));
		return orders;
	}
	
	
	/**
	 *提交订单
	 * */
	@RequestMapping(value="/addOrderByCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg addOrderByCust(Order order) {
		if(order.getCartIds().isEmpty()) {
			return Msg.fail().add("msg", "购物车为空！");	
		}
		String orderNum = UUIDUtil.createUUID();	//订单号
		
		List<Integer> cartIds = analysisString(order.getCartIds());		//解析cartIds
		List<Cart> carts = cartSer.selectBatchIds(cartIds);
		for (Cart cart : carts) {
			cart.setOrderNum(orderNum);		//转换成订单条目
			Integer saleCount = cart.getClothNum(); //购买量
			Clothing clo = cloSer.selectById(cart.getClothId());
			Integer stock = clo.getClothingStock();		//获取库存
			if(stock-saleCount<0) {
				return Msg.fail().add("msg", clo.getClothingName()+"库存只有"+clo.getClothingStock()+"!");	
			}
			clo.setClothingStock(stock-saleCount);
			clo.setUsageCount(clo.getUsageCount()+1);
			cloSer.updateById(clo);
		}
		cartSer.updateBatchById(carts);
		order.setOrderNum(orderNum);
		order.setOrderState("待发货");
		boolean b = orderSer.insert(order);
		if(b) {
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg", "失败");	
	}
	
	//==================页面跳转==========================
	//解析传过来的ids
	private List<Integer> analysisString(String cartIds) {
		List<Integer> list = new ArrayList<Integer>();
		String[] split = cartIds.split(",");
		for (int i = 0; i < split.length; i++) {
			int cartId = Integer.parseInt(split[i]);
			list.add(cartId);
		}
		return list;
	}
	//我的订单
	@RequestMapping("/getMyOrders/{ident}")
	public String getMyOrders(@PathVariable("ident")String ident,Model model) {
		Customer cust = custSer.selectOne(new EntityWrapper<Customer>().eq("cust_ident", ident));
		if(cust==null) {
			model.addAttribute("error","登录超时或客户不存在！");
			return "forward:/jsp/customer/orders.jsp";
		}
		model.addAttribute("custId",cust.getId());
		return "forward:/jsp/customer/orders.jsp";
	}
	//去往待发货页面
	@RequestMapping("/toBeforeSendOrderPage")
	public String toBeforeSendOrderPage() {
		return "/orders/before-list";
	}
}

