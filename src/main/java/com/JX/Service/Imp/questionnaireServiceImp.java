package com.JX.Service.Imp;

import com.JX.Service.QuestionnaireService;
import com.JX.dto.QuestionWithOptions;
import com.JX.dto.SurveyResultDTO;
import com.JX.dto.UserAnswerDTO;
import com.JX.entity.*;
import com.JX.mapper.*;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class questionnaireServiceImp extends ServiceImpl<questionnaireMapper, Questionnaire> implements QuestionnaireService {

    @Autowired
    private UserAnswersMapper userAnswersMapper; // Mapper for UserAnswer

    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private SurveyScoresMapper surveyScoresMapper;

    @Autowired
    private SectionScoreMapper sectionScoreMapper; // Mapper for SectionScore

    @Autowired
    private OptionMapper optionMapper; // 注入 OptionMapper

    public Integer recordUserAnswer(Long userId, Long questionId[], String optionText[]) {
        int totalScore = 0;
        int sectionId =0;
        for(int i = 0;i<questionId.length;i++){
            Option option = optionMapper.findByQuestionIdAndOptionText(questionId[i], optionText[i]);
            Integer score = option.getScore();
            totalScore += score;
            sectionId = option.getSectionId();
        }

        // 先保存条目到 section_score 表
        SectionScore sectionScore = new SectionScore()
                .setUserId(userId)
                .setSectionId(sectionId)
                .setTotalScore(totalScore);
        sectionScoreMapper.insert(sectionScore);
        Integer scoreId = sectionScore.getScoreId();
        System.out.println("获得的ID是："+scoreId);

        for(int i = 0;i<questionId.length;i++){
            // 通过 questionId 和 optionText 获取选项
            Option option = optionMapper.findByQuestionIdAndOptionText(questionId[i], optionText[i]);
            if (option == null) {
                throw new IllegalArgumentException("Invalid option text for the given question");
            }
            Integer score = option.getScore();
            // 构造用户答案对象并保存
            UserAnswerDTO userAnswer = new UserAnswerDTO()
                    .setUserId(userId)
                    .setQuestionId(questionId[i])
                    .setScore(score)
                    .setOptionId(option.getOptionId())
                    .setScoreId(scoreId)
                    .setSectionId(option.getSectionId());
            userAnswersMapper.insert(userAnswer);
        }
        return scoreId;
    }

    public Integer getSectionScore(Long userId, Long scoreId){
        SectionScore sectionScore = sectionScoreMapper.selectById(scoreId);
        Integer totalScore = sectionScore.getTotalScore();
        return totalScore;
    }

    @Override
    public SurveyResultDTO getUserResult(Long userId, Long scoreId[]) {

        SurveyResultDTO surveyResultDTO = new SurveyResultDTO();
        SectionScore[] sectionScores = new SectionScore[scoreId.length];
        int totalScore = 0;
        for(int i = 0 ;i<scoreId.length;i++){
            totalScore += sectionScoreMapper.selectById(scoreId[i]).getTotalScore();
        }
        SurveyScores surveyScores = new SurveyScores()
                .setUserId(userId)
                .setTotalScore(totalScore);

        surveyScoresMapper.insert(surveyScores);
        Integer surveyId = surveyScores.getSurveyId();
        System.out.println("返回的问卷结果id" + surveyId);

        for(int i = 0;i<scoreId.length;i++){
            SectionScore sectionScore = sectionScoreMapper.selectById(scoreId[i]);
            System.out.println("获得的score section是"+ sectionScore);
            sectionScores[i] = sectionScore;
            System.out.println("设置的数组中的值为"+ sectionScores[i] + i);
            sectionScore.setSurveyId(surveyId);
            // 创建一个更新条件包装器
            UpdateWrapper<SectionScore> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("score_id", sectionScore.getScoreId()); // 指定更新条件，例如 id = 当前 sectionScore 的 id

            // 调用 update 方法，传入实体对象和更新条件包装器
            sectionScoreMapper.update(sectionScore, updateWrapper);

        }
        surveyResultDTO.setSectionScores(sectionScores);
        surveyResultDTO.setSurveyScores(surveyScores);
        return surveyResultDTO;
    }

    @Override
    public Integer calculateTotalScore(Long userId, Long sectionId) {
        // 计算用户在某部分的总分数
//        List<UserAnswerDTO> answers = getUserAnswers(userId, sectionId);
//        int totalScore = answers.stream().mapToInt(UserAnswerDTO::getScore).sum();

        // 保存总分数到部分得分表
//        SectionScore sectionScore = new SectionScore()
//                .setUserId(userId)
//                .setSectionId(sectionId)
//                .setTotalScore(totalScore);
//        sectionScoreMapper.insert(sectionScore);

        return 0;
    }

    @Override
    public List<QuestionWithOptions> getQuestionsAndOptionsBySectionId(Long sectionId) {
        List<QuestionWithOptions> result = new ArrayList<>();

        // 获取该 section 的所有问题
        List<Question> questions = questionMapper.selectQuestionsBySectionId(sectionId);

        for (Question question : questions) {
            // 获取每个问题的选项
            List<Option> options = optionMapper.selectOptionsByQuestionId(question.getQuestionId());

            // 将问题和选项封装到 QuestionWithOptions 中
            QuestionWithOptions questionWithOptions = new QuestionWithOptions();
            questionWithOptions.setQuestion(question);
            questionWithOptions.setOptions(options);

            result.add(questionWithOptions);
        }

        return result;
    }
}
