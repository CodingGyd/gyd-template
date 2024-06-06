package com.gydblog.admin.service.impl;

import com.gydblog.base.expander.ConfigExpander;
import com.gydblog.admin.mapper.SysRoleMapper;
import com.gydblog.admin.mapper.SysUserMapper;
import com.gydblog.admin.mapper.SysUserRoleMapper;
import com.gydblog.admin.service.SysRoleService;
import com.gydblog.admin.service.SysUserService;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.entity.SysRole;
import com.gydblog.common.domain.entity.SysUser;
import com.gydblog.common.domain.entity.SysUserRoleEntity;
import com.gydblog.common.exception.ServiceException;
import com.gydblog.common.utils.SecurityUtils;
import com.gydblog.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper userMapper;
    @Autowired
    private SysUserRoleMapper userRoleMapper;
    @Autowired
    private SysRoleMapper roleMapper;
    @Autowired
    private SysRoleService roleService;

    @Override
    public PageResult<SysUser> page(SysUser SysUser) {
        return userMapper.selectPage(SysUser);
    }

    @Override
    public SysUser selectUserByUserName(String userName) {
        SysUser userEntity = userMapper.selectUserByUserName(userName);
        if ( userEntity != null &&StringUtils.isEmpty(userEntity.getAvatar())) {
            userEntity.setAvatar(ConfigExpander.getUserDefaultAvatar());
        }
        return userEntity;
    }

    @Override
    public SysUser selectUserById(Long userId) {
        SysUser userEntity = userMapper.selectUserById(userId);
        if (userEntity != null && StringUtils.isEmpty(userEntity.getAvatar())) {
            userEntity.setAvatar(ConfigExpander.getUserDefaultAvatar());
        }
        return userEntity;
    }

    @Override
    public List<SysUser> selectAllocatedList(SysUser user) {
        return userMapper.selectAllocatedList(user);
    }

    @Override
    public List<SysUser> selectUnallocatedList(SysUser user) {
        return userMapper.selectUnallocatedList(user);
    }

    @Override
    public String selectUserRoleGroup(String userName) {
        List<SysRole> list = roleMapper.selectRolesByUserName(userName);
        if (CollectionUtils.isEmpty(list)) {
            return StringUtils.EMPTY;
        }
        return list.stream().map(SysRole::getRoleName).collect(Collectors.joining(","));
    }

    @Override
    public boolean registerUser(SysUser user) {
        return userMapper.insert(user) > 0;
    }

    @Override
    @Transactional
    public int insertUser(SysUser user) {
        if (StringUtils.isNotEmpty(user.getUserName())
                && !checkUserNameUnique(user)) {
            throw new ServiceException("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
        }
        if (StringUtils.isNotEmpty(user.getPhonenumber())
                && !(checkPhoneUnique(user))) {
            throw new ServiceException("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
        }
        if (StringUtils.isNotEmpty(user.getEmail())
                && !(checkEmailUnique(user))) {
            throw new ServiceException("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        // 新增用户信息
        int rows = userMapper.insert(user);
        // 新增用户与角色管理
        insertUserRole(user);
        return rows;
    }

    @Override
    @Transactional
    public int updateUser(SysUser user) {

        Long userId = user.getUserId();
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 新增用户与角色管理
        insertUserRole(user);
        return userMapper.updateById(user);
    }

    @Override
    @Transactional
    public int deleteUserByIds(Long[] userIds) {
        for (Long userId : userIds) {
            checkUserAllowed(new SysUser(userId));
        }
        // 删除用户与角色关联
        userRoleMapper.deleteUserRole(userIds);
        return userMapper.deleteBatchIds(Arrays.asList(userIds));
    }


    @Override
    @Transactional
    public int updateUserProfile(SysUser user) {
        return userMapper.updateById(user);
    }

    @Override
    @Transactional
    public int updateUserStatus(SysUser user) {
        return userMapper.updateById(user);
    }

    @Override
    @Transactional
    public boolean updateUserAvatar(String userName, String avatar) {
        return userMapper.updateUserAvatar(userName, avatar) > 0;
    }

    @Override
    @Transactional
    public int resetPwd(SysUser user) {
        return userMapper.updateById(user);
    }

    @Override
    public void checkUserAllowed(SysUser user) {
        if (StringUtils.isNotNull(user.getUserId()) && user.isAdmin()) {
            throw new ServiceException("不允许操作超级管理员用户");
        }
    }

    @Override
    @Transactional
    public void insertUserAuth(Long userId, Long[] roleIds) {
        userRoleMapper.deleteUserRoleByUserId(userId);
        insertUserRole(userId, roleIds);
    }

    @Override
    public void insertUserAuth(Long userId, Set<String> roleKey) {
        //查询现有的权限字符
        Set<String> roleSet = roleService.selectRolePermissionByUserId(userId);
        roleKey.addAll(roleSet);

        List<SysRole> sysRoleList = roleMapper.selectRoleListByKey(roleKey);
        List<Long> roleIds = sysRoleList.stream().map(SysRole::getRoleId).collect(Collectors.toList());

        userRoleMapper.deleteUserRoleByUserId(userId);
        insertUserRole(userId, roleIds.toArray(new Long[0]));

    }

    @Override
    public int resetUserPwd(String userName, String password) {
        return userMapper.resetUserPwd(userName, password);
    }

    @Override
    public boolean checkUserNameUnique(SysUser user) {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkUserNameUnique(user.getUserName());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
            return false;
        }
        return true;
    }

    @Override
    public boolean checkPhoneUnique(SysUser user) {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkPhoneUnique(user.getPhonenumber());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
            return false;
        }
        return true;
    }

    @Override
    public boolean checkEmailUnique(SysUser user) {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkEmailUnique(user.getEmail());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
            return false;
        }
        return true;
    }

    /**
     * 新增用户角色信息
     *
     * @param user 用户对象
     */
    public void insertUserRole(SysUser user) {
        this.insertUserRole(user.getUserId(), user.getRoleIds());
    }


    /**
     * 新增用户角色信息
     *
     * @param userId  用户ID
     * @param roleIds 角色组
     */
    public void insertUserRole(Long userId, Long[] roleIds) {
        if (StringUtils.isNotEmpty(roleIds)) {
            // 新增用户与角色管理
            List<SysUserRoleEntity> list = new ArrayList<>(roleIds.length);
            for (Long roleId : roleIds) {
                SysUserRoleEntity ur = new SysUserRoleEntity();
                ur.setUserId(userId);
                ur.setRoleId(roleId);
                list.add(ur);
            }
            userRoleMapper.insertBatch(list);
        }
    }
}
