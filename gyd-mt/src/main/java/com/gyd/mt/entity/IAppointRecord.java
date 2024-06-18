package com.gyd.mt.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.gyd.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;


/**
 * I茅台日志 i_appointment_record
 */
@Data
@TableName("i_appointment_record")
public class IAppointRecord {

    private static final long serialVersionUID = 1L;

    /**
     * 日志主键
     */
    @TableId("id")
    private Long id;

    /**
     * 预约类型(0-i茅台)
     */
    private Integer recordType;
    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 预约状态（0正常 1异常）
     */
    private Integer status;

    /**
     * 预约记录内容
     */
    private String content;

    /**
     * 用户手机号
     */
    private Long mobile;
    /**
     * 预约日期
     */
    private String recordDate;
    /**
     * 预约时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date recordTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getRecordType() {
        return recordType;
    }

    public void setRecordType(Integer recordType) {
        this.recordType = recordType;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getMobile() {
        return mobile;
    }

    public void setMobile(Long mobile) {
        this.mobile = mobile;
    }

    public Date getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Date recordTime) {
        this.recordTime = recordTime;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(String recordDate) {
        this.recordDate = recordDate;
    }
}
