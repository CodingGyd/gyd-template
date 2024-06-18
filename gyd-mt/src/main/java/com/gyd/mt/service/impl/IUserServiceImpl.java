package com.gyd.mt.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.fastjson2.JSONObject;
import com.gyd.common.core.page.PageResult;
import com.gyd.common.exception.ServiceException;
import com.gyd.common.utils.SecurityUtils;
import com.gyd.common.utils.StringUtils;
import com.gyd.mt.entity.IUser;
import com.gyd.mt.mapper.IUserMapper;
import com.gyd.mt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class IUserServiceImpl implements IUserService {
    @Autowired
    private IUserMapper iUserMapper;

    @Override
    public PageResult<IUser> page(IUser iUser) {
        String userName = SecurityUtils.getUsername();
        if (userName != "admin") {
            return iUserMapper.selectPage(iUser, userName);
        }
        return iUserMapper.selectPage(iUser);
    }

    @Override
    public int insertIUser(Long mobile, String deviceId, JSONObject jsonObject) {
        JSONObject data = jsonObject.getJSONObject("data");

        IUser user = iUserMapper.selectById(mobile);

        if (user != null) {
            //存在则更新
            IUser iUser = new IUser(mobile, jsonObject);
            iUser.setCreateBy(SecurityUtils.getUsername());
            BeanUtil.copyProperties(iUser, user);
            return iUserMapper.updateById(user);
        } else {
            if (StringUtils.isEmpty(deviceId)) {
                deviceId = UUID.randomUUID().toString().toLowerCase();
            }
            IUser iUser = new IUser(mobile, deviceId, jsonObject);
            iUser.setCreateBy(SecurityUtils.getUsername());
            return iUserMapper.insert(iUser);
        }


    }

    @Override
    public List<IUser> selectReservationUser() {
        return iUserMapper.selectReservationUser();

    }

    @Override
    public List<IUser> selectReservationUserByMinute(int minute) {
        return iUserMapper.selectReservationUserByMinute(minute);
    }

    @Override
    public int insertIUser(IUser iUser) {

        IUser user = iUserMapper.selectById(iUser.getMobile());
        if (user != null) {
            throw new ServiceException("禁止重复添加");
        }

        if (StringUtils.isEmpty(iUser.getDeviceId())) {
            iUser.setDeviceId(UUID.randomUUID().toString().toLowerCase());
        }
        iUser.setCreateBy(SecurityUtils.getUsername());
        return iUserMapper.insert(iUser);
    }

    @Override
    public int updateIUser(IUser iUser) {
        if (!iUser.getCreateBy().equals(SecurityUtils.getUsername())) {
            throw new ServiceException("只能修改自己创建的用户");
        }
        return iUserMapper.updateById(iUser);
    }

    @Override
    @Async
    public void updateUserMinuteBatch() {
        iUserMapper.updateUserMinuteBatch();
    }

    @Override
    public int deleteIUser(Long[] iUserId) {
        return iUserMapper.deleteIUser(iUserId);
    }
}
