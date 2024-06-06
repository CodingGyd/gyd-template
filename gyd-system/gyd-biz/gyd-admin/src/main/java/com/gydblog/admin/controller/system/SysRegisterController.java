package com.gydblog.admin.controller.system;

import com.gydblog.base.service.SysConfigService;
import com.gydblog.common.annotation.Anonymous;
import com.gydblog.common.domain.R;
import com.gydblog.common.domain.entity.SysUser;
import com.gydblog.common.domain.model.RegisterBody;
import com.gydblog.common.utils.StringUtils;
import com.gydblog.admin.service.SysUserService;
import com.gydblog.admin.web.service.SysRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 注册验证
 */
@RestController
public class SysRegisterController {
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private SysConfigService configService;

    @Autowired
    private SysUserService userService;

    @PostMapping("/register")
    public R register(@RequestBody RegisterBody user) {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
            return R.error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? R.ok() : R.error(msg);
    }

    @Anonymous
    @GetMapping("/userNameUnique")
    public R userNameUnique(String userName) {
        SysUser userEntity = new SysUser();
        userEntity.setUserName(userName);
        return R.ok(userService.checkUserNameUnique(userEntity));
    }

    @Anonymous
    @GetMapping("/emailUnique")
    public R emailUnique(String email) {
        SysUser userEntity = new SysUser();
        userEntity.setEmail(email);
        return R.ok(userService.checkEmailUnique(userEntity));
    }

}
