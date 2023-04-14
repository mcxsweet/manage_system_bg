package com.example.object.finalExamine;

import lombok.Data;

@Data
public class StudentUsualScore {
    private Integer id;
    //学生id
    private Integer studentId;
    //成绩
    private Integer score;
    //考勤分
    private String attendanceScore;
    //作业成绩
    private String workScore;
    //测试成绩
    private String quizScore;
    //期中测试
    private String midTermScore;

}

