package com.gydblog.mt.controller;

import com.gydblog.common.enums.ResBizTypeEnum;
import com.gydblog.mt.entity.ILog;
import com.gydblog.mt.service.IMTLogService;
import com.gydblog.common.annotation.ApiResource;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * I茅台日志Controller
 *
 */
@RestController
@RequestMapping("/imt/log")
@ApiResource(name = "I茅台预约日志管理", resBizType = ResBizTypeEnum.BUSINESS)
public class ILogController {
    @Autowired
    private IMTLogService logService;

    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/list", name = "操作日志-分页")
    public R list(ILog log) {
        PageResult<ILog> page = logService.page(log);
        return R.ok().put(page);
    }

    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping(value = "/{operIds}", name = "操作日志-删除")
    public R remove(@PathVariable Long[] operIds) {
        return R.ok(logService.deleteLogByIds(operIds));
    }

    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping(value = "/clean", name = "操作日志-清空")
    public R clean() {
        logService.cleanLog();
        return R.ok();
    }

}
