package com.gydblog.admin.mapper;

import com.gydblog.common.core.BaseMapperX;
import com.gydblog.common.core.LambdaQueryWrapperX;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserMapper extends BaseMapperX<SysUser> {

    default PageResult<SysUser> selectPage(SysUser user) {

        return selectPage(new LambdaQueryWrapperX<SysUser>()
                .likeIfPresent(SysUser::getUserName, user.getUserName())
                .likeIfPresent(SysUser::getPhonenumber, user.getPhonenumber())
                .eqIfPresent(SysUser::getStatus, user.getStatus())
                .betweenIfPresent(SysUser::getCreateTime, user.getParams())
        );
    }


    /**
     * 通过用户名查询用户
     *
     * @param userName
     * @return
     */
    SysUser selectUserByUserName(String userName);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    SysUser selectUserById(Long userId);


    /**
     * 根据条件分页查询已配用户角色列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<SysUser> selectAllocatedList(SysUser user);

    /**
     * 根据条件分页查询未分配用户角色列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<SysUser> selectUnallocatedList(SysUser user);


    /**
     * 修改用户头像
     *
     * @param userName 用户名
     * @param avatar   头像地址
     * @return 结果
     */
    int updateUserAvatar(@Param("userName") String userName, @Param("avatar") String avatar);

    /**
     * 校验email是否唯一
     *
     * @param email 用户邮箱
     * @return 结果
     */
    default SysUser checkEmailUnique(String email) {

        return selectOne(new LambdaQueryWrapperX<SysUser>().eq(SysUser::getEmail, email));
    }

    /**
     * 校验手机号码是否唯一
     *
     * @param phonenumber 手机号码
     * @return 结果
     */
    default SysUser checkPhoneUnique(String phonenumber) {
        return selectOne(new LambdaQueryWrapperX<SysUser>().eq(SysUser::getPhonenumber, phonenumber));
    }

    /**
     * 重置用户密码
     *
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    int resetUserPwd(@Param("userName") String userName, @Param("password") String password);


    /**
     * 校验用户名称是否唯一
     *
     * @param userName 用户名称
     * @return 结果
     */
    default SysUser checkUserNameUnique(String userName) {
        return selectOne(new LambdaQueryWrapperX<SysUser>().eq(SysUser::getUserName, userName));
    }


}