package com.JX.mapper;

import com.JX.entity.Questionnaire;
import com.JX.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface questionnaireMapper extends BaseMapper<Questionnaire> {
}
