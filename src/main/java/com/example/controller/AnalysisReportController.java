package com.example.controller;


import com.example.service.impl.AnalysisReportServiceIMPL;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*")
@Api(tags = "分析报告")
@RestController
@RequestMapping("/report")
public class AnalysisReportController {
    @Autowired
    private AnalysisReportServiceIMPL analysisReportServiceIMPL;

    @ApiOperation("导出分析报告")
    @GetMapping
    public ResponseEntity<byte[]> getAnalysisReport() {
        return analysisReportServiceIMPL.getReport(1,1);
    }

}
