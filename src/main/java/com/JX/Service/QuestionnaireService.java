package com.JX.Service;

import com.JX.dto.QuestionWithOptions;
import com.JX.dto.SurveyResultDTO;
import com.JX.dto.UserAnswerDTO;

import java.util.List;

public interface QuestionnaireService {
 Integer recordUserAnswer(Long userId, Long questionId[], String options[]);
    SurveyResultDTO getUserResult(Long userId, Long scoreId[]);
    Integer calculateTotalScore(Long userId, Long sectionId);
    Integer getSectionScore(Long userId, Long scoreId);
    List<QuestionWithOptions> getQuestionsAndOptionsBySectionId(Long sectionId);
}
