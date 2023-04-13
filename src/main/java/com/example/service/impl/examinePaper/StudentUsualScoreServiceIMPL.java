package com.example.service.impl.examinePaper;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.examinePaper.StudentInformationMAPPER;
import com.example.mapper.examinePaper.StudentUsualScoreMAPPER;
import com.example.object.finalExamine.StudentInformation;
import com.example.object.finalExamine.StudentScore;
import com.example.object.finalExamine.StudentUsualScore;
import com.example.service.examinePaper.StudentInformationSERVICE;
import com.example.service.examinePaper.StudentUsualScoreSERVICE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentUsualScoreServiceIMPL extends ServiceImpl<StudentUsualScoreMAPPER, StudentUsualScore> implements StudentUsualScoreSERVICE {
    @Autowired
    private StudentUsualScoreMAPPER studentUsualScoreMAPPER;

    @Override
    public List<StudentScore> getAllStudent(int courseId) {
        return studentUsualScoreMAPPER.getAllStudent(courseId);
    }
}
