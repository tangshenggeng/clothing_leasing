package com.yj.classify.controller;


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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.yj.classify.beans.Classify;
import com.yj.classify.service.ClassifyService;
import com.yj.utils.AnalysisKeyWordsListUtils;
import com.yj.utils.Msg;
import com.yj.utils.UUIDUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 应建
 * @since 2019-12-22
 */
@Controller
@RequestMapping("/classify")
public class ClassifyController {

	@Autowired
	private ClassifyService classifySer;
	
	/**
	 * 修改分类
	 * */
	@RequestMapping(value="/editClassify",method=RequestMethod.POST)
	@ResponseBody
	public Msg editClassify(Classify clazz) {
		boolean b = classifySer.updateById(clazz);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delClassifyByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delClassifyByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = classifySer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	/**
	 * 批量隐藏
	 * */
	@RequestMapping(value="/hideClassifyByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg hideClassifyByIds(@RequestBody ArrayList<Integer> list) {
		List<Classify> cs = classifySer.selectBatchIds(list);
		cs.forEach(clazz -> clazz.setIsShow("隐藏"));
		boolean b = classifySer.updateBatchById(cs);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量展示
	 * */
	@RequestMapping(value="/showClassifyByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg showClassifyByIds(@RequestBody ArrayList<Integer> list) {
		List<Classify> cs = classifySer.selectBatchIds(list);
		cs.forEach(clazz -> clazz.setIsShow("展示"));
		boolean b = classifySer.updateBatchById(cs);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	/**
	 * 得到展示的分类
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getShowClassifyList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getShowClassifyList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String name = (String) afterMap.get("classifyName");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<Classify> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!name.equals("")) {
			wrapper.like("classify_name", name);
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		wrapper.eq("is_show","展示").orderBy("create_time", false);
		Page<Map<String, Object>> mapsPage = classifySer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有展示的分类");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到隐藏的分类
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getHideClassifyList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getHideClassifyList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String name = (String) afterMap.get("classifyName");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<Classify> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!name.equals("")) {
			wrapper.like("classify_name", name);
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		wrapper.eq("is_show","隐藏").orderBy("create_time", false);
		Page<Map<String, Object>> mapsPage = classifySer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有隐藏的分类");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 添加分类
	 * */
	@RequestMapping(value="/addClassify",method=RequestMethod.POST)
	@ResponseBody
	public Msg addClassify(Classify c) {
		c.setClassifyIdent(UUIDUtil.createUUID());
		boolean b = classifySer.insert(c);
		if(b) {
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg", "失败");
	}
	
	
	
	//===========页面跳转============
	///去往展示的分类页面
	@RequestMapping("/toShowClassifyPage")
	public String toShowClassifyPage() {
		return "/classify/show-classify";
	}
	///去往隐藏的分类页面
	@RequestMapping("/toHideClassifyPage")
	public String toHideClassifyPage() {
		return "/classify/hide-classify";
	}
	//去往添加页面
	@RequestMapping("/toAddClassifyPage")
	public String toAddClassifyPage() {
		return "/classify/add-classify";
	}
}

