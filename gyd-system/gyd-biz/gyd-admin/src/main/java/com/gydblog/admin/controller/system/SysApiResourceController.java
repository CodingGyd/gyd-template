package com.gydblog.admin.controller.system;

import com.gydblog.common.annotation.ApiResource;
import com.gydblog.common.domain.R;
import com.gydblog.common.domain.entity.SysResourceEntity;
import com.gydblog.common.enums.ResBizTypeEnum;
import com.gydblog.admin.service.SysResourceService;
import com.gydblog.admin.web.service.SysPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.gydblog.common.utils.SecurityUtils.getUserId;

@RestController
@RequestMapping("/system/resource")
@ApiResource(name = "资源管理", resBizType = ResBizTypeEnum.SYSTEM)
public class SysApiResourceController {
    @Autowired
    private SysResourceService resourceService;
    @Autowired
    private SysPermissionService permissionService;

    /**
     * 加载对应角色资源列表树
     */
    @GetMapping(value = "/roleApiTreeselect/{roleId}", name = "资源管理-加载对应角色资源列表树")
    public R roleMenuTreeSelect(@PathVariable("roleId") Long roleId) {
        List<SysResourceEntity> resources = resourceService.selectApiResourceList(getUserId());
        R ajax = R.ok();
        ajax.put("checkedKeys", resourceService.selectResourceListByRoleId(roleId));
        ajax.put("resources", resourceService.buildResourceTreeSelect(resources));
        return ajax;
    }

    /**
     * 修改对应角色api资源
     */
    @PutMapping(value = "/roleApi", name = "修改对应角色api资源")
    public R editRoleResource(Long roleId, Long[] resourceIds) {
        resourceService.editRoleResource(roleId, resourceIds);
        //更新redis缓存权限数据
        permissionService.resetLoginUserRoleCache(roleId);
        return R.ok();
    }


}
