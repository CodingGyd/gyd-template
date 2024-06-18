package com.gyd.mt.mapper;

import com.gyd.common.core.BaseMapperX;
import com.gyd.mt.entity.IItem;
import org.apache.ibatis.annotations.Update;

/**
 * I茅台预约商品Mapper接口
 */
public interface IItemMapper extends BaseMapperX<IItem> {
    //清空指定表
    @Update("truncate table i_item")
    void truncateItem();
}
