package com.gydblog.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.gydblog.common.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 数据源表sys_datasource
 *
 * @author guoyading
 * @since 2024-05-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_datasource")
public class Datasource extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 驱动名称
     */
    private String driverClassName;

    /**
     * url地址
     */
    private String url;

    /**
     * 用户
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 别名
     */
    private String alias;

    /**
     * 备注
     */
    private String remarks;
}
