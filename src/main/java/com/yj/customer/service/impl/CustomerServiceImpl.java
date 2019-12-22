package com.yj.customer.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.yj.customer.beans.Customer;
import com.yj.customer.mapper.CustomerMapper;
import com.yj.customer.service.CustomerService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 应建
 * @since 2019-12-12
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements CustomerService {

}
