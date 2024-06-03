package com.gydblog.mt.mapper;

import com.gydblog.mt.entity.IAppointRecord;
import com.gydblog.common.core.BaseMapperX;
import com.gydblog.common.core.LambdaQueryWrapperX;
import com.gydblog.common.domain.PageResult;
import org.apache.ibatis.annotations.Select;

/**
 * 预约日志Mapper接口
 *
 * @author oddfar
 * @date 2023-10-024
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
