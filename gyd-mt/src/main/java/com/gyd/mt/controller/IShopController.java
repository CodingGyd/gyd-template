package com.gyd.mt.controller;

import com.gyd.common.core.domain.AjaxResult;
import com.gyd.common.core.page.PageResult;
import com.gyd.mt.entity.IShop;
import com.gyd.mt.mapper.IShopMapper;
import com.gyd.mt.service.IShopService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@Api(tags = "i茅台商品接口")
@RestController
@RequestMapping("/imt/shop")
public class IShopController {
    @Autowired
    private IShopService iShopService;
    @Autowired
    private IShopMapper iShopMapper;

    @GetMapping("/list")
    @ApiOperation("查询i茅台商品列表")
    public AjaxResult list(IShop iShop) {
        PageResult<IShop> page = iShopMapper.selectPage(iShop);

        return AjaxResult.success(page);
    }

    @GetMapping(value = "/refresh", name = "刷新i茅台门店列表")
    @ApiOperation("刷新i茅台门店列表")
    @PreAuthorize("@ss.hasPermi('imt:shop:refresh')")
    public AjaxResult refreshShop() {
        iShopService.refreshShop();
        return AjaxResult.success();
    }

}
