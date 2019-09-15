package com.white.ycli.job;

import com.white.ycli.job.common.BaseJob;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobExecutionContext;

import java.util.Date;

@Slf4j
public class TestJob implements BaseJob {
    @Override
    public void execute(JobExecutionContext context) {
        log.error("TestJob Job 执行时间: {}", new Date().getTime());
    }

}
