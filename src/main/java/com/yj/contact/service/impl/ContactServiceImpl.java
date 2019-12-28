package com.yj.contact.service.impl;

import com.yj.contact.beans.Contact;
import com.yj.contact.mapper.ContactMapper;
import com.yj.contact.service.ContactService;
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
public class ContactServiceImpl extends ServiceImpl<ContactMapper, Contact> implements ContactService {

}
