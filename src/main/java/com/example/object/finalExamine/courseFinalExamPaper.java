package com.example.object.finalExamine;

import lombok.Data;

@Data
public class courseFinalExamPaper {
    private Integer id;
    //外键链接课程基本信息表
    private int examMethodId;
    //项目名称
    private String itemName;
    //项目分数
    private int itemScore;
}

