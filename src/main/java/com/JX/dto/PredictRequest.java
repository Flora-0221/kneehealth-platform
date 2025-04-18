package com.JX.dto;

import lombok.Data;

@Data
public class PredictRequest {
    private double[] dataInput;  // 输入样本
//    private String modelDir;       // 模型目录
}
