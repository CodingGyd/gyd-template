package com.gydblog.admin.controller.system;

import com.gydblog.admin.service.SysDictDataService;
import com.gydblog.admin.service.SysDictTypeService;
import com.gydblog.common.annotation.Anonymous;
import com.gydblog.common.annotation.ApiResource;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.R;
import com.gydblog.common.domain.entity.SysDictDataEntity;
import com.gydblog.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/system/dict/data")
@ApiResource(name = "字典数据管理", resBizType = ResBizTypeEnum.SYSTEM)
public class SysDictDataController {
    @Autowired
    private SysDictDataService dictDataService;
    @Autowired
    private SysDictTypeService dictTypeService;


    @PreAuthorize("@ss.hasPermi('system:dict:list')")
    @GetMapping(value = "/list", name = "字典数据管理-分页")
    public R page(SysDictDataEntity dictData) {
        PageResult<SysDictDataEntity> page = dictDataService.page(dictData);
        return R.ok().put(page);
    }

    /**
     * 根据字典类型查询字典数据信息
     */
    @GetMapping(value = "/type/{dictType}", name = "字典数据管理-根据字典类型查询字典数据信息")
    @Anonymous
    public R dictType(@PathVariable String dictType) {

        List<SysDictDataEntity> data = dictTypeService.selectDictDataByType(dictType);
        if (StringUtils.isEmpty(data)) {
            data = new ArrayList<SysDictDataEntity>();
        }
        return R.ok().put(data);
    }


    /**
     * 查询字典数据详细
     */
    @PreAuthorize("@ss.hasPermi('system:dict:query')")
    @GetMapping(value = "/{dictCode}", name = "字典数据管理-查询")
    public R getInfo(@PathVariable Long dictCode) {
        return R.ok(dictDataService.selectDictDataById(dictCode));
    }


    /**
     * 新增字典类型
     */
    @PreAuthorize("@ss.hasPermi('system:dict:add')")
    @PostMapping(name = "字典数据管理-新增")
    public R add(@Validated @RequestBody SysDictDataEntity dict) {
        return R.ok(dictDataService.insertDictData(dict));
    }

    /**
     * 修改保存字典类型
     */
    @PreAuthorize("@ss.hasPermi('system:dict:edit')")
    @PutMapping(name = "字典数据管理-修改")
    public R edit(@Validated @RequestBody SysDictDataEntity dict) {
        return R.ok(dictDataService.updateDictData(dict));
    }

    /**
     * 删除字典类型
     */
    @PreAuthorize("@ss.hasPermi('system:dict:remove')")
    @DeleteMapping(value = "/{dictCodes}", name = "字典数据管理-删除")
    public R remove(@PathVariable Long[] dictCodes) {
        dictDataService.deleteDictDataByIds(dictCodes);
        return R.ok();
    }
}