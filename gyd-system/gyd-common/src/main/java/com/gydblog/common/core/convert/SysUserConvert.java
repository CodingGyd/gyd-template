package com.gydblog.common.core.convert;


import com.gydblog.common.domain.entity.SysUserEntity;
import com.gydblog.common.domain.vo.SysUserVO;
import org.apache.ibatis.annotations.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
*
* @author 致远
*/
@Mapper
public interface SysUserConvert {
    SysUserConvert INSTANCE = Mappers.getMapper(SysUserConvert.class);

    SysUserEntity convert(SysUserVO vo);

    SysUserVO convert(SysUserEntity entity);

    List<SysUserVO> convertList(List<SysUserEntity> list);

}