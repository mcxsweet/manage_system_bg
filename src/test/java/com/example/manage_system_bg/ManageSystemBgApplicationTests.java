package com.example.manage_system_bg;

import com.example.mapper.UserMAPPER;
import com.example.object.User;
import com.example.service.impl.examinePaper.CourseFinalExamPaperDetailServiceIMPL;
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
    private CourseFinalExamPaperDetailServiceIMPL courseFinalExamPaperDetailServiceIMPL;

    @Autowired
    private UserMAPPER userMAPPER;

    @Test
    void contextLoads() throws BiffException, IOException {
//        Workbook workbook = Workbook.getWorkbook(new File(""));
//        Sheet sheet = workbook.getSheet(0);
//        for (int i = 2; i < sheet.getRows(); i++) {
//            // 获取第一列的第 i 行信息 sheet.getCell(列，行)，下标从0开始
//            int id = Integer.parseInt(sheet.getCell(0, i).getContents());
//            // 获取第二列的第 i 行信息
//            String teacherName = sheet.getCell(1, i).getContents();
//            String department = sheet.getCell(2, i).getContents();
//            String name = sheet.getCell(3, i).getContents();
//            String password = sheet.getCell(4, i).getContents();
//
//            User user = new User();
//            user.setName(name);
//            user.setPassword(password);
//            user.setDepartment(department);
//            user.setTeacherName(teacherName);
//
//            userMAPPER.insert(user);

//        }
    }




}
