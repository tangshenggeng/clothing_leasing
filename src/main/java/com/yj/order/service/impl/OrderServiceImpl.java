package com.yj.order.service.impl;

import com.yj.order.beans.Order;
import com.yj.order.mapper.OrderMapper;
import com.yj.order.service.OrderService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 应建
 * @since 2019-12-27
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

}
