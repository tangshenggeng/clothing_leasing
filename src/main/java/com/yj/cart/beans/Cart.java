package com.yj.cart.beans;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author 应建
 * @since 2019-12-27
 */
@TableName("tb_cart")
public class Cart extends Model<Cart> {

    private static final long serialVersionUID = 1L;

    /**
     * 购物车id
     */
    @TableId(value = "cart_id", type = IdType.AUTO)
    private Integer cartId;
    /**
     * 客户id
     */
    private Integer custId;
    /**
     * 服装id
     */
    private Integer clothId;
    /**
     * 数量
     */
    private Integer clothNum;
    /**
     * 订单号（默认0是没有加入订单）
     */
    private String orderNum;


    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public Integer getClothId() {
        return clothId;
    }

    public void setClothId(Integer clothId) {
        this.clothId = clothId;
    }

    public Integer getClothNum() {
        return clothNum;
    }

    public void setClothNum(Integer clothNum) {
        this.clothNum = clothNum;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    @Override
    protected Serializable pkVal() {
        return this.cartId;
    }

    @Override
    public String toString() {
        return "Cart{" +
        ", cartId=" + cartId +
        ", custId=" + custId +
        ", clothId=" + clothId +
        ", clothNum=" + clothNum +
        ", orderNum=" + orderNum +
        "}";
    }
}
