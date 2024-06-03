package com.gydblog.toolkit.controller;

import cn.hutool.extra.spring.SpringUtil;
import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.baomidou.dynamic.datasource.creator.DataSourceCreator;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DataSourceProperty;
import com.gydblog.toolkit.service.DatasourceService;
import com.gydblog.common.annotation.ApiResource;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.R;
import com.gydblog.common.domain.entity.Datasource;
import com.gydblog.common.enums.ResBizTypeEnum;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.List;


/**
 * @description 数据库Controller
 */
@AllArgsConstructor
@RestController
@RequestMapping("/toolkit/datasource")
@ApiResource(name = "开发工具", resBizType = ResBizTypeEnum.SYSTEM)
public class DatasourceController {

    private final DatasourceService datasourceService;
    private final DataSourceCreator druidDataSourceCreator;


    @GetMapping("/list")
    @ResponseBody
    public R list(Datasource datasource) {
        PageResult<Datasource> page = datasourceService.page(datasource);
        return R.ok().put(page);
    }

    @GetMapping("/datasourceList")
    @ResponseBody
    public R datasourceList(Datasource datasource) {
        List<Datasource> datasourceList = datasourceService.list();
        return R.ok(datasourceList);
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Long id) {
        return R.ok(datasourceService.getById(id));
    }

    @PostMapping("/save")
    @ResponseBody
    public R save(@RequestBody Datasource datasource) {
        datasource.setAlias(datasource.getName());
        datasourceService.save(datasource);
        // 添加动态数据源
        addDynamicDataSource(datasource);
        return R.ok();
    }

    @PutMapping("/update")
    @ResponseBody
    public R update(@RequestBody Datasource datasource) {
        datasource.setAlias(datasource.getName());
        datasourceService.updateById(datasource);
        // 先移除
        DynamicRoutingDataSource dynamicRoutingDataSource = SpringUtil.getBean(DynamicRoutingDataSource.class);
        dynamicRoutingDataSource.removeDataSource(datasource.getName());

        // 再添加
        addDynamicDataSource(datasource);
        return R.ok();
    }

    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Long[] id) {
        //删除缓存中的数据源
        for(Long did : id){
            Datasource datasource = datasourceService.getById(did);
            if(datasource != null){
                DynamicRoutingDataSource dynamicRoutingDataSource = SpringUtil.getBean(DynamicRoutingDataSource.class);
                dynamicRoutingDataSource.removeDataSource(datasource.getName());
            }
        }
        datasourceService.removeByIds(Arrays.asList(id));
        return R.ok();
    }

    //新增数据源
    private void addDynamicDataSource(Datasource datasource) {
        DataSourceProperty dataSourceProperty = new DataSourceProperty();
        dataSourceProperty.setPoolName(datasource.getName());
        dataSourceProperty.setUrl(datasource.getUrl());
        dataSourceProperty.setUsername(datasource.getUsername());
        dataSourceProperty.setPassword(datasource.getPassword());
        DataSource dataSource = druidDataSourceCreator.createDataSource(dataSourceProperty);

        DynamicRoutingDataSource dynamicRoutingDataSource = SpringUtil.getBean(DynamicRoutingDataSource.class);
        dynamicRoutingDataSource.addDataSource(dataSourceProperty.getPoolName(), dataSource);
    }
}
