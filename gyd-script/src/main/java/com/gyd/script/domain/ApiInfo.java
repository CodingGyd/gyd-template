package com.gyd.script.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.gyd.common.annotation.Excel;
import com.gyd.common.core.domain.BaseEntity;

/**
 * 网站接口信息对象 api_info
 * 
 * @author gyd
 * @date 2024-06-21
 */
public class ApiInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 接口ID */
    private Long apiId;

    /** 网站名称 */
    @Excel(name = "网站名称")
    private String siteName;

    /** 网站地址 */
    @Excel(name = "网站地址")
    private String siteUrl;

    /** 帐号状态（0正常 1停用） */
    @Excel(name = "接口状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 接口名称 */
    @Excel(name = "接口名称")
    private String apiName;

    /** 接口地址 */
    @Excel(name = "接口地址")
    private String apiUrl;

    /** 接口参数 */
    @Excel(name = "接口参数")
    private String apiParams;

    /** 接口请求方式 */
    @Excel(name = "请求方式")
    private String apiMethod;

    /** 请求头 */
    @Excel(name = "请求头")
    private String apiHeaders;

    public void setApiId(Long apiId) 
    {
        this.apiId = apiId;
    }

    public Long getApiId() 
    {
        return apiId;
    }
    public void setSiteName(String siteName) 
    {
        this.siteName = siteName;
    }

    public String getSiteName() 
    {
        return siteName;
    }
    public void setSiteUrl(String siteUrl) 
    {
        this.siteUrl = siteUrl;
    }

    public String getSiteUrl() 
    {
        return siteUrl;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setApiName(String apiName) 
    {
        this.apiName = apiName;
    }

    public String getApiName() 
    {
        return apiName;
    }
    public void setApiUrl(String apiUrl) 
    {
        this.apiUrl = apiUrl;
    }

    public String getApiUrl() 
    {
        return apiUrl;
    }
    public void setApiParams(String apiParams) 
    {
        this.apiParams = apiParams;
    }

    public String getApiParams() 
    {
        return apiParams;
    }
    public void setApiMethod(String apiMethod) 
    {
        this.apiMethod = apiMethod;
    }

    public String getApiMethod() 
    {
        return apiMethod;
    }
    public void setApiHeaders(String apiHeaders) 
    {
        this.apiHeaders = apiHeaders;
    }

    public String getApiHeaders() 
    {
        return apiHeaders;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("apiId", getApiId())
            .append("apiName", getApiName())
            .toString();
    }
}
