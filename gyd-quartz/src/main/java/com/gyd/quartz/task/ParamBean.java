package com.gyd.quartz.task;


public class ParamBean {

    private String name;
    private Integer num;

    public ParamBean(String name, Integer num) {
        this.name = name;
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "ParamBean{" +
                "name='" + name + '\'' +
                ", num=" + num +
                '}';
    }
}
