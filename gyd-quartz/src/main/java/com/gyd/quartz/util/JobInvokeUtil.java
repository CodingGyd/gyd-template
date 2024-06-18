package com.gyd.quartz.util;

import com.gyd.common.utils.StringUtils;
import com.gyd.common.utils.spring.SpringUtils;
import com.gyd.quartz.domain.ConstructorMethodConf;
import com.gyd.quartz.domain.SysJob;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedList;
import java.util.List;

/**
 * 任务执行工具
 *
 * @author gyd
 */
public class JobInvokeUtil
{
    /**
     * 执行方法
     *
     * @param sysJob 系统任务
     */
    public static void invokeMethod(SysJob sysJob) throws Exception
    {
        String invokeTarget = sysJob.getInvokeTarget();
        String beanName = getBeanName(invokeTarget);
        String methodName = getMethodName(invokeTarget);
        List<Object[]> methodParams = getMethodParams(invokeTarget);

        if (!isValidClassName(beanName))
        {
            Object bean = SpringUtils.getBean(beanName);
            invokeMethod(bean, methodName, methodParams);
        }
        else
        {
            Object bean = Class.forName(beanName).getDeclaredConstructor().newInstance();
            invokeMethod(bean, methodName, methodParams);
        }
    }

    /**
     * 调用任务方法
     *
     * @param bean 目标对象
     * @param methodName 方法名称
     * @param methodParams 方法参数
     */
    private static void invokeMethod(Object bean, String methodName, List<Object[]> methodParams)
            throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException,
            InvocationTargetException
    {
        if (StringUtils.isNotNull(methodParams) && methodParams.size() > 0)
        {
            Method method = bean.getClass().getMethod(methodName, getMethodParamsType(methodParams));
            method.invoke(bean, getMethodParamsValue(methodParams));
        }
        else
        {
            Method method = bean.getClass().getMethod(methodName);
            method.invoke(bean);
        }
    }

    /**
     * 校验是否为为class包名
     * 
     * @param invokeTarget 名称
     * @return true是 false否
     */
    public static boolean isValidClassName(String invokeTarget)
    {
        return StringUtils.countMatches(invokeTarget, ".") > 1;
    }

    /**
     * 获取bean名称
     * 
     * @param invokeTarget 目标字符串
     * @return bean名称
     */
    public static String getBeanName(String invokeTarget)
    {
        String beanName = StringUtils.substringBefore(invokeTarget, "(");
        return StringUtils.substringBeforeLast(beanName, ".");
    }

    /**
     * 获取bean方法
     * 
     * @param invokeTarget 目标字符串
     * @return method方法
     */
    public static String getMethodName(String invokeTarget)
    {
        String methodName = StringUtils.substringBefore(invokeTarget, "(");
        return StringUtils.substringAfterLast(methodName, ".");
    }

    /**
     * 获取method方法参数相关列表
     * 
     * @param invokeTarget 目标字符串
     * @return method方法相关参数列表
     */
    public static List<Object[]> getMethodParams(String invokeTarget)
    {
        String methodStr =  invokeTarget.substring(invokeTarget.indexOf("(")+1,invokeTarget.lastIndexOf(")"));

        if (StringUtils.isEmpty(methodStr))
        {
            return null;
        }
        String[] methodParams = methodStr.split(",(?=([^\"']*[\"'][^\"']*[\"'])*[^\"']*$)");
        List<Object[]> classs = new LinkedList<>();
        for (int i = 0; i < methodParams.length; i++)
        {
            String str = StringUtils.trimToEmpty(methodParams[i]);
            // String字符串类型，以'或"开头
            if (StringUtils.startsWithAny(str, "'", "\""))
            {
                classs.add(new Object[] { StringUtils.substring(str, 1, str.length() - 1), String.class });
            }
            // boolean布尔类型，等于true或者false
            else if ("true".equalsIgnoreCase(str) || "false".equalsIgnoreCase(str))
            {
                classs.add(new Object[] { Boolean.valueOf(str), Boolean.class });
            }
            // long长整形，以L结尾
            else if (StringUtils.endsWith(str, "L"))
            {
                classs.add(new Object[] { Long.valueOf(StringUtils.substring(str, 0, str.length() - 1)), Long.class });
            }
            // double浮点类型，以D结尾
            else if (StringUtils.endsWith(str, "D"))
            {
                classs.add(new Object[] { Double.valueOf(StringUtils.substring(str, 0, str.length() - 1)), Double.class });
            } //引用类型
            else if (StringUtils.endsWith(str, "@class")){
                try {
                    Object instance = getInstance(str);
                    classs.add(new Object[] { instance, instance.getClass()});

                } catch (Exception e) {
                    throw new RuntimeException("实例化引用参数异常:"+e.getMessage());
                }
            }
            // 其他类型归类为整形
            else
            {
                classs.add(new Object[] { Integer.valueOf(str), Integer.class });
            }
        }
        return classs;
    }

