package com.yj.cart.service.impl;

import com.yj.cart.beans.Cart;
import com.yj.cart.mapper.CartMapper;
import com.yj.cart.service.CartService;
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
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {

}
