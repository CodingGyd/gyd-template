package com.gydblog.common.enums;

/***
 * 预约类型 0-i茅台
 *
 */
public enum AppointRecordTypeEnum {
    MAO_TAI(0, "i茅台");

    private Integer code;
    private String msg;

    private AppointRecordTypeEnum(Integer code, String msg) {
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
