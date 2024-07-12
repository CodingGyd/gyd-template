package com.gyd.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.gyd.common.core.controller.BaseController;
import com.gyd.common.core.domain.AjaxResult;
import com.gyd.common.core.page.TableDataInfo;
import com.gyd.common.utils.poi.ExcelUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.gyd.common.annotation.Log;

import com.gyd.common.enums.BusinessType;
import com.gyd.system.domain.ApiInfo;
import com.gyd.system.service.IApiInfoService;


/**
 * 网站接口信息Controller
 * 
 * @author gyd
 * @date 2024-06-21
 */
@RestController
@RequestMapping("/script/api")
public class ApiInfoController extends BaseController
{
    @Autowired
    private IApiInfoService apiInfoService;

    /**
     * 查询网站接口信息列表
     */
    @PreAuthorize("@ss.hasPermi('script:api:list')")
    @GetMapping("/list")
    public TableDataInfo list(ApiInfo apiInfo)
    {
        startPage();
        List<ApiInfo> list = apiInfoService.selectApiInfoList(apiInfo);
        return getDataTable(list);
    }

    /**
     * 导出网站接口信息列表
     */
    @PreAuthorize("@ss.hasPermi('script:api:export')")
    @Log(title = "网站接口信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ApiInfo apiInfo)
    {
        List<ApiInfo> list = apiInfoService.selectApiInfoList(apiInfo);
        ExcelUtil<ApiInfo> util = new ExcelUtil<ApiInfo>(ApiInfo.class);
        util.exportExcel(response, list, "网站接口信息数据");
    }

    /**
     * 获取网站接口信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('script:api:query')")
    @GetMapping(value = "/{apiId}")
    public AjaxResult getInfo(@PathVariable("apiId") Long apiId)
    {
        return success(apiInfoService.selectApiInfoByApiId(apiId));
    }

    /**
     * 新增网站接口信息
     */
    @PreAuthorize("@ss.hasPermi('script:api:add')")
    @Log(title = "网站接口信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ApiInfo apiInfo)
    {
        return toAjax(apiInfoService.insertApiInfo(apiInfo));
    }

    /**
     * 修改网站接口信息
     */
    @PreAuthorize("@ss.hasPermi('script:api:edit')")
    @Log(title = "网站接口信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ApiInfo apiInfo)
    {
        return toAjax(apiInfoService.updateApiInfo(apiInfo));
    }


    /**
     * 执行网站接口调用
     */
    @Log(title = "网站接口执行调用", businessType = BusinessType.OTHER)
    @PostMapping(value = "exec")
    public AjaxResult exec(@RequestBody ApiInfo apiInfo) {
        return success(apiInfoService.exec(apiInfo));
    }


    /**
     * 删除网站接口信息
     */
    @PreAuthorize("@ss.hasPermi('script:api:remove')")
    @Log(title = "网站接口信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{apiIds}")
    public AjaxResult remove(@PathVariable Long[] apiIds)
    {
        return toAjax(apiInfoService.deleteApiInfoByApiIds(apiIds));
    }
}
