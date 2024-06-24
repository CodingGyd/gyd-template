package com.gyd.script.task;


import com.gyd.script.domain.ApiInfo;
import com.gyd.script.service.IApiInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;


/**
 * 网站自动化定时任务
 */
@Component("toolTask")
public class ToolTask {
    private static final Logger logger = LoggerFactory.getLogger(ToolTask.class);

    @Autowired
    IApiInfoService apiInfoService;
    public void run() {
        // 这里写任务逻辑
        logger.info("「开始执行网站自动化脚本]  ");
        List<ApiInfo> apiInfos = apiInfoService.selectApiInfoList(new ApiInfo());

        if (!CollectionUtils.isEmpty(apiInfos)) {
            try {
                for (ApiInfo apiInfo : apiInfos) {
                    String result = apiInfoService.exec(apiInfo);
                    logger.info("[网站信息:{}], 执行结果: {}",apiInfo.getApiName(), result);
                }
            } catch (Exception e) {
                logger.info("「网站自动化脚本报错」%s", e.getMessage());
                throw new RuntimeException("「网站自动化脚本报错」"+e.getMessage());
            }
        }

    }
}
