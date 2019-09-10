package com.white.ycli.mapper;

import com.white.ycli.YcliApplicationTests;
import com.white.ycli.model.Job;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.junit.Assert;


import java.util.List;

@Slf4j
public class JobMapperTest extends YcliApplicationTests {
    @Autowired
    private JobMapper jobMapper;

    @Test
    public void selectAddJob () {

//        Assert.assertTrue();
        Job job = Job.builder()
                .url("test")
                .params("{}")
                .excute_time("20 * * *")
                .project_id(new Long(232))
                .build();
        int res = jobMapper.saveJob(job);
        Assert.assertEquals(1, res);

        List<Job> jobList = jobMapper.selectAllJobs();
        log.info("【jobList】= {}", jobList);
        Assert.assertTrue(jobList.size() >= 1);
    }
}
