package com.JX.controller;

import com.JX.Service.QuestionnaireService;
import com.JX.dto.*;
import com.JX.utils.UserHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/questionnaire")
@CrossOrigin(origins = "*") // 允许所有域名的请求
@Slf4j
public class questionnaireController {
    @Autowired
    private QuestionnaireService questionnaireService;

    /**
     * 根据用户传入的questionId 和 options 数组记录用户的答案
     * @param userAnswer
     * @return
     */
    @PostMapping("/answer")
    public Result recordAnswer(@RequestBody UserAns userAnswer) {
        Long questionId[] = userAnswer.getQuestionId();
        String options[] = userAnswer.getOptions();
        Long userId = UserHolder.getUser().getId();
        Integer scoreId = questionnaireService.recordUserAnswer(userId, questionId, options);
        return Result.ok(scoreId);
    }

    /**
     * 接收不同section——score的ID 存储入一张表单问卷总表 方便查询记录 返回成绩信息
     * @param scoreId
     * @return 用户的结果
     */
    @GetMapping("/result")
    public Result getUserResult(@RequestParam Long scoreId[]) {
        Long userId = UserHolder.getUser().getId();
        SurveyResultDTO userResult = questionnaireService.getUserResult(userId, scoreId);
        return Result.ok(userResult);
    }

    /**
     * 接收这个section——score的ID 展示这个部分的score
     * @param scoreId
     * @return
     */
    @GetMapping("/score")
    public Result getTotalScore(@RequestParam Long scoreId) {
        Long userId = UserHolder.getUser().getId();
        Integer totalScore = questionnaireService.getSectionScore(userId, scoreId);
        return Result.ok(totalScore);
    }

    /**
     * 获得所有的questions
     * @param sectionId
     * @return
     */
    @GetMapping("/questions")
    public Result getQuestionsAndOptionsBySectionId(@RequestParam Long sectionId) {
        return Result.ok(questionnaireService.getQuestionsAndOptionsBySectionId(sectionId));
    }
}
