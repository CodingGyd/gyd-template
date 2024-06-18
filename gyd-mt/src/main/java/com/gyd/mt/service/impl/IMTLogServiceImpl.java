package com.gyd.mt.service.impl;

import com.gyd.common.core.page.PageResult;
import com.gyd.common.utils.SecurityUtils;
import com.gyd.mt.entity.ILog;
import com.gyd.mt.mapper.ILogMapper;
import com.gyd.mt.service.IMTLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
public class IMTLogServiceImpl implements IMTLogService {

    @Autowired
    private ILogMapper logMapper;

    @Override
    public PageResult<ILog> page(ILog iLog) {
        String userName = SecurityUtils.getUsername();
        if (userName != "admin") {
            return logMapper.selectPage(iLog, userName);
        }
        return logMapper.selectPage(iLog);
    }


    @Override
    public int deleteLogByIds(Long[] operIds) {
        return logMapper.deleteBatchIds(Arrays.asList(operIds));
    }

    @Override
    public void cleanLog() {
        logMapper.cleanLog();
    }

    @Override
    public int insertLog(ILog iLog) {
        return logMapper.insert(iLog);
    }
}
