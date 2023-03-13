package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.object.examinePaper.courseFinalExamPaper;
import com.example.object.examinePaper.courseFinalExamPaperDetail;
import com.example.service.impl.examinePaper.courseFinalExamPaperDetailServiceIMPL;
import com.example.service.impl.examinePaper.courseFinalExamPaperServiceIMPL;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = "期末试卷成绩细明")
@RestController
@RequestMapping("/courseExamPaper")
public class courseFinalExamPaperController {

/*
    期末考察项目
*/

    @Autowired
    private courseFinalExamPaperServiceIMPL courseFinalExamPaperService;

    @ApiOperation("查询所有期末考察项目")
    @GetMapping()
    public DataResponses getAll() {
        return new DataResponses(true, courseFinalExamPaperService.list());
    }

    @ApiOperation("提供课程信息表的id查询期末考察项目")
    @GetMapping("/{courseId}")
    public DataResponses getById(@PathVariable int courseId) {
        QueryWrapper<courseFinalExamPaper> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("course_id", courseId);
        return new DataResponses(true, courseFinalExamPaperService.list(QueryWrapper));
    }

    @ApiOperation("根据课程信息表的id添加期末考察项目")
    @PostMapping()
    public DataResponses addById(@RequestBody courseFinalExamPaper information) {
        return new DataResponses(courseFinalExamPaperService.save(information));
    }

    @ApiOperation("提供课程信息表的id修改期末考察项目")
    @PutMapping()
    public DataResponses modifyById(@RequestBody courseFinalExamPaper information) {
        return new DataResponses(courseFinalExamPaperService.updateById(information));
    }

    @ApiOperation("提供id删除期末考察项目")
    @DeleteMapping()
    public DataResponses deleteById(@RequestBody int id) {
        return new DataResponses(courseFinalExamPaperService.removeById(id));
    }

    /*
        项目细明
    */
    @Autowired
    private courseFinalExamPaperDetailServiceIMPL courseFinalExamPaperDetailService;

    @ApiOperation("查询所有期末考察项目细明")
    @GetMapping("/detail")
    public DataResponses getAllDetail() {
        return new DataResponses(true, courseFinalExamPaperDetailService.list());
    }


    @ApiOperation("提供期末试卷表的id查询详细期末考察项目")
    @GetMapping("/detail/{primaryId}")
    public DataResponses getDetailById(@PathVariable int primaryId) {
        QueryWrapper<courseFinalExamPaperDetail> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("primary_id", primaryId);
        return new DataResponses(true, courseFinalExamPaperDetailService.list(QueryWrapper));
    }

    @ApiOperation("根据期末试卷表的id添加详细期末考察项目")
    @PostMapping("/detail")
    public DataResponses addDetailById(@RequestBody courseFinalExamPaperDetail information) {
        return new DataResponses(courseFinalExamPaperDetailService.save(information));
    }

    @ApiOperation("提供期末试卷表的id更新详细期末考察项目")
    @PutMapping("/detail")
    public DataResponses modifyDetailById(@RequestBody courseFinalExamPaperDetail information) {
        return new DataResponses(courseFinalExamPaperDetailService.updateById(information));
    }

    @ApiOperation("提供期末试卷表的id删除详细期末考察项目")
    @DeleteMapping("/detail")
    public DataResponses deleteDetailById(@RequestBody int id) {
        return new DataResponses(courseFinalExamPaperDetailService.removeById(id));
    }

}
