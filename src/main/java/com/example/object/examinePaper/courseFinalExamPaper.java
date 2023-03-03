package com.example.object.examinePaper;

import lombok.Data;

@Data
public class courseFinalExamPaper {
    private Integer id;
    //外键链接课程基本信息表
    private int courseId;
    //项目名称
    private String itemName;
    //项目分数
    private int itemScore;
    //类型 0（试卷） 1（实验） 2（平时考核）
    private int type;

}

