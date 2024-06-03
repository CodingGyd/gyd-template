package com.gydblog.base.api.mail;

import com.gydblog.base.api.mail.Impl.MailServiceImpl;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ZyMailAutoConfig {


    /**
     * mail发送邮件接口
     *
     */
    @Bean
    @ConditionalOnMissingBean(MailSendApi.class)
    public MailSendApi mailSenderApi() {
        return new MailServiceImpl();
    }
}
