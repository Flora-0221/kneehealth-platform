package com.JX.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)

public class Questionnaire {
    private Long sectionId;
    private String sectionName;
    private String description;
}
