package com.example.controller;

import com.example.object.courseBasicInformation;
import com.example.service.impl.courseBasicInformationServiceIMPL;
import com.example.utility.DataResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.utility.export.export;

import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;

@RestController
@RequestMapping("/courseInfo")
public class courseBasicInformationController {
    @Autowired
    private courseBasicInformationServiceIMPL courseBasicInformationService;

    @GetMapping
    public DataResponses getAll() {
        return new DataResponses(true, courseBasicInformationService.list());
    }

    //导出课程基本信息
    @GetMapping("/export/{id}")
    public void exportExcel(HttpServletResponse response, @PathVariable int id) throws IOException {

        courseBasicInformation information = courseBasicInformationService.getById(id);
        //导出文件的方法统一写入到export类中
        export.ExportCourseBasicInformationExcel(response, information);
    }

    @PostMapping
    public DataResponses write(@RequestBody courseBasicInformation pages) {
        return new DataResponses(courseBasicInformationService.save(pages));
    }

    @DeleteMapping
    public DataResponses delete(@RequestBody courseBasicInformation pages){
        return new DataResponses(courseBasicInformationService.removeById(pages));
    }

}