package com.gyd.mt.enums;

/***
 * 预约操作结果 0-正常 1-异常
 *
 */
public enum AppointRecordStatusEnum {
    ERROR(1, "异常"),
    NORMAL(0, "正常");

    private Integer code;
    private String msg;

    private AppointRecordStatusEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
