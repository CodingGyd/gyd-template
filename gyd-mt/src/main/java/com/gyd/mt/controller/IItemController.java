package com.gyd.mt.controller;

import com.gyd.common.core.domain.AjaxResult;
import com.gyd.mt.entity.IItem;
import com.gyd.mt.mapper.IItemMapper;
import com.gyd.mt.service.IShopService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@Api(tags = "i茅台预约商品接口")
@RestController
@RequestMapping("/imt/item")
public class IItemController {

    @Autowired
    private IItemMapper iItemMapper;
    @Autowired
    private IShopService iShopService;

    @ApiOperation("查询i茅台预约商品列列表")
    @GetMapping(value = "/list", name = "查询i茅台预约商品列表")
    public AjaxResult list() {
        List<IItem> iItems = iItemMapper.selectList();

        return AjaxResult.success(iItems);
    }

    @ApiOperation("刷新i茅台预约商品列表")
    @GetMapping(value = "/refresh", name = "刷新i茅台预约商品列表")
    @PreAuthorize("@ss.hasPermi('imt:item:refresh')")
    public AjaxResult refreshItem() {
        iShopService.refreshItem();
        return AjaxResult.success();
    }

}
