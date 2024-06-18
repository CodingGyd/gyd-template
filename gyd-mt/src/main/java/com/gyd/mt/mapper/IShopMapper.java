package com.gyd.mt.mapper;

import com.gyd.common.core.BaseMapperX;
import com.gyd.common.core.LambdaQueryWrapperX;
import com.gyd.common.core.page.PageResult;
import com.gyd.mt.entity.IShop;
import org.apache.ibatis.annotations.Update;

/**
 * I茅台商品Mapper接口
 */

public interface IShopMapper extends BaseMapperX<IShop> {
    //清空指定表
    @Update("truncate table i_shop")
    void truncateShop();

    default PageResult<IShop> selectPage(IShop iShop) {

        return selectPage(new LambdaQueryWrapperX<IShop>()
                .eqIfPresent(IShop::getIShopId,iShop.getIShopId())
                .likeIfPresent(IShop::getProvinceName, iShop.getProvinceName())
                .likeIfPresent(IShop::getDistrictName, iShop.getDistrictName())
                .likeIfPresent(IShop::getCityName, iShop.getCityName())
                .likeIfPresent(IShop::getTenantName, iShop.getTenantName())
                .betweenIfPresent(IShop::getCreateTime, iShop.getParams())
        );

    }
}
