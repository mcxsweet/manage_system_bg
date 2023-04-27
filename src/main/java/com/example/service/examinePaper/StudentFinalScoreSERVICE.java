package com.example.service.examinePaper;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.object.finalExamine.StudentFinalScore;
import com.example.utility.DataResponses;

public interface StudentFinalScoreSERVICE extends IService<StudentFinalScore> {
    DataResponses getFinalExamPaper(int courseId);

    DataResponses getAllStudent(int courseId);
}
