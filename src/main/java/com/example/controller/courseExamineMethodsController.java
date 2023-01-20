package com.example.controller;

import com.example.service.impl.courseExamineMethodsServiceIMPL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/courseExam")
public class courseExamineMethodsController {
    //课程考核项目
    @Autowired
    private courseExamineMethodsServiceIMPL courseExamineMethodsService;
}
