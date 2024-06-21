package com.gyd.script.service.impl;

import java.util.List;
import com.gyd.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gyd.script.mapper.ApiInfoMapper;
import com.gyd.script.domain.ApiInfo;
import com.gyd.script.service.IApiInfoService;

/**
 * 网站接口信息Service业务层处理
 * 
 * @author gyd
 * @date 2024-06-21
 */
@Service
public class ApiInfoServiceImpl implements IApiInfoService 
{
    @Autowired
    private ApiInfoMapper apiInfoMapper;

    /**
     * 查询网站接口信息
     * 
     * @param apiId 网站接口信息主键
     * @return 网站接口信息
     */
    @Override
    public ApiInfo selectApiInfoByApiId(Long apiId)
    {
        return apiInfoMapper.selectApiInfoByApiId(apiId);
    }

    /**
     * 查询网站接口信息列表
     * 
     * @param apiInfo 网站接口信息
     * @return 网站接口信息
     */
    @Override
    public List<ApiInfo> selectApiInfoList(ApiInfo apiInfo)
    {
        return apiInfoMapper.selectApiInfoList(apiInfo);
    }

    /**
     * 新增网站接口信息
     * 
     * @param apiInfo 网站接口信息
     * @return 结果
     */
    @Override
    public int insertApiInfo(ApiInfo apiInfo)
    {
        apiInfo.setCreateTime(DateUtils.getNowDate());
        return apiInfoMapper.insertApiInfo(apiInfo);
    }

    /**
     * 修改网站接口信息
     * 
     * @param apiInfo 网站接口信息
     * @return 结果
     */
    @Override
    public int updateApiInfo(ApiInfo apiInfo)
    {
        apiInfo.setUpdateTime(DateUtils.getNowDate());
        return apiInfoMapper.updateApiInfo(apiInfo);
    }

    /**
     * 批量删除网站接口信息
     * 
     * @param apiIds 需要删除的网站接口信息主键
     * @return 结果
     */
    @Override
    public int deleteApiInfoByApiIds(Long[] apiIds)
    {
        return apiInfoMapper.deleteApiInfoByApiIds(apiIds);
    }

    /**
     * 删除网站接口信息信息
     * 
     * @param apiId 网站接口信息主键
     * @return 结果
     */
    @Override
    public int deleteApiInfoByApiId(Long apiId)
    {
        return apiInfoMapper.deleteApiInfoByApiId(apiId);
    }
}
