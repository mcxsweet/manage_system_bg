package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.object.finalExamine.StudentInformation;
import com.example.object.finalExamine.StudentUsualScore;
import com.example.service.impl.examinePaper.StudentInformationServiceIMPL;
import com.example.service.impl.examinePaper.StudentUsualScoreServiceIMPL;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;


@CrossOrigin(origins = "*")
@Api(tags = "学生成绩管理")
@RestController
@RequestMapping("/student")
public class StudentInformationController {
    @Autowired
    private StudentInformationServiceIMPL studentInformationServiceIMPL;
    @Autowired
    private StudentUsualScoreServiceIMPL studentUsualScoreServiceIMPL;

    @ApiOperation("获取当前课程老师设置的平时考核方式")
    @GetMapping("/{courseId}/getMethods")
    public DataResponses getUsualMethods(@PathVariable int courseId) {
        return new DataResponses(true, studentUsualScoreServiceIMPL.getUsualExamMethods(courseId));
    }

    @ApiOperation("获取当前课程全部学生平时成绩")
    @GetMapping("/{courseId}/getStudent")
    public DataResponses getAllStudent(@PathVariable int courseId) {
        return new DataResponses(true, studentUsualScoreServiceIMPL.getAllStudent(courseId));
    }

    @ApiOperation("添加学生信息")
    @PostMapping("/addStudent")
    public DataResponses addStudent(@RequestBody StudentInformation student) {
        QueryWrapper<StudentInformation> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_number", student.getStudentNumber());
        return new DataResponses(true, studentInformationServiceIMPL.save(student), studentInformationServiceIMPL.getOne(queryWrapper).getId().toString());
    }

    @ApiOperation("添加学生平时成绩")
    @PostMapping("/addUsualScore")
    public DataResponses addUsualScore(@RequestBody StudentUsualScore score) {
        return new DataResponses(true, studentUsualScoreServiceIMPL.save(score));
    }

    @ApiOperation("删除学生信息")
    @DeleteMapping("/deleteStudent")
    public DataResponses deleteStudent(@RequestBody StudentInformation student) {
        return new DataResponses(true, studentInformationServiceIMPL.removeById(student.getId()));
    }

    @ApiOperation("删除学生平时成绩")
    @DeleteMapping("/deleteStudentUsualScore")
    public DataResponses deleteUsualscore(@RequestBody StudentUsualScore score) {
        return new DataResponses(true, studentUsualScoreServiceIMPL.removeById(score.getId()));
    }

    @ApiOperation("修改学生信息")
    @PutMapping("/updateStudent")
    public DataResponses updateStudent(@RequestBody StudentInformation student) {
        return new DataResponses(true, studentInformationServiceIMPL.updateById(student));
    }

    @ApiOperation("修改学生平时成绩")
    @PutMapping("/updateStudentUsualScore")
    public DataResponses updateUsualSocre(@RequestBody StudentUsualScore score) {
        return new DataResponses(true, studentUsualScoreServiceIMPL.updateById(score));
    }

    /**
     * 导出学生平时成绩表格
     */
    @ApiOperation("导出平时成绩表格")
    @GetMapping("/{courseId}/studentUsualScoreExcl")
    public ResponseEntity<byte[]> studentUsualScoreExcl(@PathVariable int courseId) throws IOException {
        return studentUsualScoreServiceIMPL.exportStudentUsualScore(courseId);
    }

    /**
     * 导入学生平时成绩表格
     */
    @ApiOperation("导入学生平时成绩表格")
    @PostMapping("/{courseId}/studentUsualScoreExcl")
    public DataResponses inputStudentUsualScoreExcl(@RequestParam("file") MultipartFile file, @PathVariable String courseId) {
        return studentUsualScoreServiceIMPL.inputStudentUsualScore(file, courseId);
    }

}