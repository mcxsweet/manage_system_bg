package com.example.service.impl.examinePaper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.CourseExamineMethodsMAPPER;
import com.example.mapper.comprehensiveAnalyse.CourseScoreAnalyseMAPPER;
import com.example.mapper.examinePaper.StudentInformationMAPPER;
import com.example.object.CourseExamineMethods;
import com.example.object.comprehensiveAnalyse.CourseScoreAnalyse;
import com.example.object.finalExamine.StudentComprehensiveScore;
import com.example.object.finalExamine.StudentInformation;
import com.example.service.examinePaper.StudentInformationSERVICE;
import com.example.utility.export.export;
import com.spire.xls.FileFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@Service
public class StudentInformationServiceIMPL extends ServiceImpl<StudentInformationMAPPER, StudentInformation> implements StudentInformationSERVICE {

    @Autowired
    private StudentInformationMAPPER studentInformationMAPPER;

    @Autowired
    private CourseExamineMethodsMAPPER courseExamineMethodsMAPPER;

    @Autowired
    private CourseScoreAnalyseMAPPER courseScoreAnalyseMAPPER;


    //获取学生综合成绩
    @Override
    public List<StudentComprehensiveScore> getComprehensiveScore(int courseId) {
        refreshScore(courseId);
        analyse(courseId);
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
                String str = String.format("%.1f", sum);
                double result = Double.parseDouble(str);

                studentInformationMAPPER.UpdateComprehensiveScore(result, score.getId());
            }
        }
    }

    //导出成绩分析PDF
    public ResponseEntity<byte[]> exportComprehensiveScore(int courseId) {
        analyse(courseId);
        try {
            Workbook workbook = new HSSFWorkbook();
            Sheet sheet = workbook.createSheet();

            //单元格样式
            CellStyle style = workbook.createCellStyle();
            style.setBorderBottom(BorderStyle.THIN);
            style.setBorderTop(BorderStyle.THIN);
            style.setBorderRight(BorderStyle.THIN);
            style.setBorderLeft(BorderStyle.THIN);
            style.setAlignment(HorizontalAlignment.CENTER);
            style.setVerticalAlignment(VerticalAlignment.CENTER);

            CellStyle style2 = workbook.createCellStyle();
            style2.setBorderBottom(BorderStyle.THIN);
            style2.setBorderTop(BorderStyle.THIN);
            style2.setBorderRight(BorderStyle.THIN);
            style2.setBorderLeft(BorderStyle.THIN);

            QueryWrapper<CourseScoreAnalyse> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("course_id",courseId);
            CourseScoreAnalyse scoreAnalyse = courseScoreAnalyseMAPPER.selectOne(queryWrapper);

            export.valueToCell(sheet,1,1,"分数段",style2);
            export.valueToCell(sheet,1,2,"优",style2);
            export.valueToCell(sheet,2,2,">= 90",style2);
            export.valueToCell(sheet,3,2,scoreAnalyse.getSuperior().toString(),style2);
            export.valueToCell(sheet,4,2,String.valueOf(export.doubleFormat(scoreAnalyse.getSuperior() * 1.0 / scoreAnalyse.getStudentNum(),4) * 100),style2);

            export.valueToCell(sheet,1,3,"良",style2);
            export.valueToCell(sheet,2,3,"80-89",style2);
            export.valueToCell(sheet,3,3,scoreAnalyse.getGreat().toString(),style2);
            export.valueToCell(sheet,4,3,String.valueOf(export.doubleFormat(scoreAnalyse.getGreat() * 1.0 / scoreAnalyse.getStudentNum(),4) * 100),style2);

            export.valueToCell(sheet,1,4,"中",style2);
            export.valueToCell(sheet,2,4,"70-79",style2);
            export.valueToCell(sheet,3,4,scoreAnalyse.getGood().toString(),style2);
            export.valueToCell(sheet,4,4,String.valueOf(export.doubleFormat(scoreAnalyse.getGood() * 1.0 / scoreAnalyse.getStudentNum(),4) * 100),style2);

            export.valueToCell(sheet,1,5,"及格",style2);
            export.valueToCell(sheet,2,5,"60-69",style2);
            export.valueToCell(sheet,3,5,scoreAnalyse.getPass().toString(),style2);
            export.valueToCell(sheet,4,5,String.valueOf(export.doubleFormat(scoreAnalyse.getPass() * 1.0 / scoreAnalyse.getStudentNum(),4) * 100),style2);

            export.valueToCell(sheet,1,6,"不及格",style2);
            export.valueToCell(sheet,2,6,"< 60",style2);
            export.valueToCell(sheet,3,6,scoreAnalyse.getFailed().toString(),style2);
            export.valueToCell(sheet,4,6,String.valueOf(export.doubleFormat(scoreAnalyse.getFailed() * 1.0 / scoreAnalyse.getStudentNum(),4) * 100),style2);

            export.valueToCell(sheet,3,1,"人数",style2);
            export.valueToCell(sheet,4,1,"比例",style2);
            export.valueToCell(sheet,5,1,"最高分",style2);
            export.valueToCell(sheet,5,2,String.valueOf(scoreAnalyse.getMaxScore()),style2);
            export.valueToCell(sheet,5,3,"最低分",style2);
            export.valueToCell(sheet,5,4,String.valueOf(scoreAnalyse.getMinScore()),style2);
            export.valueToCell(sheet,5,5,"平均分",style2);
            export.valueToCell(sheet,5,6,String.valueOf(scoreAnalyse.getAverageScore()),style2);
            export.valueToCell(sheet,6,1,"及格率",style2);
            export.valueToCell(sheet,6,2,String.valueOf(scoreAnalyse.getPassRate()),style2);

            CellRangeAddress mergedRegion = new CellRangeAddress(1, 6, 0, 0);
            sheet.addMergedRegion(mergedRegion);
            export.valueToCell(sheet,1,0,"综合成绩",style);
            export.reloadCellStyle(mergedRegion, sheet, style);

            mergedRegion = new CellRangeAddress(0, 0, 0, 6);
            sheet.addMergedRegion(mergedRegion);
            export.valueToCell(sheet,0,0,"课程成绩分析",style);
            export.reloadCellStyle(mergedRegion, sheet, style);

            FileOutputStream fileOut = new FileOutputStream("workbook.xls");
            workbook.write(fileOut);
            fileOut.close();

            // 加载 XLS 文件
            com.spire.xls.Workbook workbookn = new com.spire.xls.Workbook();
            workbookn.loadFromFile("workbook.xls");
            workbookn.getConverterSetting().setSheetFitToPage(true);
            workbookn.getConverterSetting().setSheetFitToWidth(true);
            // 将 XLS 文件转换为 PDF 文件
            workbookn.saveToFile("workbook.pdf", FileFormat.PDF);
            //使用字节数组读取
            byte[] pdfBytes = Files.readAllBytes(Paths.get("workbook.pdf"));

            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=converted.pdf");
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
            return ResponseEntity.ok()
                    .headers(headers)
                    .body(pdfBytes);
        } catch (IOException e) {
            return null;
        }
    }

    //课程成绩分析
    @Override
    public void analyse(int courseId) {
        CourseScoreAnalyse scoreAnalyse = new CourseScoreAnalyse();
        scoreAnalyse.setCourseId(courseId);
        scoreAnalyse.setStudentNum(studentInformationMAPPER.count(courseId));
        scoreAnalyse.setMaxScore(studentInformationMAPPER.max(courseId));
        scoreAnalyse.setMinScore(studentInformationMAPPER.min(courseId));

        double average = studentInformationMAPPER.average(courseId);
        String str1 = String.format("%.1f", average);
        double result1 = Double.parseDouble(str1);
        scoreAnalyse.setAverageScore(result1);

        scoreAnalyse.setSuperior(studentInformationMAPPER.superior(courseId));
        scoreAnalyse.setGreat(studentInformationMAPPER.great(courseId));
        scoreAnalyse.setGood(studentInformationMAPPER.good(courseId));
        scoreAnalyse.setPass(studentInformationMAPPER.pass(courseId));
        scoreAnalyse.setFailed(studentInformationMAPPER.failed(courseId));

        double sum = studentInformationMAPPER.passNum(courseId) * 1.0 / studentInformationMAPPER.count(courseId);
        String str = String.format("%.4f", sum);
        double result = Double.parseDouble(str);
        scoreAnalyse.setPassRate(result);

        QueryWrapper<CourseScoreAnalyse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id", courseId);

        if (courseScoreAnalyseMAPPER.update(scoreAnalyse, queryWrapper) != 1) {
            courseScoreAnalyseMAPPER.insert(scoreAnalyse);
        }
    }
}
