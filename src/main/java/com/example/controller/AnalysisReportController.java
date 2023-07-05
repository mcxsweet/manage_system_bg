package com.example.controller;


import com.example.service.impl.AnalysisReportServiceIMPL;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@CrossOrigin(origins = "*")
@Api(tags = "分析报告")
@RestController
@RequestMapping("/report")
public class AnalysisReportController {
    @Autowired
    private AnalysisReportServiceIMPL analysisReportServiceIMPL;

    @ApiOperation("导出课程目标达成评价分析报告")
    @GetMapping("{courseId}/{type}/analyse")
    public ResponseEntity<byte[]> getAnalysisReport(HttpServletResponse response, @PathVariable int courseId, @PathVariable int type) {
        return analysisReportServiceIMPL.getReport(response, courseId, type);
    }

    @ApiOperation("导出课程试卷分析报告")
    @GetMapping("{courseId}/{type}/analyse3")
    public ResponseEntity<byte[]> getAnalysisReport3(HttpServletResponse response, @PathVariable int courseId, @PathVariable int type) {
        return analysisReportServiceIMPL.getReport3(response, courseId, type);
    }

    @ApiOperation("导出课程教学小结表")
    @GetMapping("{courseId}/{type}/analyse4")
    public ResponseEntity<byte[]> getAnalysisReport4(HttpServletResponse response, @PathVariable int courseId, @PathVariable int type) {
        return analysisReportServiceIMPL.getReport4(response, courseId, type);
    }


}
