package com.gydblog.base.mapper;

import cn.hutool.core.util.ObjectUtil;
import com.gydblog.common.core.BaseMapperX;
import com.gydblog.common.core.LambdaQueryWrapperX;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.entity.SysMenu;
import com.gydblog.common.domain.model.SysRoleAuth;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysMenuMapper extends BaseMapperX<SysMenu> {
    default PageResult<SysMenu> selectPage(SysMenu sysMenu) {

        return selectPage(new LambdaQueryWrapperX<SysMenu>());
    }

    /**
     * 查询系统菜单列表
     *
     * @param menu 菜单信息
     * @return 菜单列表
     */
    default List<SysMenu> selectMenuList(SysMenu menu) {

        return selectList(new LambdaQueryWrapperX<SysMenu>()
                .like(ObjectUtil.isNotNull(menu.getMenuName()), SysMenu::getMenuName, menu.getMenuName())
                .eq(ObjectUtil.isNotNull(menu.getVisible()), SysMenu::getVisible, menu.getVisible())
                .eq(ObjectUtil.isNotNull(menu.getStatus()), SysMenu::getStatus, menu.getStatus()));
    }

    /**
     * 根据用户查询系统菜单列表
     *
     * @param menu 菜单信息
     * @return 菜单列表
     */
    List<SysMenu> selectMenuListByUserId(SysMenu menu);

    /**
     * 根据用户ID查询菜单
     *
     * @return 菜单列表
     */
    List<SysMenu> selectMenuTreeAll();

    /**
     * 根据用户ID查询菜单
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<SysMenu> selectMenuTreeByUserId(Long userId);


    /**
     * 根据角色ID查询权限
     *
     * @param roleId 角色ID
     * @return 权限列表
     */
    List<String> selectMenuPermsByRoleId(Long roleId);

    /**
     * 查询所有角色的权限列表
     *
     * @return SysRolePerms
     */
    List<SysRoleAuth> getMenuPermsAll();

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    List<String> selectMenuPermsByUserId(Long userId);


    /**
     * 根据角色ID查询菜单树信息
     *
     * @param roleId            角色ID
     * @param menuCheckStrictly 菜单树选择项是否关联显示
     * @return 选中菜单列表
     */
    List<Long> selectMenuListByRoleId(@Param("roleId") Long roleId, @Param("menuCheckStrictly") boolean menuCheckStrictly);

    /**
     * 校验菜单名称是否唯一
     */
    default SysMenu checkMenuNameUnique(SysMenu menu) {
        return selectOne(new LambdaQueryWrapperX<SysMenu>()
                .eq(SysMenu::getMenuName, menu.getMenuName())
                .eq(SysMenu::getParentId, menu.getParentId())
        );
    }


}
