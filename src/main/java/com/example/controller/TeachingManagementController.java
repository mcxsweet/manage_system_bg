package com.example.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.object.CourseBasicInformation;
import com.example.service.impl.CourseBasicInformationServiceIMPL;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


@CrossOrigin(origins = "*")
@Api(tags = "分析报告")
@RestController
@RequestMapping("/manager")
public class TeachingManagementController {
    @Autowired
    private CourseBasicInformationServiceIMPL courseBasicInformationServiceIMPL;


    @ApiOperation("获取当前专业的所有课程")
    @PostMapping("/getCourseByMajor")
    public DataResponses getCourseByMajor(@RequestBody HashMap<String, String> major) {
        QueryWrapper<CourseBasicInformation> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("major",major.get("major"));
        queryWrapper.orderByDesc("term_start");
        queryWrapper.orderByAsc("term");
        return new DataResponses(true, courseBasicInformationServiceIMPL.list(queryWrapper));
    }




}
