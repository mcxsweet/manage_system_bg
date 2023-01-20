package com.example.object;

import lombok.Data;

@Data
public class courseExamineMethods {
    private int id;
    //课程基本信息表中的id
    private int course_id;
    //课程名称
    private String course_name;
    //考试项目
    private String examine_item;
    //所占百分比
    private int percentage;
}
