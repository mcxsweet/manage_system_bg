package com.example.manage_system_bg;

import com.example.mapper.UserMAPPER;
import com.example.object.User;
import com.example.object.finalExamine.StudentUsualScore;
import com.example.service.impl.IndicatorsServiceIMPL;
import com.example.service.impl.examinePaper.CourseFinalExamPaperDetailServiceIMPL;
import com.example.service.impl.examinePaper.StudentFinalScoreServiceIMPL;
import com.example.service.impl.examinePaper.StudentUsualScoreServiceIMPL;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;
import java.io.IOException;

@SpringBootTest
class ManageSystemBgApplicationTests {

    @Autowired
    private StudentUsualScoreServiceIMPL impl;

    @Autowired
    private UserMAPPER userMAPPER;

    @Test
    void contextLoads() throws BiffException, IOException {
        impl.refreshStudentScore(10);
    }

}
