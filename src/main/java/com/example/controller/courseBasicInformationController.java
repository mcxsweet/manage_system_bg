package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.mapper.courseTargetMAPPER;
import com.example.object.courseBasicInformation;
import com.example.object.courseTarget;

import com.example.service.impl.courseBasicInformationServiceIMPL;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.utility.export.export;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Api(tags = "课程信息")
@RestController
@RequestMapping("/courseInfo")
public class courseBasicInformationController {
    @Autowired
    private courseBasicInformationServiceIMPL courseBasicInformationService;

    @Autowired
    private courseTargetMAPPER courseTarget;

    @ApiOperation("查询全部")
    @GetMapping
    public DataResponses getAll() {
        return new DataResponses(true, courseBasicInformationService.list());
    }

    @ApiOperation("按当前用户查询")
    @GetMapping("/currentUser/{currentUserId}")
    public DataResponses getByCurrentUser(@PathVariable int currentUserId) {
        QueryWrapper<courseBasicInformation> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("teacher_id",currentUserId);
        return new DataResponses(true,courseBasicInformationService.list(QueryWrapper));
    }

    @ApiOperation("按id查询")
    @GetMapping("{id}")
    public DataResponses getById(@PathVariable int id) {
        return new DataResponses(true, courseBasicInformationService.getById(id));
    }

    @ApiOperation("按id修改")
    @PutMapping()
    public DataResponses UpdateById(@RequestBody courseBasicInformation data) {
        return new DataResponses(courseBasicInformationService.updateById(data));
    }

    //导出课程基本信息
    @ApiOperation("导出课程基本信息")
    @GetMapping("/export/{id}")
    public void exportExcel(HttpServletResponse response, @PathVariable int id) throws IOException {

        courseBasicInformation information = courseBasicInformationService.getById(id);
        //导出文件的方法统一写入到export类中
        export.ExportCourseBasicInformationExcel(response, information);
    }

    @ApiOperation("添加")
    @PostMapping
    public DataResponses write(@RequestBody courseBasicInformation pages) {
        return new DataResponses(courseBasicInformationService.save(pages));
    }

    @ApiOperation("删除")
    @DeleteMapping
    public DataResponses delete(@RequestBody courseBasicInformation pages) {
        return new DataResponses(courseBasicInformationService.removeById(pages));
    }

/*
    课程目标相关接口
 */
    @ApiOperation("获取该课程所有课程目标")
    @GetMapping("/courseTarget/{courseId}")
    public DataResponses getCourseTarget(@PathVariable int courseId){
        QueryWrapper<courseTarget> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("course_id",courseId);
        return new DataResponses(true,courseTarget.selectList(QueryWrapper));
    }

    @ApiOperation("添加该课程课程目标")
    @PostMapping("/courseTarget")
    public DataResponses addCourseTarget(@RequestBody courseTarget Data){
        return new DataResponses(true,courseTarget.insert(Data));
    }

    @ApiOperation("修改课程目标")
    @PutMapping("/courseTarget")
    public DataResponses modifyCourseTarget(@RequestBody courseTarget Data){
        return new DataResponses(true,courseTarget.updateById(Data));
    }

    @ApiOperation("删除课程目标")
    @DeleteMapping("/courseTarget")
    public DataResponses DeleteCourseTarget(@RequestBody courseTarget Data){
        return new DataResponses(true,courseTarget.deleteById(Data));
    }

}