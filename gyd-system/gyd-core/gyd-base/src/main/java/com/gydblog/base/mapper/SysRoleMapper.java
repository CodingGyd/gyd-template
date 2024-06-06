package com.gydblog.base.mapper;

import com.gydblog.common.core.BaseMapperX;
import com.gydblog.common.core.LambdaQueryWrapperX;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.entity.SysRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface SysRoleMapper extends BaseMapperX<SysRole> {
    default PageResult<SysRole> selectPage(SysRole role) {

        return selectPage(new LambdaQueryWrapperX<SysRole>()
                .likeIfPresent(SysRole::getRoleName, role.getRoleName())
                .likeIfPresent(SysRole::getRoleKey, role.getRoleKey())
                .eqIfPresent(SysRole::getStatus, role.getStatus())
        );
    }

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    List<SysRole> selectRolePermissionByUserId(Long userId);

    /**
     * 通过角色ID查询角色
     *
     * @param roleId 角色ID
     * @return 角色对象信息
     */
    SysRole selectRoleById(Long roleId);

    /**
     * 根据条件分页查询角色数据
     *
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    List<SysRole> selectRoleList(SysRole role);

    /**
     * 根据角色权限字符串查询角色数据
     * @param RoleKeys
     * @return
     */
    List<SysRole> selectRoleListByKey(@Param("RoleKeys") Set<String> RoleKeys);

    /**
     * 校验角色名称是否唯一
     *
     * @param roleName 角色名称
     * @return 角色信息
     */
    SysRole checkRoleNameUnique(String roleName);

    /**
     * 校验角色权限是否唯一
     *
     * @param roleKey 角色权限
     * @return 角色信息
     */
    SysRole checkRoleKeyUnique(String roleKey);

    /**
     * 根据用户ID查询角色
     *
     * @param userName 用户名
     * @return 角色列表
     */
    public List<SysRole> selectRolesByUserName(String userName);

}
