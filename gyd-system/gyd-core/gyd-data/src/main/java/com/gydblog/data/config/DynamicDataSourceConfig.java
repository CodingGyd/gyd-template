package com.gydblog.data.config;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure;
import com.baomidou.dynamic.datasource.processor.DsProcessor;
import com.baomidou.dynamic.datasource.provider.DynamicDataSourceProvider;
import com.gydblog.data.config.datasource.DruidDataSourceProperties;
import com.gydblog.data.config.datasource.JdbcDynamicDataSourceProvider;
import com.gydblog.data.config.datasource.LastParamDsProcessor;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * <p>
 * 动态数据源切换配置
 */
@Configuration
@AllArgsConstructor
@AutoConfigureAfter(DataSourceAutoConfiguration.class)
@EnableAutoConfiguration(exclude = {DruidDataSourceAutoConfigure.class})
public class DynamicDataSourceConfig {

    private final DruidDataSourceProperties properties;

    @Bean
    public DynamicDataSourceProvider dynamicDataSourceProvider() {
        return new JdbcDynamicDataSourceProvider(properties);
    }

    @Bean
    public DsProcessor dsProcessor() {
        return new LastParamDsProcessor();
    }
}
