package com.example.object.finalExamine;

import lombok.Data;

@Data
public class StudentInformation {
    protected Integer id;
    //学号
    protected String studentNumber;
    //姓名
    protected String studentName;
    //班级
    protected String className;
    //课程信息外键
    protected String courseId;
}

