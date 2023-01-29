package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.object.courseExamineChildMethods;
import com.example.object.courseExamineMethods;
import com.example.service.impl.courseExamineChildMethodsServiceIMPL;
import com.example.service.impl.courseExamineMethodsServiceIMPL;
import com.example.utility.DataResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/courseExam")
public class courseExamineMethodsController {
    //课程考核项目
    @Autowired
    private courseExamineMethodsServiceIMPL courseExamineMethodsService;

    //课程考核子项目
    @Autowired
    private courseExamineChildMethodsServiceIMPL courseExamineChildMethodsService;

    //提供课程id查询考核项目
    @GetMapping("/courseExamineMethods/{courseId}")
    public DataResponses getCourseExamineMethodsById(@PathVariable int courseId) {
        QueryWrapper<courseExamineMethods> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("course_id", courseId);
        return new DataResponses(true, courseExamineMethodsService.list(QueryWrapper));
    }

    //提供考核项目id查询子考核项目
    @GetMapping("/courseExamineChildMethods/{courseExamineMethodsId}")
    public DataResponses getCourseExamineChildMethodsById(@PathVariable int courseExamineMethodsId) {
        QueryWrapper<courseExamineChildMethods> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("course_examine_methods_id", courseExamineMethodsId);
        return new DataResponses(true, courseExamineChildMethodsService.list(QueryWrapper));
    }

    //提供课程id添加考核项目
    @PostMapping("/courseExamineMethods")
    public DataResponses addCourseExamineMethods(@RequestBody courseExamineMethods item) {
        return new DataResponses(courseExamineMethodsService.save(item));
    }

    //提供考核项目id添加子考核项目
    @PostMapping("/courseExamineChildMethods")
    public DataResponses addCourseExamineChildMethods(@RequestBody courseExamineChildMethods item) {
        return new DataResponses(courseExamineChildMethodsService.save(item));
    }
}
