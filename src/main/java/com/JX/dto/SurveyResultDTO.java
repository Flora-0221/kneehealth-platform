package com.JX.dto;

import com.JX.entity.SectionScore;
import com.JX.entity.SurveyScores;
import lombok.Data;

@Data
public class SurveyResultDTO {
    SectionScore[] sectionScores;
    SurveyScores surveyScores;
}
