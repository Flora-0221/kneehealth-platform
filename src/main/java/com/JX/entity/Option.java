package com.JX.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName("options")
public class Option {
    private Long optionId;
    private Long questionId;
    private String optionText;
    private Integer sectionId;
    private Integer score;
}
