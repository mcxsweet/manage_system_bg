package com.example.service.impl.examinePaper;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.CourseExamineChildMethodsMAPPER;
import com.example.mapper.CourseExamineMethodsMAPPER;
import com.example.mapper.examinePaper.CourseFinalExamPaperDetailMAPPER;
import com.example.mapper.examinePaper.CourseFinalExamPaperMAPPER;
import com.example.mapper.examinePaper.StudentFinalScoreMAPPER;
import com.example.object.CourseExamineChildMethods;
import com.example.object.CourseExamineMethods;
import com.example.object.finalExamine.CourseFinalExamPaper;
import com.example.object.finalExamine.CourseFinalExamPaperDetail;
import com.example.object.finalExamine.StudentFinalScore;
import com.example.service.examinePaper.StudentFinalScoreSERVICE;
import com.example.utility.DataExtend;
import com.example.utility.DataResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Service
public class StudentFinalScoreServiceIMPL extends ServiceImpl<StudentFinalScoreMAPPER, StudentFinalScore> implements StudentFinalScoreSERVICE {
    //考核方式
    @Autowired
    private CourseExamineMethodsMAPPER courseExamineMethodsMAPPER;
    @Autowired
    private CourseExamineChildMethodsMAPPER courseExamineChildMethodsMAPPER;
    @Autowired
    private CourseFinalExamPaperMAPPER courseFinalExamPaperMAPPER;
    @Autowired
    private CourseFinalExamPaperDetailMAPPER courseFinalExamPaperDetailMAPPER;


    @Autowired
    private StudentFinalScoreMAPPER studentFinalScoreMAPPER;

    //获取试卷题型
    @Override
    public DataResponses getFinalExamPaper(int courseId) {
        courseId = 10;
        List<DataExtend> strings = new ArrayList<>();

        QueryWrapper<CourseExamineMethods> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id", courseId);
        queryWrapper.like("examine_item", "期末");
        CourseExamineMethods methods = courseExamineMethodsMAPPER.selectOne(queryWrapper);
        Integer methodsId = methods.getId();

        QueryWrapper<CourseExamineChildMethods> queryWrapper2 = new QueryWrapper<>();
        queryWrapper2.eq("course_examine_methods_id", methodsId);
        queryWrapper2.like("examine_child_item", "试卷");
        CourseExamineChildMethods courseExamineChildMethods = courseExamineChildMethodsMAPPER.selectOne(queryWrapper2);
        Integer paperId = courseExamineChildMethods.getId();

        QueryWrapper<CourseFinalExamPaper> queryWrapper3 = new QueryWrapper<>();
        queryWrapper3.eq("exam_child_method_id", paperId);
        List<CourseFinalExamPaper> courseFinalExamPapers = courseFinalExamPaperMAPPER.selectList(queryWrapper3);
        for (CourseFinalExamPaper courseFinalExamPaper : courseFinalExamPapers) {
            String itemName = courseFinalExamPaper.getItemName();
            Integer id = courseFinalExamPaper.getId();

            QueryWrapper<CourseFinalExamPaperDetail> queryWrapper4 = new QueryWrapper<>();
            queryWrapper4.eq("primary_id", id);
            queryWrapper4.orderByAsc("title_number");
            List<CourseFinalExamPaperDetail> courseFinalExamPaperDetails = courseFinalExamPaperDetailMAPPER.selectList(queryWrapper4);
            List<String> strings2 = new ArrayList<>();
            for (CourseFinalExamPaperDetail courseFinalExamPaperDetail : courseFinalExamPaperDetails) {
                strings2.add(courseFinalExamPaperDetail.getTitleNumber());
            }
            strings.add(new DataExtend(itemName, strings2.toString()));

        }

        return new DataResponses(true, strings);
    }

    @Override
    public DataResponses getAllStudent(int courseId) {
        List<StudentFinalScore> allStudent = studentFinalScoreMAPPER.getAllStudent(courseId);
        for (StudentFinalScore studentFinalScore : allStudent) {
            List<Object> score = new ArrayList<>();
            score.add(JSON.parse(studentFinalScore.getScoreDetails()));
            studentFinalScore.setScoreResponse(score);
        }
        return new DataResponses(true, allStudent);
    }

}
