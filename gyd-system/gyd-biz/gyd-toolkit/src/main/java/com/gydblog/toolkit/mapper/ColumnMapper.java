package com.gydblog.toolkit.mapper;


import com.gydblog.common.core.BaseMapperX;
import com.gydblog.common.domain.entity.Column;

import java.util.List;

/**
 * 业务字段 数据层
 */
public interface ColumnMapper extends BaseMapperX<Column> {
    /**
     * 根据表名称查询列信息
     *
     * @param tableName 表名称
     * @return 列信息
     */
    public List<Column> selectDbColumnsByName(String tableName);

    /**
     * 批量删除业务字段
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteColumnByTableIds(Integer[] ids);
}
