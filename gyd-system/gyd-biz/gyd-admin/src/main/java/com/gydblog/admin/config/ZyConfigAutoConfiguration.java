package com.gydblog.admin.config;

import com.gydblog.base.service.SysConfigService;
import com.gydblog.base.service.impl.SysConfigServiceImpl;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 系统配置自动配置
 */
@Configuration
public class ZyConfigAutoConfiguration {

    @Bean
    @ConditionalOnMissingBean(SysConfigService.class)
    public SysConfigService configService() {
        return new SysConfigServiceImpl();
    }
}
