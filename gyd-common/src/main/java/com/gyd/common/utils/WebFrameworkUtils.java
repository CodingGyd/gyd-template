package com.gyd.common.utils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * 专属于 web 包的工具类
 * 参考 ruoyi-pro 芋道源码
 *
 * @author 致远
 */
public class WebFrameworkUtils {

    private static final String REQUEST_ATTRIBUTE_LOGIN_USER_NAME = "login_user_name";

    public static void setLoginUserName(ServletRequest request, String userName) {
        request.setAttribute(REQUEST_ATTRIBUTE_LOGIN_USER_NAME, userName);
    }
    /**
     * 获得当前用户的名称，从请求中
     * 注意：该方法仅限于 framework 框架使用！！！ @SecurityUtils.getUserName()
     *
     * @param request 请求
     * @return 用户编号
     */
    public static String getLoginUserName(HttpServletRequest request) {
        if (request == null) {
            return null;
        }
        return (String) request.getAttribute(REQUEST_ATTRIBUTE_LOGIN_USER_NAME);
    }
}
