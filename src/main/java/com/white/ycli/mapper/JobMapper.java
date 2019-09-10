package com.white.ycli.mapper;

import com.white.ycli.model.Job;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface JobMapper {
    /**
     * 查询所有任务
     *
     * @return 任务列表
     */
    @Select("SELECT * FROM orm_job")
    List<Job> selectAllJobs();

    /**
     * 根据id查询任务
     *
     * @param id 主键id
     * @return 当前id的任务，不存在则是 {@code null}
     */
    @Select("SELECT * FROM orm_job WHERE id = #{id}")
    Job selectJobById(@Param("id") Long id);

    int saveJob(@Param("job") Job job);
}
