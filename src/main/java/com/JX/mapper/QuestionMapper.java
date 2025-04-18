package com.JX.mapper;

import com.JX.entity.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;

@Mapper
public interface QuestionMapper {
    @Select("SELECT * FROM questions WHERE section_id = #{sectionId}")
    List<Question> selectQuestionsBySectionId(Long sectionId);
}
