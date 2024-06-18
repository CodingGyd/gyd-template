package com.gyd.mt.mapper;

import com.gyd.common.core.BaseMapperX;
import com.gyd.common.core.LambdaQueryWrapperX;
import com.gyd.common.core.page.PageResult;
import com.gyd.mt.entity.IAppointRecord;
import org.apache.ibatis.annotations.Select;

/**
 * 预约日志Mapper接口
 */
public interface IAppointRecordMapper extends BaseMapperX<IAppointRecord> {

    default PageResult<IAppointRecord> selectPage(IAppointRecord iAppointRecord) {

        return selectPage(new LambdaQueryWrapperX<IAppointRecord>()
                .eqIfPresent(IAppointRecord::getMobile, iAppointRecord.getMobile())
                .eqIfPresent(IAppointRecord::getRecordType, iAppointRecord.getRecordType())
                .eqIfPresent(IAppointRecord::getStatus, iAppointRecord.getStatus())
                .eqIfPresent(IAppointRecord::getRecordDate, iAppointRecord.getRecordDate())
                .orderByDesc(IAppointRecord::getRecordTime)
        );

    }

    default IAppointRecord selectOne(IAppointRecord iAppointRecord) {

        return selectOne(new LambdaQueryWrapperX<IAppointRecord>()
                .eqIfPresent(IAppointRecord::getUserId, iAppointRecord.getUserId())
                .eqIfPresent(IAppointRecord::getRecordType, iAppointRecord.getRecordType())
                .eqIfPresent(IAppointRecord::getRecordDate, iAppointRecord.getRecordDate())
        );

    }
    default PageResult<IAppointRecord> selectPage(IAppointRecord iAppointRecord, Long userId) {

        return selectPage(new LambdaQueryWrapperX<IAppointRecord>()
                .eqIfPresent(IAppointRecord::getMobile, iAppointRecord.getMobile())
                .eqIfPresent(IAppointRecord::getRecordType, iAppointRecord.getRecordType())
                .eqIfPresent(IAppointRecord::getStatus, iAppointRecord.getStatus())
                .eqIfPresent(IAppointRecord::getRecordDate, iAppointRecord.getRecordDate())
                .eq(IAppointRecord::getUserId, userId)
                .orderByDesc(IAppointRecord::getRecordTime)
        );

    }

    @Select("truncate table i_log")
    void cleanRecord();

}
