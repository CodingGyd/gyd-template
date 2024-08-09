package com.gyd.system.service.impl;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.TypeReference;
import com.gyd.common.utils.DateUtils;
import com.gyd.common.utils.http.OkHttpUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gyd.system.mapper.ApiInfoMapper;
import com.gyd.system.domain.ApiInfo;
import com.gyd.system.service.IApiInfoService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 网站接口信息Service业务层处理
 * 
 * @author gyd
 * @date 2024-06-21
 */
@Service
@Slf4j
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
    @Transactional(isolation = Isolation.READ_COMMITTED)
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

    @Override
    public String exec(ApiInfo apiInfo) {
        Map<String,String> headers = JSONObject.parseObject(apiInfo.getApiHeaders(), new TypeReference<Map<String,String>>() {
        });
        Map<String,Object> apiParams = JSONObject.parseObject(apiInfo.getApiParams(), new TypeReference<Map<String,Object>>() {
        });
        String result = OkHttpUtils.executePostRequestV2(apiInfo.getApiUrl(),headers,apiParams);
        log.info("exec 结果："+result);
        return result;
    }
}
