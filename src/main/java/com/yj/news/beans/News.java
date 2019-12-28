package com.yj.news.beans;

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
 * @since 2019-12-28
 */
@TableName("tb_news")
public class News extends Model<News> {

    private static final long serialVersionUID = 1L;

    /**
     * 新闻发布
     */
    @TableId(value = "news_id", type = IdType.AUTO)
    private Integer newsId;
    /**
     * 新闻唯一标识
     */
    private String newsIdent;
    /**
     * 新闻标题
     */
    private String newsTitle;
    /**
     * 副标题
     */
    private String newsSubheading;
    /**
     * 封面图片
     */
    private String coverImg;
    /**
     * 新闻内容
     */
    private String newsText;
    /**
     * 是否展示
     */
    private String isShow;
    /**
     * 发布时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;
    
    

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsIdent() {
        return newsIdent;
    }

    public void setNewsIdent(String newsIdent) {
        this.newsIdent = newsIdent;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsSubheading() {
        return newsSubheading;
    }

    public void setNewsSubheading(String newsSubheading) {
        this.newsSubheading = newsSubheading;
    }

    public String getCoverImg() {
        return coverImg;
    }

    public void setCoverImg(String coverImg) {
        this.coverImg = coverImg;
    }

    public String getNewsText() {
        return newsText;
    }

    public void setNewsText(String newsText) {
        this.newsText = newsText;
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
        return this.newsId;
    }

	@Override
	public String toString() {
		return "News [newsId=" + newsId + ", newsIdent=" + newsIdent + ", newsTitle=" + newsTitle + ", newsSubheading="
				+ newsSubheading + ", coverImg=" + coverImg + ", newsText=" + newsText + ", isShow=" + isShow
				+ ", createTime=" + createTime + ", isDel=" + isDel + "]";
	}


    
}
