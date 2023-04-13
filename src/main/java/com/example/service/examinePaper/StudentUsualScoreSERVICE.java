package com.example.service.examinePaper;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.object.finalExamine.StudentScore;
import com.example.object.finalExamine.StudentUsualScore;

import java.util.List;

public interface StudentUsualScoreSERVICE extends IService<StudentUsualScore> {
    //mapper中添加的方法在此处声明
    //也可以通过@Override重写方法
    List<StudentScore> getAllStudent(int courseId);
}
