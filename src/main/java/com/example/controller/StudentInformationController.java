package com.example.controller;

import com.example.service.impl.examinePaper.StudentInformationServiceIMPL;
import com.example.service.impl.examinePaper.StudentUsualScoreServiceIMPL;
import com.example.utility.DataExtend;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@CrossOrigin(origins = "*")
@Api(tags = "学生成绩管理")
@RestController
@RequestMapping("/student")
public class StudentInformationController {
    @Autowired
    private StudentInformationServiceIMPL studentInformationServiceIMPL;
    @Autowired
    private StudentUsualScoreServiceIMPL studentUsualScoreServiceIMPL;

    @ApiOperation("获取全部")
    @GetMapping()
    public DataResponses getAll() {
        return new DataResponses(true,new DataExtend(studentInformationServiceIMPL.list(),studentUsualScoreServiceIMPL.list()));
    }
}