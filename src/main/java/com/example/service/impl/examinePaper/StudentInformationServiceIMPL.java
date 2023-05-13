package com.example.service.impl.examinePaper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.CourseExamineMethodsMAPPER;
import com.example.mapper.examinePaper.StudentInformationMAPPER;
import com.example.object.CourseExamineMethods;
import com.example.object.finalExamine.StudentComprehensiveScore;
import com.example.object.finalExamine.StudentInformation;
import com.example.service.examinePaper.StudentInformationSERVICE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentInformationServiceIMPL extends ServiceImpl<StudentInformationMAPPER, StudentInformation> implements StudentInformationSERVICE {

    @Autowired
    private StudentInformationMAPPER studentInformationMAPPER;

    @Autowired
    private CourseExamineMethodsMAPPER courseExamineMethodsMAPPER;

    //获取学生综合成绩
    @Override
    public List<StudentComprehensiveScore> getComprehensiveScore(int courseId) {
        refreshScore(courseId);
        return studentInformationMAPPER.getComprehensiveScore(courseId);
    }

    //生成和刷新综合成绩
    @Override
    public void refreshScore(int courseId) {
        List<StudentComprehensiveScore> comprehensiveScore = studentInformationMAPPER.getComprehensiveScore(courseId);
        QueryWrapper<CourseExamineMethods> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id", courseId);
        queryWrapper.orderByAsc("examine_item");
        List<CourseExamineMethods> courseExamineMethods = courseExamineMethodsMAPPER.selectList(queryWrapper);
        double percentage1 = 0;
        double percentage2 = 0;
        double percentage3 = 0;
        for (CourseExamineMethods methods : courseExamineMethods) {
            if (methods.getExamineItem().contains("实验")) percentage1 = methods.getPercentage() * 0.01;
            if (methods.getExamineItem().contains("平时")) percentage2 = methods.getPercentage() * 0.01;
            if (methods.getExamineItem().contains("期末")) percentage3 = methods.getPercentage() * 0.01;
        }

        for (StudentComprehensiveScore score : comprehensiveScore) {
            if (!Double.isNaN(score.getUsualScore()) && !Double.isNaN(score.getFinalScore())) {
                double sum = percentage1 * score.getExperimentScore() + percentage2 * score.getUsualScore() + percentage3 * score.getFinalScore();
                String  str = String.format("%.1f",sum);
                double result = Double.parseDouble(str);

                studentInformationMAPPER.UpdateComprehensiveScore(result,score.getId());
            }
        }
    }
}
