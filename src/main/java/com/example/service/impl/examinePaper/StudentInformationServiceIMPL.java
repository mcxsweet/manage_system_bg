package com.example.service.impl.examinePaper;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.examinePaper.CourseFinalExamPaperMAPPER;
import com.example.mapper.examinePaper.StudentInformationMAPPER;
import com.example.object.finalExamine.CourseFinalExamPaper;
import com.example.object.finalExamine.StudentInformation;
import com.example.service.examinePaper.CourseFinalExamPaperSERVICE;
import com.example.service.examinePaper.StudentInformationSERVICE;
import org.springframework.stereotype.Service;

@Service
public class StudentInformationServiceIMPL extends ServiceImpl<StudentInformationMAPPER, StudentInformation> implements StudentInformationSERVICE {
}
