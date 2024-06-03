package com.gydblog.mt.controller;

import com.gydblog.common.enums.ResBizTypeEnum;
import com.gydblog.mt.entity.IShop;
import com.gydblog.mt.mapper.IShopMapper;
import com.gydblog.mt.service.IShopService;
import com.gydblog.common.annotation.ApiResource;
import com.gydblog.common.domain.PageResult;
import com.gydblog.common.domain.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * i茅台商品Controller
 **/
@RestController
@RequestMapping("/imt/shop")
@ApiResource(name = "I茅台商品管理", resBizType = ResBizTypeEnum.BUSINESS)
public class IShopController {
    @Autowired
    private IShopService iShopService;
    @Autowired
    private IShopMapper iShopMapper;

    /**
     * 查询i茅台商品列表
     */
    @GetMapping("/list")
    public R list(IShop iShop) {
        PageResult<IShop> page = iShopMapper.selectPage(iShop);

        return R.ok().put(page);
    }


    /**
     * 刷新i茅台商品列表
     */
    @GetMapping(value = "/refresh", name = "刷新i茅台商品列表")
    @PreAuthorize("@ss.resourceAuth()")
    public R refreshShop() {
        iShopService.refreshShop();
        return R.ok();
    }

}
