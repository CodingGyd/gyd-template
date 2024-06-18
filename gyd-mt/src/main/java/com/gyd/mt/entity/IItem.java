package com.gyd.mt.entity;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.gyd.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * I茅台预约商品对象 i_item
 */
@ApiModel("I茅台预约商品对象")
@Data
@TableName("i_item")
public class IItem  {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(name = "id")
    @TableId
    private Long itemId;

    /**
     * 商品code
     */
    private String itemCode;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

    /**
     * 图片
     */
    private String picture;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    public IItem() {
    }

    public IItem(JSONObject item) {
        this.itemCode = item.getString("itemCode");
        this.title =  item.getString("title");;
        this.content =  item.getString("content");;
        this.picture =  item.getString("picture");;
        this.createTime = new Date();
    }
}
