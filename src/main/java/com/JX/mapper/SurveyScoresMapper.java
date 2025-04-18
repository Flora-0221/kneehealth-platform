package com.JX.mapper;

import com.JX.entity.SectionScore;
import com.JX.entity.SurveyScores;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SurveyScoresMapper extends BaseMapper<SurveyScores> {
    @Insert("INSERT INTO survey_scores (user_id, total_score, comment) VALUES (#{userId}, #{totalScore}, #{comment})")
    @Options(useGeneratedKeys = true, keyProperty = "surveyId")  // 指定生成的主键返回
    int insert(SurveyScores surveyScores);
}
