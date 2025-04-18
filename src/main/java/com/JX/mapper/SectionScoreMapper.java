package com.JX.mapper;

import com.JX.entity.SectionScore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SectionScoreMapper extends BaseMapper<SectionScore> {
    @Insert("INSERT INTO section_scores (user_id, section_id, total_score) VALUES (#{userId}, #{sectionId}, #{totalScore})")
    @Options(useGeneratedKeys = true, keyProperty = "scoreId")  // 指定生成的主键返回
    int insert(SectionScore sectionScore);

}