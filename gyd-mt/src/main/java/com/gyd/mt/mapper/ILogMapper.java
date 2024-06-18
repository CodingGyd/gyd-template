package com.gyd.mt.mapper;

import com.gyd.common.core.BaseMapperX;
import com.gyd.common.core.LambdaQueryWrapperX;
import com.gyd.common.core.page.PageResult;
import com.gyd.mt.entity.ILog;
import org.apache.ibatis.annotations.Select;

/**
 * I茅台日志Mapper接口
 */
public interface ILogMapper extends BaseMapperX<ILog> {

    default PageResult<ILog> selectPage(ILog iLog) {

        return selectPage(new LambdaQueryWrapperX<ILog>()
                .eqIfPresent(ILog::getMobile, iLog.getMobile())
                .eqIfPresent(ILog::getStatus, iLog.getStatus())
                .betweenIfPresent(ILog::getOperTime, iLog.getParams())
                .orderByDesc(ILog::getLogId)
        );

    }

    default PageResult<ILog> selectPage(ILog iLog, String userName) {

        return selectPage(new LambdaQueryWrapperX<ILog>()
                .eqIfPresent(ILog::getMobile, iLog.getMobile())
                .eqIfPresent(ILog::getStatus, iLog.getStatus())
                .eq(ILog::getCreateBy, userName)
                .betweenIfPresent(ILog::getOperTime, iLog.getParams())
                .orderByDesc(ILog::getLogId)
        );

    }

    @Select("truncate table i_log")
    void cleanLog();

}
