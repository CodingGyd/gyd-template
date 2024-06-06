package com.gydblog.admin.web.service;

import com.gydblog.admin.service.SysMenuService;
import com.gydblog.admin.service.SysResourceService;
import com.gydblog.admin.service.SysRoleService;
import com.gydblog.admin.service.SysUserService;
import com.gydblog.common.core.RedisCache;
import com.gydblog.common.domain.entity.SysRole;
import com.gydblog.common.domain.entity.SysUser;
import com.gydblog.common.domain.model.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 用户权限处理
 *
 * @author gyd
 */
@Component
public class SysPermissionService {
    @Autowired
    private SysRoleService roleService;
    @Autowired
    private SysMenuService menuService;
    @Autowired
    private SysResourceService resourceService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private TokenService tokenService;

    @Autowired
    private RedisCache redisCache;

    /**
     * 获取角色数据权限
     *
     * @param user 用户信息
     * @return 角色权限信息
     */
    public Set<String> getRolePermission(SysUser user) {
        Set<String> roles = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.isAdmin()) {
            roles.add("admin");
        } else {
            roles.addAll(roleService.selectRolePermissionByUserId(user.getUserId()));
        }
        return roles;
    }

    /**
     * 获取菜单数据权限
     *
     * @param user 用户信息
     * @return 菜单权限信息
     */
    public Set<String> getMenuPermission(SysUser user) {
        Set<String> perms = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.isAdmin()) {
            perms.add("*:*:*");
        } else {
            List<SysRole> roles = user.getRoles();
            if (!roles.isEmpty() && roles.size() > 1) {
                // 多角色设置permissions属性，以便数据权限匹配权限
                for (SysRole role : roles) {
                    Set<String> rolePerms = menuService.selectMenuPermsByRoleId(role.getRoleId());
                    role.setPermissions(rolePerms);
                    perms.addAll(rolePerms);
                }
            } else {
                perms.addAll(menuService.selectMenuPermsByUserId(user.getUserId()));
            }
        }
        return perms;
    }

    /**
     * 获取菜单数据权限
     *
     * @param roleID 角色id
     * @return 菜单权限信息
     */
    public Set<String> getMenuPermissionByRoleId(Long roleID) {
        Set<String> perms = new HashSet<String>();
        // 管理员拥有所有权限
        if (roleID == 1) {
            perms.add("*:*:*");
        } else {
            perms = menuService.selectMenuPermsByRoleId(roleID);
        }
        return perms;
    }

    /**
     * 获取接口资源数据权限
     *
     * @param user 用户信息
     * @return 资源信息
     */
    public Set<String> getResources(SysUser user) {
        Set<String> res = new HashSet<String>();
        // 超级管理员拥有所有权限
        if (user.isAdmin()) {
            res.add("*:*:*");
        } else {
            List<SysRole> roles = user.getRoles();
            if (roles != null && !roles.isEmpty()) {
                for (SysRole role : roles) {
                    Set<String> code = resourceService.selectResourceCodeByRoleId(role.getRoleId());
                    res.addAll(code);
                }
            }
        }
        return res;
    }


    /**
     * 重置登录用户的权限缓存
     *
     * @param roleId 角色id
     */
    public void resetLoginUserRoleCache(long roleId) {
//        Collection<String> keys = redisCache.keys(CacheConstants.LOGIN_USER_KEY + "*");
        SysUser user = new SysUser();
        user.setRoleId(roleId);
        List<SysUser> sysUserEntities = userService.selectAllocatedList(user);

        sysUserEntities.forEach(u -> resetUserRoleAuthCache(u.getUserId()));
    }

    /**
     * 重置redis里用户权限的缓存
     *
     * @param userId 用户id
     */
    public void resetUserRoleAuthCache(long userId) {

        LoginUser loginUser = tokenService.getLoginUserByUserId(userId);
        if (loginUser != null) {
            loginUser.setPermissions(getMenuPermission(loginUser.getUser()));
            loginUser.setUser(userService.selectUserByUserName(loginUser.getUser().getUserName()));
            loginUser.setResources(getResources(loginUser.getUser()));
            tokenService.setLoginUser(loginUser);
        }


    }
}