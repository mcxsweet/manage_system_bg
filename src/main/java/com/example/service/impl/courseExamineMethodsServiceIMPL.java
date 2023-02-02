package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.courseExamineMethodsMAPPER;

import com.example.object.courseAllInformation;
import com.example.object.courseExamineMethods;
import com.example.service.courseExamineMethodsSERVICE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class courseExamineMethodsServiceIMPL extends ServiceImpl<courseExamineMethodsMAPPER, courseExamineMethods> implements courseExamineMethodsSERVICE {
    @Autowired
    private courseExamineMethodsMAPPER courseExamineMethodsmapper;

    @Override
    public List<courseAllInformation> getAllInformation(int id) {
        System.out.println(courseExamineMethodsmapper.getAllInformation(id));
        return courseExamineMethodsmapper.getAllInformation(id);
    }
}
