package com.gyd.mt.mapper;

import com.gyd.common.core.BaseMapperX;
import com.gyd.common.core.LambdaQueryWrapperX;
import com.gyd.common.core.page.PageResult;
import com.gyd.mt.entity.IUser;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

/**
 * I茅台用户Mapper接口
 */
public interface IUserMapper extends BaseMapperX<IUser> {
    default PageResult<IUser> selectPage(IUser iUser) {

        return selectPage(new LambdaQueryWrapperX<IUser>()
                .eqIfPresent(IUser::getUserId, iUser.getUserId())
                .eqIfPresent(IUser::getMobile, iUser.getMobile())
                .eqIfPresent(IUser::getProvinceName, iUser.getProvinceName())
                .betweenIfPresent(IUser::getExpireTime, iUser.getParams())
                .orderByAsc(IUser::getCreateTime)
        );

    }

    default PageResult<IUser> selectPage(IUser iUser, String userName) {

        return selectPage(new LambdaQueryWrapperX<IUser>()
                .eqIfPresent(IUser::getUserId, iUser.getUserId())
                .eqIfPresent(IUser::getMobile, iUser.getMobile())
                .eqIfPresent(IUser::getProvinceName, iUser.getProvinceName())
                .eq(IUser::getCreateBy, userName)
                .betweenIfPresent(IUser::getExpireTime, iUser.getParams())
                .orderByAsc(IUser::getCreateTime)
        );

    }

    default List<IUser> selectReservationUser() {
        return selectList(new LambdaQueryWrapperX<IUser>()
//                      .gt(IUser::getExpireTime, new Date())
                        .ne(IUser::getLat, "")
                        .ne(IUser::getLng, "")
                        .ne(IUser::getItemCode, "")
                        .isNotNull(IUser::getItemCode)

        );

    }

    /**
     * 通过预约执行分钟查询预约用户列表
     */
    default List<IUser> selectReservationUserByMinute(int minute) {
        return selectList(new LambdaQueryWrapperX<IUser>()
                        .eq(IUser::getMinute, minute)
                      .gt(IUser::getExpireTime, new Date())
                        .ne(IUser::getLat, "")
                        .ne(IUser::getLng, "")
                        .ne(IUser::getItemCode, "")
                        .isNotNull(IUser::getItemCode)
        );
    }

    @Select("UPDATE i_user SET `minute` = (SELECT FLOOR(RAND() * 50 + 1)), `update_time`= now() WHERE random_minute = \"0\"")
    void updateUserMinuteBatch();

    int deleteIUser(Long[] iUserId);
}
