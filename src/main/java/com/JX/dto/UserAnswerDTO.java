package com.JX.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.security.Timestamp;
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName("user_answers")
public class UserAnswerDTO {
    private Long answerId;
    private Long userId;
    private Long questionId;
    private Long optionId;
    private Integer score;
    private Integer sectionId;
    private Integer scoreId;
    private Timestamp answeredAt;

}
