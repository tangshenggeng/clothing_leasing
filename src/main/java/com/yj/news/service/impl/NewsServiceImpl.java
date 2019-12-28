package com.yj.news.service.impl;

import com.yj.news.beans.News;
import com.yj.news.mapper.NewsMapper;
import com.yj.news.service.NewsService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 应建
 * @since 2019-12-28
 */
@Service
public class NewsServiceImpl extends ServiceImpl<NewsMapper, News> implements NewsService {

}
