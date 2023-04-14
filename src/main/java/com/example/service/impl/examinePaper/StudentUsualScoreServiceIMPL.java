package com.example.service.impl.examinePaper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.CourseExamineChildMethodsMAPPER;
import com.example.mapper.CourseExamineMethodsMAPPER;
import com.example.mapper.examinePaper.StudentUsualScoreMAPPER;
import com.example.object.CourseExamineChildMethods;
import com.example.object.CourseExamineMethods;
import com.example.object.finalExamine.StudentScore;
import com.example.object.finalExamine.StudentUsualScore;
import com.example.service.examinePaper.StudentUsualScoreSERVICE;
import com.example.utility.DataExtend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class StudentUsualScoreServiceIMPL extends ServiceImpl<StudentUsualScoreMAPPER, StudentUsualScore> implements StudentUsualScoreSERVICE {
    @Autowired
    private StudentUsualScoreMAPPER studentUsualScoreMAPPER;

    @Autowired
    private CourseExamineMethodsMAPPER courseExamineMethodsMAPPER;

    @Autowired
    private CourseExamineChildMethodsMAPPER courseExamineChildMethodsMAPPER;

    @Override
    public List<StudentScore> getAllStudent(int courseId) {
        return studentUsualScoreMAPPER.getAllStudent(courseId);
    }

    @Override
    public List<DataExtend> getUsualExamMethods(int courseID) {
        List<DataExtend> strings = new ArrayList<>();
        QueryWrapper<CourseExamineMethods> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id", courseID);
        List<CourseExamineMethods> courseExamineMethods = courseExamineMethodsMAPPER.selectList(queryWrapper);

        int id = 0;
        for (CourseExamineMethods courseExamineMethods1 : courseExamineMethods) {
            if (Objects.equals(courseExamineMethods1.getExamineItem(), "平时考核成绩")) {
                id = courseExamineMethods1.getId();
            }
        }

        QueryWrapper<CourseExamineChildMethods> queryWrapper2 = new QueryWrapper<>();
        queryWrapper2.eq("course_examine_methods_id", id);
        List<CourseExamineChildMethods> courseExamineChildMethods = courseExamineChildMethodsMAPPER.selectList(queryWrapper2);

        for (CourseExamineChildMethods courseExamineChildMethods1 : courseExamineChildMethods) {
            switch (courseExamineChildMethods1.getExamineChildItem()) {
                case "考勤":
                    strings.add(new DataExtend(courseExamineChildMethods1.getExamineChildItem(), "attendanceScore"));
                    break;
                case "课题提问":
                    strings.add(new DataExtend(courseExamineChildMethods1.getExamineChildItem(), "quizScore"));
                    break;
                case "作业":
                    strings.add(new DataExtend(courseExamineChildMethods1.getExamineChildItem(), "workScore"));
                    break;
                case "期中测试":
                    strings.add(new DataExtend(courseExamineChildMethods1.getExamineChildItem(), "midTermScore"));
                    break;
            }
        }

        return strings;
    }

}
