package com.JX.dto;

import com.JX.entity.Option;
import com.JX.entity.Question;
import lombok.Data;

import java.util.List;

@Data
public class QuestionWithOptions {
    private Question question;
    private List<Option> options;
}