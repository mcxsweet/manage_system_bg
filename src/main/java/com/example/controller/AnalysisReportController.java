package com.example.controller;


import com.example.service.impl.AnalysisReportServiceIMPL;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*")
@Api(tags = "分析报告")
@RestController
@RequestMapping("/report")
public class AnalysisReportController {
    @Autowired
    private AnalysisReportServiceIMPL analysisReportServiceIMPL;

    @ApiOperation("导出分析报告")
    @GetMapping("{courseId}/analyse")
    public ResponseEntity<byte[]> getAnalysisReport(@PathVariable int courseId) {
        return analysisReportServiceIMPL.getReport(courseId,1);
    }

}
