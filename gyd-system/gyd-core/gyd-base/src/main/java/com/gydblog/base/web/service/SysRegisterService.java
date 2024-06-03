package com.gydblog.base.web.service;

import com.gydblog.common.constant.CacheConstants;
import com.gydblog.common.constant.Constants;
import com.gydblog.common.constant.UserConstants;
import com.gydblog.common.core.RedisCache;
import com.gydblog.common.domain.entity.SysUserEntity;
import com.gydblog.common.domain.model.RegisterBody;
import com.gydblog.common.exception.user.CaptchaException;
import com.gydblog.common.exception.user.CaptchaExpireException;
import com.gydblog.common.utils.MessageUtils;
import com.gydblog.common.utils.SecurityUtils;
import com.gydblog.common.utils.StringUtils;
import com.gydblog.base.manager.AsyncFactory;
import com.gydblog.base.manager.AsyncManager;
import com.gydblog.base.service.SysConfigService;
import com.gydblog.base.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

/**
 * 注册校验方法
 */
@Component
public class SysRegisterService {
    @Autowired
    private SysUserService userService;

    @Autowired
    private SysConfigService configService;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private SysPermissionService permissionService;

    /**
     * 注册
     */
    public String register(RegisterBody registerBody) {
        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword();
        SysUserEntity sysUser = new SysUserEntity();
        sysUser.setUserName(username);

        // 验证码开关
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (captchaEnabled) {
            validateCaptcha(username, registerBody.getCode(), registerBody.getUuid());
        }

        if (StringUtils.isEmpty(username)) {
            msg = "用户名不能为空";
        } else if (StringUtils.isEmpty(password)) {
            msg = "用户密码不能为空";
        } else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            msg = "账户长度必须在2到20个字符之间";
        } else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            msg = "密码长度必须在5到20个字符之间";
        } else if (!(userService.checkUserNameUnique(sysUser))) {
            msg = "保存用户'" + username + "'失败，注册账号已存在";
        } else {
            sysUser.setNickName(username);
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag) {
                msg = "注册失败,请联系系统管理人员";
            } else {
                //注册成功
                //添加 imaotai 角色
                SysUserEntity userEntity = userService.selectUserByUserName(username);
                Set<String> roleSet = new HashSet<>();
                roleSet.add("imaotai");
                userService.insertUserAuth(userEntity.getUserId(), roleSet);
                //更新redis缓存
                permissionService.resetUserRoleAuthCache(userEntity.getUserId());

                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, null, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code     验证码
     * @param uuid     唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid) {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null) {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha)) {
            throw new CaptchaException();
        }
    }
}
