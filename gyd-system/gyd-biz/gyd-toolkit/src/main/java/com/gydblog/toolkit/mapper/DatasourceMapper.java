package com.gydblog.toolkit.mapper;

import com.gydblog.common.core.BaseMapperX;
import com.gydblog.common.core.LambdaQueryWrapperX;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.entity.Datasource;

/**
 * <p>
 * 数据源 Mapper 接口
 * </p>
 *
 */
public interface DatasourceMapper extends BaseMapperX<Datasource> {

    default PageResult<Datasource> selectPage(Datasource dictData) {

        return selectPage( new LambdaQueryWrapperX<Datasource>()
                .likeIfPresent(Datasource::getName, dictData.getName())
                .eqIfPresent(Datasource::getAlias, dictData.getAlias())
                .betweenIfPresent(Datasource::getCreateTime, dictData.getParams())
                .orderByAsc(Datasource::getCreateTime));
    }

}
