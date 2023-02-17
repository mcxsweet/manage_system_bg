package com.example.controller;

import com.example.object.courseBasicInformation;
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

    @ApiOperation("查询全部")
    @GetMapping
    public DataResponses getAll() {
        return new DataResponses(true, courseBasicInformationService.list());
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

}