    /**
     * 获取参数类型
     * 
     * @param methodParams 参数相关列表
     * @return 参数类型列表
     */
    public static Class<?>[] getMethodParamsType(List<Object[]> methodParams)
    {
        Class<?>[] classs = new Class<?>[methodParams.size()];
        int index = 0;
        for (Object[] os : methodParams)
        {
            classs[index] = (Class<?>) os[1];
            index++;
        }
        return classs;
    }

    /**
     * 获取参数值
     * 
     * @param methodParams 参数相关列表
     * @return 参数值列表
     */
    public static Object[] getMethodParamsValue(List<Object[]> methodParams)
    {
        Object[] classs = new Object[methodParams.size()];
        int index = 0;
        for (Object[] os : methodParams)
        {
            classs[index] = (Object) os[0];
            index++;
        }
        return classs;
    }

//    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
//        String invokeTarget = "com.gyd.quartz.task.ParamBean('bob'#10)@class";
//        System.out.println(getInstance(invokeTarget));
//        invokeTarget = "com.gyd.quartz.task.Param2Bean(1D#20)@class";
//        System.out.println(getInstance(invokeTarget));
//    }

    private static Object getInstance(String invokeTarget) throws ClassNotFoundException, NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        String className = invokeTarget.substring(0,invokeTarget.indexOf("("));
        ConstructorMethodConf constructorMethodConf = getConstructorMethodParams(invokeTarget);
        //根据类名获取Class对象
        Class clazz = Class.forName(className);
        //参数类型数组
        Class[] parameterTypes=constructorMethodConf.getParameterTypes();
        //匹配构造方法
        Constructor constructor=clazz.getConstructor(parameterTypes);
        //参数数组
        Object[] parameters = constructorMethodConf.getParameters();
        //根据获取的构造函数和参数，创建实例
        Object o=constructor.newInstance(parameters);
        return o;
    }

    /**
     * 获取构造方法参数相关列表
     *
     * @param invokeTarget 目标字符串
     * @return method方法相关参数列表
     */
    public static ConstructorMethodConf getConstructorMethodParams(String invokeTarget)
    {
        ConstructorMethodConf constructorMethodConf = new ConstructorMethodConf();
        String methodStr = StringUtils.substringBetween(invokeTarget, "(", ")");
        if (StringUtils.isEmpty(methodStr))
        {
            return constructorMethodConf;
        }
        String[] methodParams = methodStr.split("#");
        List<Object[]> classs = new LinkedList<>();
        //参数类型数组
        Class[] parameterTypes = new Class[methodParams.length];
        //参数数组
        Object[] parameters=new Object[methodParams.length];
        for (int i = 0; i < methodParams.length; i++)
        {

            String str = StringUtils.trimToEmpty(methodParams[i]);
            // String字符串类型，以'或"开头
            if (StringUtils.startsWithAny(str, "'", "\""))
            {
                parameterTypes[i] = String.class;
                parameters[i]= StringUtils.substring(str, 1, str.length() - 1);
            }
            // boolean布尔类型，等于true或者false
            else if ("true".equalsIgnoreCase(str) || "false".equalsIgnoreCase(str))
            {
                parameterTypes[i] = Boolean.class;
                parameters[i]= Boolean.valueOf(str);
            }
            // long长整形，以L结尾
            else if (StringUtils.endsWith(str, "L"))
            {
                parameterTypes[i] = Long.class;
                parameters[i]= Long.valueOf(StringUtils.substring(str, 0, str.length() - 1));
            }
            // double浮点类型，以D结尾
            else if (StringUtils.endsWith(str, "D"))
            {
                classs.add(new Object[] { Double.valueOf(StringUtils.substring(str, 0, str.length() - 1)), Double.class });
                parameterTypes[i] = Double.class;
                parameters[i]= Double.valueOf(StringUtils.substring(str, 0, str.length() - 1));
            }
            // 其他类型归类为整形
            else
            {
                parameterTypes[i] = Integer.class;
                parameters[i]= Integer.valueOf(str);
            }
        }
        constructorMethodConf.setParameters(parameters);
        constructorMethodConf.setParameterTypes(parameterTypes);
        return constructorMethodConf;
    }
}
