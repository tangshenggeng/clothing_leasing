package com.yj.news.controller;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.yj.news.beans.News;
import com.yj.news.service.NewsService;
import com.yj.utils.AnalysisKeyWordsListUtils;
import com.yj.utils.ConstantUtils;
import com.yj.utils.Msg;
import com.yj.utils.UUIDUtil;
import com.yj.utils.UploadFileUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 应建
 * @since 2019-12-28
 */
@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewsService newsSer;
	
	/**
	 * 批量隐藏
	 * */
	@RequestMapping(value="/hideNewsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg hideNewsByIds(@RequestBody ArrayList<Integer> list) {
		List<News> cs = newsSer.selectBatchIds(list);
		cs.forEach(news -> news.setIsShow("隐藏"));
		boolean b = newsSer.updateBatchById(cs);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量展示
	 * */
	@RequestMapping(value="/showNewsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg showClothingByIds(@RequestBody ArrayList<Integer> list) {
		List<News> cs = newsSer.selectBatchIds(list);
		cs.forEach(news -> news.setIsShow("展示"));
		boolean b = newsSer.updateBatchById(cs);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delNewsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delNewsByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = newsSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	
	/**
	 * 得到展示的新闻
	 * @return 
	 * @throws ParseException 
	 * */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/getShowNewsList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getShowNewsList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String newsKeyworlds = (String) afterMap.get("newsKeyworlds");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<News> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!newsKeyworlds.equals("")) {
			wrapper.like("news_title", newsKeyworlds).or().like("news_subheading", newsKeyworlds);
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		wrapper.eq("is_show","展示").orderBy("news_id", false);
		Page<Map<String, Object>> mapsPage = newsSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有展示的新闻");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到隐藏的新闻
	 * @return 
	 * @throws ParseException 
	 * */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/getHideNewsList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getHideNewsList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String newsKeyworlds = (String) afterMap.get("newsKeyworlds");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<News> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!newsKeyworlds.equals("")) {
			wrapper.like("news_title", newsKeyworlds).or().like("news_subheading", newsKeyworlds);
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		wrapper.eq("is_show","隐藏").orderBy("news_id", false);
		Page<Map<String, Object>> mapsPage = newsSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有隐藏的新闻");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 前台展示
	 * @return 
	 * */
	@RequestMapping("/getNewsByIndex")
	@ResponseBody
	public List<News> getNewsByIndex() {
		List<News> list = newsSer.selectList(new EntityWrapper<News>().eq("is_show","展示").orderBy("news_id", false).last("LIMIT 3"));
		return list;
	}
	
	/**
	 * 阅读新闻
	 * */
	@RequestMapping("/getByNewsIdent/{ident}")
	public String getByNewsIdent(@PathVariable("ident")String ident,Model model) {
		News selectOne = newsSer.selectOne(new EntityWrapper<News>().eq("is_show","展示").eq("news_ident",ident));
		if(selectOne==null) {
			model.addAttribute("error","未找到新闻？刷新试试？");
			return "forward:/jsp/news/read-news.jsp";
		}
		model.addAttribute("news",selectOne);
		return "forward:/jsp/news/read-news.jsp";
	}
	
	/**
	 * 新闻列表
	 * */
	@RequestMapping(value="/getNewsListByShow",method=RequestMethod.POST)
	@ResponseBody
	public Page<Map<String, Object>> getNewsListByShow(@RequestBody Map<String,Object> map) {
		EntityWrapper<News> wrapper = new EntityWrapper<>();
		String keyword = (String) map.get("keyword");
		Integer page = (Integer) map.get("page");
		Integer limit = 6;
		if(!(keyword.equals("")||keyword.equals("all"))) {
			wrapper.like("news_title", keyword).or().like("news_subheading",keyword);
		}
		wrapper.eq("is_show","展示").orderBy("news_id", false);
		Page<Map<String, Object>> mapsPage = newsSer.selectMapsPage(new Page<>(page, limit), wrapper);
		return mapsPage;
	}
	
	/**
	 * 发布新闻
	 * */
	@RequestMapping(value="/addNews",method=RequestMethod.POST)
	@ResponseBody
	public Msg addNews(@RequestBody Map<String,Object> map) {
		String text = (String) map.get("text");
		String title = (String) map.get("title");
		String coverImg = (String) map.get("coverImg");
		String subheading = (String) map.get("subheading");
		String state = (String) map.get("state");
		News news = new News();
		news.setCoverImg(coverImg);
		news.setIsShow(state);
		news.setNewsIdent(UUIDUtil.createUUID());
		news.setNewsSubheading(subheading);
		news.setNewsText(text);
		news.setNewsTitle(title);
		boolean b = newsSer.insert(news);
		if(b) {
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg", "失败");
	}
	
	
	//===========页面跳转=================
	/**
	 * 上传展示图片
	 * @return 
	 * */
	@RequestMapping(value="/uploadCoverImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadSubheadingImg(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		UploadFileUtil util = new UploadFileUtil();
		String result = util.uploadImgFile(file, ConstantUtils.NEWS_COVER_IMG);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String technician = "/file/news/coverImgs/"+result;
		resultMap.put("errno", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", technician);
		return resultMap;
	}
	/**
	 * 上传图片(介绍时)
	 * @return 
	 * */
	@RequestMapping(value="/uploadTextImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> introduceImg(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		UploadFileUtil util = new UploadFileUtil();
		String result = util.uploadImgFile(file, ConstantUtils.NEWS_TEXT_IMG);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String technician = "/file/news/textImgs/"+result;
		resultMap.put("errno", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", technician);
		return resultMap;
	}
	//去往发布新闻页面
	@RequestMapping("/toAddNewsPage")
	public String toAddNewsPage() {
		return "/news/add-news";
	}
	//去往展示新闻页面
	@RequestMapping("/toShowNewsPage")
	public String toShowNewsPage() {
		return "/news/show-news";
	}
	//去往隐藏新闻页面
	@RequestMapping("/toHideNewsPage")
	public String toHideNewsPage() {
		return "/news/hide-news";
	}
}

