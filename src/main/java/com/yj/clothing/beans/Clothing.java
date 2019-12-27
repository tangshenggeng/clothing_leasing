package com.yj.clothing.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
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
 * @since 2019-12-26
 */
@TableName("tb_clothing")
public class Clothing extends Model<Clothing> {

    private static final long serialVersionUID = 1L;

    /**
     * 服装的id
     */
    @TableId(value = "clothing_id", type = IdType.AUTO)
    private Integer clothingId;
    /**
     * 唯一标识
     */
    private String clothingIdent;
    /**
     * 名称
     */
    private String clothingName;
    /**
     * 服装的描述
     */
    private String clothingDescribe;
    /**
     * 服装的价格
     */
    private Float clothingPrice;
    /**
     * 服装的库存
     */
    private Integer clothingStock;
    /**
     * 图片1
     */
    private String clothingImgOne;
    /**
     * 图片2
     */
    private String clothingImgTwo;
    /**
     * 图片3
     */
    private String clothingImgThree;
    /**
     * 服装状态（展示or隐藏）
     */
    private String clothingState;
    /**
     * 所属分类的id
     */
    private Integer clothingClassifyId;
    /**
     * 被租用的次数
     */
    private Integer usageCount;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getClothingId() {
        return clothingId;
    }

    public void setClothingId(Integer clothingId) {
        this.clothingId = clothingId;
    }

    public String getClothingIdent() {
        return clothingIdent;
    }

    public void setClothingIdent(String clothingIdent) {
        this.clothingIdent = clothingIdent;
    }

    public String getClothingName() {
        return clothingName;
    }

    public void setClothingName(String clothingName) {
        this.clothingName = clothingName;
    }

    public String getClothingDescribe() {
        return clothingDescribe;
    }

    public void setClothingDescribe(String clothingDescribe) {
        this.clothingDescribe = clothingDescribe;
    }

    public Float getClothingPrice() {
        return clothingPrice;
    }

    public void setClothingPrice(Float clothingPrice) {
        this.clothingPrice = clothingPrice;
    }

    public Integer getClothingStock() {
        return clothingStock;
    }

    public void setClothingStock(Integer clothingStock) {
        this.clothingStock = clothingStock;
    }

    public String getClothingImgOne() {
        return clothingImgOne;
    }

    public void setClothingImgOne(String clothingImgOne) {
        this.clothingImgOne = clothingImgOne;
    }

    public String getClothingImgTwo() {
        return clothingImgTwo;
    }

    public void setClothingImgTwo(String clothingImgTwo) {
        this.clothingImgTwo = clothingImgTwo;
    }

    public String getClothingImgThree() {
        return clothingImgThree;
    }

    public void setClothingImgThree(String clothingImgThree) {
        this.clothingImgThree = clothingImgThree;
    }

    public String getClothingState() {
        return clothingState;
    }

    public void setClothingState(String clothingState) {
        this.clothingState = clothingState;
    }

    public Integer getClothingClassifyId() {
        return clothingClassifyId;
    }

    public void setClothingClassifyId(Integer clothingClassifyId) {
        this.clothingClassifyId = clothingClassifyId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.clothingId;
    }

	public Integer getUsageCount() {
		return usageCount;
	}

	public void setUsageCount(Integer usageCount) {
		this.usageCount = usageCount;
	}

	@Override
	public String toString() {
		return "Clothing [clothingId=" + clothingId + ", clothingIdent=" + clothingIdent + ", clothingName="
				+ clothingName + ", clothingDescribe=" + clothingDescribe + ", clothingPrice=" + clothingPrice
				+ ", clothingStock=" + clothingStock + ", clothingImgOne=" + clothingImgOne + ", clothingImgTwo="
				+ clothingImgTwo + ", clothingImgThree=" + clothingImgThree + ", clothingState=" + clothingState
				+ ", clothingClassifyId=" + clothingClassifyId + ", usageCount=" + usageCount + ", createTime="
				+ createTime + ", isDel=" + isDel + "]";
	}

   
}
