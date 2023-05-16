package com.example.service.examinePaper;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.object.finalExamine.StudentComprehensiveScore;
import com.example.object.finalExamine.StudentInformation;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface StudentInformationSERVICE extends IService<StudentInformation> {
    //获取学生综合成绩
    List<StudentComprehensiveScore> getComprehensiveScore(int courseId);

    //导出学生综合成绩XLS
    ResponseEntity<byte[]> exportComprehensiveScore(int courseId);

    //导出达成度分析表
    ResponseEntity<byte[]> exportDegreeOfAchievement(int courseId);

    //生成和刷新综合成绩
    void refreshScore(int courseId);

    //导出成绩分析PDF
    ResponseEntity<byte[]> exportComprehensiveScoreAnalyse(int courseId);

    //课程成绩分析
    void analyse(int courseId);
}
