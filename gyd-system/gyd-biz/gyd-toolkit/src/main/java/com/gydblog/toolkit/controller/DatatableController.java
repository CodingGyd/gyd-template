package com.gydblog.toolkit.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.gydblog.common.annotation.ApiResource;
import com.gydblog.common.enums.ResBizTypeEnum;
import com.gydblog.toolkit.service.ColumnService;
import com.gydblog.toolkit.service.TableService;
import com.gydblog.common.domain.R;
import com.gydblog.common.domain.entity.Column;
import com.gydblog.common.domain.entity.Table;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @description 数据表管理
 */
@RestController
@RequestMapping("toolkit/datatable")
@ApiResource(name = "开发工具", resBizType = ResBizTypeEnum.SYSTEM)
@AllArgsConstructor
public class DatatableController {

    private final JdbcTemplate jdbcTemplate;
    private final TableService tableService;
    private final ColumnService columnService;

    /**
     * 根据数据名称获取所有表名
     */
    @GetMapping("/list")
    public R list(@RequestParam String alias, @RequestParam(required = false) String tableName) {
        StringBuilder sql = new StringBuilder();

        sql.append("select table_name tableName, table_comment tableComment, create_time createTime from information_schema.tables where table_schema=?")
                .append(" and table_name not like 'sys_%' and table_name not like 'qrtz_%' and table_name not like 'act_%' and table_name not like 'dev_%' and table_type='base table'");
        if (StrUtil.isNotBlank(tableName)) {
            sql.append(" and table_name like '%" + tableName + "%'");
        }

        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), alias);
        list.stream().forEach(map -> {
            Table table = tableService.getOne(new QueryWrapper<Table>().eq("table_name", map.get("tableName")));
            if (table != null) {
                map.put("isConfig", "1");
                map.put("genWay", table.getGenWay());
            } else {
                map.put("isConfig", "0");
            }
        });
        return R.ok(list);
    }

    @GetMapping("/tree")
    public R tree() {
        List<Table> tableList = tableService.list();
        return R.ok(tableList);
    }

    @GetMapping("/column/{tableId}")
    public R column(@PathVariable String tableId) {
        List<Column> columnList = columnService.list(new QueryWrapper<Column>().eq("table_id", tableId));
        return R.ok(columnList);
    }

    /*
    新建/配置表
     */
    @PostMapping("/getGenTable")
    public R getGenTable(@RequestBody Table table) {
        return R.ok(tableService.getGenTable(table.getTableName(), table.getTableComment()));
    }
    /**
      表修改
       */
    @PutMapping("/update")
    public R update(@RequestBody Table table) {
        tableService.validateEdit(table);
        tableService.updateTable(table);
        return R.ok();
    }
    /**
     预览代码
     */
    @GetMapping("/preview/{tableName}")
    public R preview(@PathVariable("tableName") String tableName) {
        Map<String, String> dataMap = tableService.previewCode(tableName);
        return R.ok(dataMap);
    }

    /**
     * 批量生成代码到本地
     */
    @GetMapping("/batchGenToLocal/{tables}")
    public R batchGenToLocal(@PathVariable String tables) {
        String[] tableNames = Convert.toStrArray(tables);
        return R.ok(tableService.genToLocal(tableNames));
    }

    /**
     * 批量生成代码
     */
    @GetMapping("/batchGenCode/{tables}")
    @ResponseBody
    public void batchGenCode(HttpServletResponse response, @PathVariable String tables) throws IOException {
        String[] tableNames = Convert.toStrArray(tables);
        byte[] data = tableService.genCode(tableNames);
        genCode(response, data);
    }

    /**
     * 生成zip文件
     */
    private void genCode(HttpServletResponse response, byte[] data) throws IOException {
        response.reset();
        response.setHeader("Content-Disposition", "attachment; filename=\"gydblog.zip\"");
        response.addHeader("Content-Length", "" + data.length);
        response.setContentType("application/octet-stream; charset=UTF-8");
        IoUtil.write(response.getOutputStream(), true, data);
    }
    /**
     * 表删除
     */
    @DeleteMapping("/remove")
    @Transactional
    public R remove(@RequestParam String alias, @RequestParam String tableName) {
        Table table = tableService.getOne(new QueryWrapper<Table>().eq("table_name", tableName));
        if (table != null) {
            //删除表列信息
            tableService.deleteTableByIds(table.getId() + "");
        }
        //删除数据库表
//        DSContextHolder.setDSType(AliasUtil.getDsId(alias));
//        StringBuilder sql = new StringBuilder();
//        if (DataTypeEnum.MYSQL.getType().equals(AliasUtil.getDsType(alias))) {
//            sql.append("drop table ").append(tableName);
//        }

        return R.ok();
    }
    /**
     * 物理表删除
     */
    @DeleteMapping("/drop")
    @Transactional
    public R drop(@RequestParam String alias, @RequestParam String tableName) {
        //删除数据库表
        DynamicDataSourceContextHolder.push(alias);
        StringBuilder sql = new StringBuilder();
        sql.append("drop table ").append(tableName).append(";");
        jdbcTemplate.execute(sql.toString());
        DynamicDataSourceContextHolder.clear();
        return R.ok();
    }

}
