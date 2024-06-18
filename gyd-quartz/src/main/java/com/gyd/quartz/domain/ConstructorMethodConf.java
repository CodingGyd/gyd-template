package com.gyd.quartz.domain;

import java.util.Arrays;

public class ConstructorMethodConf {
    //参数类型数组
    Class[] parameterTypes;
    //参数数组
    Object[] parameters;

    public Class[] getParameterTypes() {
        return parameterTypes;
    }

    public void setParameterTypes(Class[] parameterTypes) {
        this.parameterTypes = parameterTypes;
    }

    public Object[] getParameters() {
        return parameters;
    }

    public void setParameters(Object[] parameters) {
        this.parameters = parameters;
    }

    @Override
    public String toString() {
        return "ConstructorMethodConf{" +
                "parameterTypes=" + Arrays.toString(parameterTypes) +
                ", parameters=" + Arrays.toString(parameters) +
                '}';
    }
}
