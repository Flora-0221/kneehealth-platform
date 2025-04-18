package com.JX.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.security.Timestamp;

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName("survey_scores")
@NoArgsConstructor
@AllArgsConstructor
public class SurveyScores {
    @TableId(value = "survey_id")
    private int surveyId;
    private Long userId;
    private int totalScore;
    private String comment;
    private Timestamp scoredAt;
}
