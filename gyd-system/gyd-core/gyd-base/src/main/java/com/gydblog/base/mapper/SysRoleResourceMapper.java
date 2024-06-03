package com.gydblog.base.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.gydblog.common.core.BaseMapperX;
import com.gydblog.common.domain.entity.SysRoleResourceEntity;

import java.util.List;

public interface SysRoleResourceMapper extends BaseMapperX<SysRoleResourceEntity> {


    /**
     * 删除角色与资源关联
     *
     * @param roleId 角色id
     */
    default int deleteRoleResourceByRoleId(Long roleId) {
        return delete(new QueryWrapper<SysRoleResourceEntity>().eq("role_id", roleId));
    }

    /**
     * 批量保存角色与资源关系
     *
     * @param rrList
     */
    int saveBatch(List<SysRoleResourceEntity> rrList);
}
