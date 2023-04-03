package com.example.service.impl.examinePaper;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.examinePaper.CourseFinalExamPaperMAPPER;
import com.example.object.finalExamine.courseFinalExamPaper;
import com.example.service.examinePaper.CourseFinalExamPaperSERVICE;
import org.springframework.stereotype.Service;

@Service
public class CourseFinalExamPaperServiceIMPL extends ServiceImpl<CourseFinalExamPaperMAPPER, courseFinalExamPaper> implements CourseFinalExamPaperSERVICE {
}
