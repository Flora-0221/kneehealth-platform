package com.JX.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;

import java.security.Timestamp;
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName("section_scores")
@NoArgsConstructor
@AllArgsConstructor
public class SectionScore {
    @TableId(value = "score_id")
    private int scoreId;
    private Long userId;
    private int sectionId;
    private int totalScore;
    private int surveyId;
    private Timestamp scoredAt;

}
