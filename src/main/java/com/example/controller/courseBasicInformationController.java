package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.mapper.IndicatorsMAPPER;
import com.example.mapper.courseTargetMAPPER;
import com.example.object.Indicators;
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

    @ApiOperation("检查登录接口")
    @PostMapping("/checkSubmit")
    public DataResponses checkSubmit() {
        return new DataResponses(true);
    }


    /*
        课程基本信息相关接口
     */
    //课程基本信息
    @Autowired
    private courseBasicInformationServiceIMPL courseBasicInformationService;

    @ApiOperation("查询全部")
    @GetMapping
    public DataResponses getAll() {
        return new DataResponses(true, courseBasicInformationService.list());
    }

    @ApiOperation("按当前用户查询")
    @GetMapping("/currentUser/{currentUserId}")
    public DataResponses getByCurrentUser(@PathVariable int currentUserId) {
        QueryWrapper<courseBasicInformation> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("teacher_id", currentUserId);
        QueryWrapper.orderByDesc("term_start");
        QueryWrapper.orderByAsc("term");
        return new DataResponses(true, courseBasicInformationService.list(QueryWrapper));
    }

    @ApiOperation("当前用户筛选")
    @PostMapping("/currentUser/{currentUserId}")
    public DataResponses searchByCurrentUser(@PathVariable int currentUserId, @RequestBody courseBasicInformation searchTable) {
        QueryWrapper<courseBasicInformation> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("teacher_id", currentUserId);
        QueryWrapper.orderByDesc("term_start");
        QueryWrapper.orderByAsc("term");
        if (searchTable.getCourseName() != null) {
            QueryWrapper.eq("course_name", searchTable.getCourseName());
        }
        if (searchTable.getClassName() != null) {
            QueryWrapper.eq("class_name", searchTable.getClassName());
        }
        if (searchTable.getTermStart() != null) {
            QueryWrapper.eq("term_start", searchTable.getTermStart());
        }
        if (searchTable.getTermEnd() != null){
            QueryWrapper.eq("term_end", searchTable.getTermEnd());
        }
        if (searchTable.getTerm()!=0){
            QueryWrapper.eq("term", searchTable.getTerm());
        }
        return new DataResponses(true, courseBasicInformationService.list(QueryWrapper));
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

    //课程目标
    @Autowired
    private courseTargetMAPPER courseTarget;

    @ApiOperation("获取该课程所有课程目标")
    @GetMapping("/courseTarget/{courseId}")
    public DataResponses getCourseTarget(@PathVariable int courseId) {
        QueryWrapper<courseTarget> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("course_id", courseId);
        return new DataResponses(true, courseTarget.selectList(QueryWrapper));
    }

    @ApiOperation("添加该课程课程目标")
    @PostMapping("/courseTarget")
    public DataResponses addCourseTarget(@RequestBody courseTarget Data) {
        return new DataResponses(true, courseTarget.insert(Data));
    }

    @ApiOperation("修改课程目标")
    @PutMapping("/courseTarget")
    public DataResponses modifyCourseTarget(@RequestBody courseTarget Data) {
        return new DataResponses(true, courseTarget.updateById(Data));
    }

    @ApiOperation("删除课程目标")
    @DeleteMapping("/courseTarget")
    public DataResponses DeleteCourseTarget(@RequestBody courseTarget Data) {
        return new DataResponses(true, courseTarget.deleteById(Data));
    }

    /*
        指标点相关接口
     */

    @Autowired
    private IndicatorsMAPPER indicators;

    @ApiOperation("查询全部指标点")
    @GetMapping("indicators")
    public DataResponses getAllIndicators() {
        return new DataResponses(true, indicators.selectList(null));
    }

    @ApiOperation("添加指标点")
    @PostMapping("indicators")
    public DataResponses insertIndicators(@RequestBody Indicators item) {
        return new DataResponses(indicators.insert(item));
    }

    @ApiOperation("删除指标点")
    @DeleteMapping("indicators")
    public DataResponses removeIndicators(@RequestBody Indicators item) {
        return new DataResponses(indicators.deleteById(item));
    }

    @ApiOperation("修改指标点")
    @PutMapping("indicators")
    public DataResponses PutIndicators(@RequestBody Indicators item) {
        return new DataResponses(indicators.updateById(item));
    }


}