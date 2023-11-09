package com.example.manage_system_bg;

import com.example.mapper.CourseSyllabusInformationMAPPER;
import com.example.mapper.IndicatorsMAPPER;
import com.example.object.CourseSyllabusInformation;
import com.example.object.Indicators;
import com.example.service.impl.AnalysisReportServiceIMPL;
import com.example.utility.export.export;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.*;

import java.io.*;

import com.example.mapper.UserMAPPER;
import com.example.object.User;
import com.example.object.finalExamine.StudentUsualScore;
import com.example.service.impl.IndicatorsServiceIMPL;
import com.example.service.impl.examinePaper.CourseFinalExamPaperDetailServiceIMPL;
import com.example.service.impl.examinePaper.StudentFinalScoreServiceIMPL;
import com.example.service.impl.examinePaper.StudentInformationServiceIMPL;
import com.example.service.impl.examinePaper.StudentUsualScoreServiceIMPL;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.junit.jupiter.api.Test;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.util.Collection;
import java.util.Locale;
import java.util.Objects;

@SpringBootTest
class ManageSystemBgApplicationTests {

    @Autowired
    private CourseSyllabusInformationMAPPER impl;

    @Autowired
    private IndicatorsMAPPER impl2;

    @Autowired
    private UserMAPPER userMAPPER;

    @Test
    void contextLoads() throws IOException {

        FileInputStream inputStream = new FileInputStream("/home/user/Documents/项目/Manage_system_bg/通信工程培养方案.xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);

        XSSFSheet sheet = workbook.getSheetAt(0);

        for (int i = 0; i <= sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
//            String stringCellValue = export.getCellStringValue(row.getCell(0));

            CourseSyllabusInformation item = new CourseSyllabusInformation();
            item.setCourseName(export.getCellStringValue(row.getCell(1)));
            item.setCourseCode(export.getCellStringValue(row.getCell(0)));
            item.setMajor(export.getCellStringValue(row.getCell(7)));
            item.setCredit(Double.parseDouble(export.getCellStringValue(row.getCell(2))));
//            item.setTheoreticalHours(Integer.parseInt(export.getCellStringValue(row.getCell(3))));

            String s2 = export.getCellStringValue(row.getCell(3));
            item.setTheoreticalHours(0);
            if (!Objects.equals(s2, "")) {
                item.setTheoreticalHours(Integer.parseInt(export.getCellStringValue(row.getCell(3))));
            }


            String s1 = export.getCellStringValue(row.getCell(4));
            item.setLabHours(0);
            if (!Objects.equals(s1, "")) {
                item.setLabHours(Integer.parseInt(export.getCellStringValue(row.getCell(4))));
            }

            item.setCourseNature(export.getCellStringValue(row.getCell(6)));
            item.setCourseType(export.getCellStringValue(row.getCell(5)));

            impl.insert(item);
        }
    }

    @Test
    void exportTest() throws IOException {
        FileInputStream inputStream = new FileInputStream("/home/user/Documents/项目/Manage_system_bg/通信工程指标点.xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);

        XSSFSheet sheet = workbook.getSheetAt(0);

        for (int i = 0; i <= sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
            Indicators indicators = new Indicators();

            indicators.setIndicatorIndex(Integer.parseInt(export.getCellStringValue(row.getCell(0))));
            indicators.setIndicatorName(export.getCellStringValue(row.getCell(1)));
            indicators.setIndicatorContent(export.getCellStringValue(row.getCell(2)));
            indicators.setCourses(export.getCellStringValue(row.getCell(3)));
            indicators.setMajor("通信工程");

            impl2.insert(indicators);

        }
    }

    @Test
    void exportTest2() throws IOException {
        FileInputStream inputStream = new FileInputStream("/home/user/Documents/项目/Manage_system_bg/通信工程用户名单.xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);

        XSSFSheet sheet = workbook.getSheetAt(0);

        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
            User user = new User();

            user.setTeacherName(export.getCellStringValue(row.getCell(0)));
            user.setIsAdmin(Integer.parseInt(export.getCellStringValue(row.getCell(1))));
            user.setName(export.getCellStringValue(row.getCell(2)));
            user.setDepartment("通信工程");

            userMAPPER.insert(user);

        }
    }
}
