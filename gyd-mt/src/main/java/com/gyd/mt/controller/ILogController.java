package com.gyd.mt.controller;

import com.gyd.common.core.domain.AjaxResult;
import com.gyd.common.core.page.PageResult;
import com.gyd.mt.entity.ILog;
import com.gyd.mt.service.IMTLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = "i茅台日志接口")
@RestController
@RequestMapping("/imt/log")
public class ILogController {
    @Autowired
    private IMTLogService logService;

//    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/list", name = "操作日志-分页")
    @ApiOperation("操作日志-分页")
    public AjaxResult list(ILog log) {
        PageResult<ILog> page = logService.page(log);
        return AjaxResult.success(page);
    }

//    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping(value = "/{operIds}", name = "操作日志-删除")
    @ApiOperation("操作日志-删除")
    public AjaxResult remove(@PathVariable Long[] operIds) {
        return AjaxResult.success(logService.deleteLogByIds(operIds));
    }

//    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping(value = "/clean", name = "操作日志-清空")
    @ApiOperation("操作日志-清空")
    public AjaxResult clean() {
        logService.cleanLog();
        return AjaxResult.success();
    }

}
