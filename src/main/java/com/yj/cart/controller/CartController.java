package com.yj.cart.controller;


import java.util.ArrayList;
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
import com.yj.cart.beans.Cart;
import com.yj.cart.service.CartService;
import com.yj.clothing.beans.Clothing;
import com.yj.clothing.service.ClothingService;
import com.yj.customer.beans.Customer;
import com.yj.customer.service.CustomerService;
import com.yj.utils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 应建
 * @since 2019-12-27
 */
@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartSer;
	
	@Autowired
	private CustomerService custSer;
	
	@Autowired
	private ClothingService cloSer;
	
	/**
	 * 更新数量
	 * */
	@RequestMapping("/updateNum/{cartId}/{num}")
	@ResponseBody
	public void updateNum(@PathVariable("cartId")Integer cartId,@PathVariable("num")Integer num) {
		Cart cart = cartSer.selectById(cartId);
		cart.setClothNum(num);
		cartSer.updateById(cart);
	}
	
	/**
	 * 删除
	 * */
	@RequestMapping("/delById/{id}")
	@ResponseBody
	public Msg delById(@PathVariable("id")Integer id) {
		boolean b = cartSer.deleteById(id);
		if(b) {
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg", "失败");
	}
	
	/**
	 * 展示我的购物车
	 * @return 
	 * */
	@RequestMapping("/getMyCartsByShow/{id}")
	@ResponseBody
	public List<Map<String, Object>> getMyCartsByShow(@PathVariable("id")Integer custId) {
		List<Cart> cartList = cartSer.selectList(new EntityWrapper<Cart>().eq("cust_id", custId).eq("order_num", "0").orderBy("cart_id", false));
		List<Map<String, Object>> list = new ArrayList<>();
		for (Cart cart : cartList) {
			Map<String, Object> map = new HashMap<>();
			Clothing clo = cloSer.selectById(cart.getClothId());
			map.put("cartId", cart.getCartId());
			map.put("cloNum", cart.getClothNum());
			map.put("cloImg", clo.getClothingImgOne());
			map.put("cloIdent", clo.getClothingIdent());
			map.put("cloName",clo.getClothingName());
			map.put("cloPrice", clo.getClothingPrice());
			list.add(map);
		}
		return list;
	}
	
	/**
	 * 加入购物车
	 * */
	@RequestMapping(value="/addCartByCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg addCartByCust(@RequestBody Map<String,Object> map) {
		String custIdent = (String) map.get("custId");
		Customer cust = custSer.selectOne(new EntityWrapper<Customer>().eq("cust_ident", custIdent));
		if(cust==null) {
			return Msg.fail().add("msg", "用户不存在！");
		}
		String cloId = (String) map.get("cloId");
		String count = (String) map.get("count");
		Integer clothId = Integer.parseInt(cloId);
		Integer clothNum = Integer.parseInt(count);
		
		Cart cart = new Cart();
		cart.setClothId(clothId);;
		cart.setClothNum(clothNum);
		cart.setOrderNum("0");
		cart.setCustId(cust.getId());
		boolean b = cartSer.insert(cart);
		if(b) {
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg", "失败");
	}
	//===========================页面跳转===================================
	//去往我的购物车页面
	@RequestMapping("/getMyCart/{ident}")
	public String getMyCart(@PathVariable("ident")String ident,Model model) {
		Customer cust = custSer.selectOne(new EntityWrapper<Customer>().eq("cust_ident", ident));
		if(cust==null) {
			model.addAttribute("error","登录超时或客户不存在！");
			return "forward:/jsp/customer/cart.jsp";
		}
		model.addAttribute("custId",cust.getId());
		return "forward:/jsp/customer/cart.jsp";
	}
}

