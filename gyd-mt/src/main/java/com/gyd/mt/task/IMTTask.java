package com.gyd.mt.task;

import com.gyd.mt.service.IMTService;
import com.gyd.mt.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * i茅台定时任务
 */
@Configuration
@EnableScheduling
//@Component("imtTask")
public class IMTTask {
    private static final Logger logger = LoggerFactory.getLogger(IMTTask.class);

    @Autowired
    private IMTService imtService;
    @Autowired
    private IUserService iUserService;


    /**
     * 1：10 批量修改用户随机预约的时间
     */
    @Async
    @Scheduled(cron = "0 10 1 ? * * ")
    public void updateUserMinuteBatch() {
        logger.info("job-updateUserMinuteBatch-begin");
        iUserService.updateUserMinuteBatch();
        logger.info("job-updateUserMinuteBatch-end");
    }


    /**
     * 11点期间，每分钟执行一次批量获得旅行奖励
     */
    @Async
    @Scheduled(cron = "0 0/1 11 ? * *")
    public void getTravelRewardBatch() {
        logger.info("job-getTravelRewardBatch-begin");
        imtService.getTravelRewardBatch();
        logger.info("job-getTravelRewardBatch-end");

    }

    /**
     * 9点期间，每分钟执行一次
     */
    @Async
    @Scheduled(cron = "0 0/1 9 ? * *")
    public void reservationBatchTask() {
        logger.info("job-reservationBatchTask-begin");
        imtService.reservationBatch();
        logger.info("job-reservationBatchTask-end");
    }


    @Async
    @Scheduled(cron = "0 10,55 7,8 ? * * ")
    public void refresh() {
        logger.info("「刷新数据」开始刷新版本号，预约item，门店shop列表  ");
        try {
            imtService.refreshAll();
        } catch (Exception e) {
            logger.info("「刷新数据执行报错」%s", e.getMessage());
        }

    }


    /**
     * 18.05分获取申购结果
     */
    @Async
    @Scheduled(cron = "0 5 18 ? * * ")
    public void appointmentResults() {
        imtService.appointmentResults();
    }


}