package com.JX.mapper;

import com.JX.dto.UserAnswerDTO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserAnswersMapper extends BaseMapper<UserAnswerDTO> {
    List<UserAnswerDTO> selectByUserIdAndSectionId(@Param("userId") Long userId, @Param("sectionId") Long sectionId);
}