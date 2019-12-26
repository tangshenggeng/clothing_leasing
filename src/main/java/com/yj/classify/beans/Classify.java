package com.yj.classify.beans;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
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
 * @since 2019-12-26
 */
@TableName("tb_classify")
public class Classify extends Model<Classify> {

    private static final long serialVersionUID = 1L;

    /**
     * 分类id
     */
    @TableId(value = "classify_id", type = IdType.AUTO)
    private Integer classifyId;
    /**
     * 分类唯一标识
     */
    private String classifyIdent;
    /**
     * 分类名称
     */
    private String classifyName;
    /**
     * 分类权重
     */
    private Integer classifyWeight;
    /**
     * 是否展示
     */
    private String isShow;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 是否删除
     */
    private Integer isDel;


    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }

    public String getClassifyIdent() {
        return classifyIdent;
    }

    public void setClassifyIdent(String classifyIdent) {
        this.classifyIdent = classifyIdent;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public Integer getClassifyWeight() {
        return classifyWeight;
    }

    public void setClassifyWeight(Integer classifyWeight) {
        this.classifyWeight = classifyWeight;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
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
        return this.classifyId;
    }

    @Override
    public String toString() {
        return "Classify{" +
        ", classifyId=" + classifyId +
        ", classifyIdent=" + classifyIdent +
        ", classifyName=" + classifyName +
        ", classifyWeight=" + classifyWeight +
        ", isShow=" + isShow +
        ", createTime=" + createTime +
        ", isDel=" + isDel +
        "}";
    }
}
