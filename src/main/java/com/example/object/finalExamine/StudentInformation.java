package com.example.object.finalExamine;

import lombok.Data;

@Data
public class StudentInformation {
    private Integer id;
    //学号
    private String studentNumber;
    //姓名
    private String studentName;
    //班级
    private String className;
    //课程信息外键
    private String courseId;

}

