package com.example.object;

import lombok.Data;

@Data
public class courseExamineChildMethods {
    private int id;
    //课程考核方式表中的id
    private int courseExamineMethodsId;
    //考核子项目
    private String examineChildItem;
    //所占百分比
    private int percentage;
    //课程目标（json）
    private String courseTarget;
    //指标点（json）
    private String indicatorPoints;
}
