package com.JX.mapper;

import com.JX.entity.Option;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OptionMapper extends BaseMapper<Option> {
    @Select("SELECT * FROM options WHERE question_id = #{questionId} AND option_text = #{optionText}")
    Option findByQuestionIdAndOptionText(@Param("questionId") Long questionId, @Param("optionText") String optionText);

    @Select("SELECT * FROM options WHERE question_id = #{questionId}")
    List<Option> selectOptionsByQuestionId(Long questionId);

}