package com.gyd.quartz.task;

public class ParamBeanTask {


    public void refreshObject(ParamBean paramBean,String aaa) {

        System.out.println("执行有引用参方法ParamBeanTask.refreshObject:"+paramBean.toString()+",+"+aaa);
    }

}
