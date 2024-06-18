package com.gyd.mt.controller;


import com.gyd.common.core.domain.AjaxResult;
import com.gyd.common.core.page.PageResult;
import com.gyd.common.exception.ServiceException;
import com.gyd.common.utils.StringUtils;
import com.gyd.mt.entity.IShop;
import com.gyd.mt.entity.IUser;
import com.gyd.mt.mapper.IUserMapper;
import com.gyd.mt.service.IMTService;
import com.gyd.mt.service.IShopService;
import com.gyd.mt.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = "i茅台用户接口")
@RestController
@RequestMapping("/imt/user")
public class IUserController {
    @Autowired
    private IUserService iUserService;
    @Autowired
    private IUserMapper iUserMapper;
    @Autowired
    private IMTService imtService;
    @Autowired
    private IShopService iShopService;

    @GetMapping(value = "/list", name = "查询I茅台用户列表")
//    @PreAuthorize("@ss.resourceAuth()")
    @ApiOperation("查询i茅台用户列表")
    public AjaxResult list(IUser iUser) {
        PageResult<IUser> page = iUserService.page(iUser);

        return AjaxResult.success(page);
    }

    @GetMapping(value = "/sendCode", name = "发送验证码")
    @ApiOperation("发送验证码")
//    @PreAuthorize("@ss.resourceAuth()")
    public AjaxResult sendCode(String mobile, String deviceId) {
        imtService.sendCode(mobile, deviceId);

        return AjaxResult.success();
    }

    @GetMapping(value = "/reservation", name = "预约")
    @ApiOperation("预约")
//    @PreAuthorize("@ss.resourceAuth()")
    public AjaxResult reservation(String mobile) {
        IUser user = iUserMapper.selectById(mobile);
        if (user == null) {
            return AjaxResult.error("用户不存在");
        }
        if (StringUtils.isEmpty(user.getItemCode())) {
            return AjaxResult.error("商品预约code为空");
        }

        imtService.reservation(user);
        return AjaxResult.success();
    }


    @GetMapping(value = "/travelReward", name = "旅行")
    @ApiOperation("小茅运旅行活动")
//    @PreAuthorize("@ss.resourceAuth()")
    public AjaxResult travelReward(String mobile) {
        IUser user = iUserMapper.selectById(mobile);
        if (user == null) {
            return AjaxResult.error("用户不存在");
        } else {
            imtService.getTravelReward(user);
            return AjaxResult.success();
        }
    }

    @GetMapping(value = "/login", name = "登录")
    @ApiOperation("登录")
//    @PreAuthorize("@ss.resourceAuth()")
    public AjaxResult login(String mobile, String code, String deviceId) {
        imtService.login(mobile, code, deviceId);

        return AjaxResult.success();
    }

//    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "/{mobile}", name = "获取I茅台用户详细信息")
    @ApiOperation("获取i茅台用户详细信息")
    public AjaxResult getInfo(@PathVariable("mobile") Long mobile) {
        return AjaxResult.success(iUserMapper.selectById(mobile));
    }

//    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping(name = "新增I茅台用户")
    @ApiOperation("新增i茅台用户")
    public AjaxResult add(@RequestBody IUser iUser) {

        IShop iShop = iShopService.selectByIShopId(iUser.getIshopId());
        if (iShop == null) {
            throw new ServiceException("商品门店ID不存在");
        }
        iUser.setLng(iShop.getLng());
        iUser.setLat(iShop.getLat());
        iUser.setProvinceName(iShop.getProvinceName());
        iUser.setCityName(iShop.getCityName());

        return AjaxResult.success(iUserService.insertIUser(iUser));
    }

//    @PreAuthorize("@ss.resourceAuth()")
    @PutMapping(name = "修改I茅台用户")
    @ApiOperation("修改i茅台用户")
    public AjaxResult edit(@RequestBody IUser iUser) {
        IShop iShop = iShopService.selectByIShopId(iUser.getIshopId());
        if (iShop == null) {
            throw new ServiceException("商品门店ID不存在");
        }
        iUser.setLng(iShop.getLng());
        iUser.setLat(iShop.getLat());
        iUser.setProvinceName(iShop.getProvinceName());
        iUser.setCityName(iShop.getCityName());
        return AjaxResult.success(iUserService.updateIUser(iUser));
    }

//    @PreAuthorize("@ss.resourceAuth()")
    @DeleteMapping(value = "/{mobiles}", name = "删除I茅台用户")
    @ApiOperation("删除i茅台用户")
    public AjaxResult remove(@PathVariable Long[] mobiles) {
        return AjaxResult.success(iUserMapper.deleteIUser(mobiles));
    }
}
