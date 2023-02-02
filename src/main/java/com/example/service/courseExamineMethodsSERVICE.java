package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.object.courseAllInformation;
import com.example.object.courseExamineMethods;

import java.util.List;

public interface courseExamineMethodsSERVICE extends IService<courseExamineMethods> {
    //mapper中添加的方法在此处声明
    //也可以通过@Override重写方法
    List<courseAllInformation> getAllInformation(int id);
}
