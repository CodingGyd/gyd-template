package com.gyd.script.mapper;

import java.util.List;
import com.gyd.script.domain.ApiInfo;

/**
 * 网站接口信息Mapper接口
 * 
 * @author gyd
 * @date 2024-06-21
 */
public interface ApiInfoMapper 
{
    /**
     * 查询网站接口信息
     * 
     * @param apiId 网站接口信息主键
     * @return 网站接口信息
     */
    public ApiInfo selectApiInfoByApiId(Long apiId);

    /**
     * 查询网站接口信息列表
     * 
     * @param apiInfo 网站接口信息
     * @return 网站接口信息集合
     */
    public List<ApiInfo> selectApiInfoList(ApiInfo apiInfo);

    /**
     * 新增网站接口信息
     * 
     * @param apiInfo 网站接口信息
     * @return 结果
     */
    public int insertApiInfo(ApiInfo apiInfo);

    /**
     * 修改网站接口信息
     * 
     * @param apiInfo 网站接口信息
     * @return 结果
     */
    public int updateApiInfo(ApiInfo apiInfo);

    /**
     * 删除网站接口信息
     * 
     * @param apiId 网站接口信息主键
     * @return 结果
     */
    public int deleteApiInfoByApiId(Long apiId);

    /**
     * 批量删除网站接口信息
     * 
     * @param apiIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteApiInfoByApiIds(Long[] apiIds);
}
