package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.object.finalExamine.StudentFinalScore;
import com.example.object.finalExamine.StudentInformation;
import com.example.object.finalExamine.StudentUsualScore;
import com.example.service.impl.examinePaper.StudentFinalScoreServiceIMPL;
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
    @Autowired
    private StudentFinalScoreServiceIMPL studentFinalScoreServiceIMPL;

    /**
     * 平时成绩管理
     * @param courseId
     * @return
     */
    @ApiOperation("获取当前课程老师设置的平时考核方式")
    @GetMapping("/{courseId}/getMethods")
    public DataResponses getUsualMethods(@PathVariable int courseId) {
        return new DataResponses(true, studentUsualScoreServiceIMPL.getUsualExamMethods(courseId));
    }

    @ApiOperation("获取当前课程全部学生平时成绩")
    @GetMapping("/{courseId}/getUsualStudent")
    public DataResponses getAllStudent(@PathVariable int courseId) {
        return new DataResponses(true, studentUsualScoreServiceIMPL.getAllStudent(courseId));
    }

    /**
     * 期末成绩管理
     * @param courseId
     * @return
     */
    @ApiOperation("获取当前课程期末试卷")
    @GetMapping("/{courseId}/getFinalExamPaper")
    public DataResponses getFinalExamPaper(@PathVariable int courseId) {
        return studentFinalScoreServiceIMPL.getFinalExamPaper(courseId);
    }

    @ApiOperation("获取当前课程全部学生期末试卷成绩")
    @GetMapping("/{courseId}/getFinalScoreStudent")
    public DataResponses getStudentExamScore(@PathVariable int courseId) {
        return studentFinalScoreServiceIMPL.getAllStudent(courseId);
    }

    /**
     * 普通增删改查
     * @param student
     * @return
     */
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

    @ApiOperation("添加学生期末成绩")
    @PostMapping("/addFinalScore")
    public DataResponses addFinalScore(@RequestBody StudentFinalScore score) {
        StudentFinalScore finalScore = new StudentFinalScore();
        finalScore.setStudentId(score.getStudentId());
        finalScore.setScoreDetails(score.getScoreDetails());
        return new DataResponses(true, studentFinalScoreServiceIMPL.save(finalScore));
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

    @ApiOperation("删除学生期末成绩")
    @DeleteMapping("/deleteStudentFinalScore")
    public DataResponses deleteFinalscore(@RequestBody StudentFinalScore score) {
        QueryWrapper<StudentFinalScore> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("final_score_id",score.getFinalScoreId());
        return new DataResponses(true, studentFinalScoreServiceIMPL.remove(queryWrapper));
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

    @ApiOperation("修改学生期末成绩")
    @PutMapping("/updateStudentFinalScore")
    public DataResponses updateFinalSocre(@RequestBody StudentFinalScore score) {
        StudentFinalScore studentFinalScore = new StudentFinalScore();
        studentFinalScore.setFinalScoreId(score.getFinalScoreId());
        studentFinalScore.setStudentId(score.getStudentId());
        studentFinalScore.setScoreDetails(score.getScoreDetails());
        QueryWrapper<StudentFinalScore> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("final_score_id",studentFinalScore.getFinalScoreId());
        return new DataResponses(true, studentFinalScoreServiceIMPL.update(studentFinalScore,queryWrapper));
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

    /**
     * 导出学生期末成绩表格
     */
    @ApiOperation("导出学生期末成绩表格")
    @GetMapping("/{courseId}/studentFinalScoreExcl")
    public ResponseEntity<byte[]> inputStudentFinalScoreExcl(@PathVariable int courseId) throws IOException {
        return studentFinalScoreServiceIMPL.exportStudentFinalScore(courseId);
    }

    /**
     * 导入学生期末成绩表格
     */
    @ApiOperation("导入学生期末成绩表格")
    @PostMapping("/{courseId}/studentFinalScoreExcl")
    public DataResponses inputStudentFinalScoreExcl(@RequestParam("file") MultipartFile file, @PathVariable int courseId) {
        return studentFinalScoreServiceIMPL.inputStudentFinalScore(file, courseId);
    }

}