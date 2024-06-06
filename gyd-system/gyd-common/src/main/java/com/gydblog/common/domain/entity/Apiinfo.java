package com.gydblog.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.gydblog.common.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
  接口对象 Apiinfo
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("dev_apiinfo")
public class Apiinfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId
    private Integer id;

    /**
     * 应用编号
     */
    private Integer applicationId;

    /**
     * 表编号
     */
    private Integer tableId;

    /**
     * 表名称
     */
    private String tableName;

    /**
     * 名称
     */
    private String name;

    /**
     * 自定义编号
     */
    private String code;

    /**
     * 父编号
     */
    private Integer parentId;

    /**
     * 接口类型
     */
    private String type;

    /**
     * 请求方式
     */
    private String requestType;

    /**
     * 请求方法
     */
    private String requestMethod;

    /**
     * 字段数据
     */
    private String fdata;

    /**
     * 字段数据
     */
    private String pdata;

    /**
     * 脚本
     */
    private String scripts;

    /**
     * 机构编号
     */
    private Integer deptId;

    /**
     * 状态（0-正常，1-停用）
     */
    private String status;


}