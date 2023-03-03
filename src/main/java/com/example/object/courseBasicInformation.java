package com.example.object;

import lombok.Data;

@Data
public class courseBasicInformation {
    private Integer id;
    //课程名称
    private String courseName;
    //任课教师id
    private int teacherId;
    //任课教师
    private String classroomTeacher;
    //理论时长
    private int theoreticalHours;
    //实验学识
    private int labHours;
    //班级名称
    private String className;
    //学期
    private String term;
    //学生人数
    private int studentsNum;
    //课程性质
    private String courseNature;
    //课程类别
    private String courseType;
    //课程目标数量
    private int courseTargetNum;
    //指标点数量
    private int indicatorPointsNum;
    //指标点编号
    private String indicatorPoints;

}
