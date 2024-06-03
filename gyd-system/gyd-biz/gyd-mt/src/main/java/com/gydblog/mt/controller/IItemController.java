package com.gydblog.mt.controller;

import com.gydblog.common.enums.ResBizTypeEnum;
import com.gydblog.mt.entity.IItem;
import com.gydblog.mt.mapper.IItemMapper;
import com.gydblog.mt.service.IShopService;
import com.gydblog.common.annotation.ApiResource;
import com.gydblog.common.domain.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * I茅台预约商品列表Controller
 *
 */
@RestController
@RequestMapping("/imt/item")
@ApiResource(name = "I茅台预约商品管理", resBizType = ResBizTypeEnum.BUSINESS)
public class IItemController {

    @Autowired
    private IItemMapper iItemMapper;
    @Autowired
    private IShopService iShopService;

    /**
     * 查询I茅台预约商品列列表
     */
    @GetMapping(value = "/list", name = "查询I茅台预约商品列列表")
    public R list() {
        List<IItem> iItems = iItemMapper.selectList();

        return R.ok(iItems);
    }

    /**
     * 刷新i茅台预约商品列表
     */
    @GetMapping(value = "/refresh", name = "刷新i茅台预约商品列表")
    @PreAuthorize("@ss.resourceAuth()")
    public R refreshItem() {
        iShopService.refreshItem();
        return R.ok();
    }

}
