package com.gydblog.toolkit.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.entity.Datasource;

/**
 * <p>
 * 数据源表 服务类
 */
public interface DatasourceService extends IService<Datasource> {
    PageResult<Datasource> page(Datasource datasource);

}
