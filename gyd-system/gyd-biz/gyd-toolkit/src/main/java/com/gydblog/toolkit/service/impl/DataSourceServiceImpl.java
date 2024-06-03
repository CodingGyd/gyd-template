package com.gydblog.toolkit.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gydblog.toolkit.mapper.DatasourceMapper;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.entity.Datasource;
import com.gydblog.toolkit.service.DatasourceService;
import org.springframework.stereotype.Service;

/**
 * @ClassName DataSourceServiceImpl
 * @Description 数据源管理
 */
@Service
public class DataSourceServiceImpl  extends ServiceImpl<DatasourceMapper, Datasource> implements DatasourceService {

    @Override
    public PageResult<Datasource> page(Datasource datasource) {
        return baseMapper.selectPage(datasource);
    }
}
