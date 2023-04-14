package com.example.object.finalExamine;

import lombok.Data;

@Data
public class StudentScore {
    private Integer id;
    //学号
    private String studentNumber;
    //姓名
    private String studentName;
    //班级
    private String className;
    //课程信息外键
    private String courseId;
    //成绩
    private String attendanceScore;
    private String workScore;
    private String quizScore;
    private String midTermScore;
    //成绩表id
    private Integer usualScoreId;
}

