package com.example.service.impl.examinePaper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.CourseExamineChildMethodsMAPPER;
import com.example.mapper.CourseExamineMethodsMAPPER;
import com.example.mapper.examinePaper.StudentInformationMAPPER;
import com.example.mapper.examinePaper.StudentUsualScoreMAPPER;
import com.example.object.CourseExamineChildMethods;
import com.example.object.CourseExamineMethods;
import com.example.object.finalExamine.StudentInformation;
import com.example.object.finalExamine.StudentScore;
import com.example.object.finalExamine.StudentUsualScore;
import com.example.service.examinePaper.StudentUsualScoreSERVICE;
import com.example.utility.DataExtend;
import com.example.utility.DataResponses;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class StudentUsualScoreServiceIMPL extends ServiceImpl<StudentUsualScoreMAPPER, StudentUsualScore> implements StudentUsualScoreSERVICE {

    @Autowired
    private StudentInformationMAPPER studentInformationMAPPER;
    @Autowired
    private StudentUsualScoreMAPPER studentUsualScoreMAPPER;

    @Autowired
    private CourseExamineMethodsMAPPER courseExamineMethodsMAPPER;

    @Autowired
    private CourseExamineChildMethodsMAPPER courseExamineChildMethodsMAPPER;

    //获取所有学生平时成绩信息
    @Override
    public List<StudentScore> getAllStudent(int courseId) {
        return studentUsualScoreMAPPER.getAllStudent(courseId);
    }

    //获取老师设置的学生平时成绩分类
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

    //学生成绩表格导出
    @Override
    public ResponseEntity<byte[]> exportStudentUsualScore(int courseId) throws IOException {
        //行列索引
        int rowIndex = 1;
        int columIndex = 0;
//        courseId = 10;

        //工作簿事例
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet();

        //单元格样式
//        CellStyle style = workbook.createCellStyle();
        HSSFCellStyle style = workbook.createCellStyle();
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        // 居中
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setVerticalAlignment(VerticalAlignment.CENTER);


        HSSFRow row1 = sheet.createRow(0);
        row1.setRowStyle(style);
        HSSFRow row2 = sheet.createRow(1);
        row2.setRowStyle(style);
        HSSFRow row3 = sheet.createRow(2);
        row3.setRowStyle(style);
        HSSFRow row4 = sheet.createRow(3);
        row4.setRowStyle(style);

        sheet.addMergedRegion(new CellRangeAddress(1, 3, 0, 0));
        row2.createCell(0).setCellValue("学号");
        sheet.setColumnWidth(0, 20 * 256);

        sheet.addMergedRegion(new CellRangeAddress(1, 3, 1, 1));
        row2.createCell(1).setCellValue("姓名");
        sheet.autoSizeColumn(1);

        sheet.addMergedRegion(new CellRangeAddress(1, 3, 2, 2));
        row2.createCell(2).setCellValue("班级");
        sheet.setColumnWidth(2, 20 * 256);

        //考核条目
        List<DataExtend> usualExamMethods = getUsualExamMethods(courseId);
        columIndex = 3;
        for (DataExtend dataExtend : usualExamMethods) {
            sheet.addMergedRegion(new CellRangeAddress(1, 3, columIndex, columIndex));
            String message = dataExtend.getMessage();
            row2.createCell(columIndex).setCellValue(message);
            sheet.autoSizeColumn(columIndex);
            columIndex++;
        }

        rowIndex = 4;
        //学生列表
        List<StudentScore> allStudent = getAllStudent(courseId);
        for (StudentScore score : allStudent) {
            HSSFRow eachRow = sheet.createRow(rowIndex);
            eachRow.createCell(0).setCellValue(score.getStudentNumber());
            eachRow.getCell(0).setCellStyle(style);
            eachRow.createCell(1).setCellValue(score.getStudentName());
            eachRow.getCell(1).setCellStyle(style);
            eachRow.createCell(2).setCellValue(score.getClassName());
            eachRow.getCell(2).setCellStyle(style);

            //成绩
            int index = 3;
            for (DataExtend dataExtend : usualExamMethods) {
                switch (dataExtend.getMessage()) {
                    case "考勤":
                        eachRow.createCell(index).setCellValue(score.getAttendanceScore());
                        eachRow.getCell(index).setCellStyle(style);
                        index++;
                        break;
                    case "课题提问":
                        eachRow.createCell(index).setCellValue(score.getQuizScore());
                        eachRow.getCell(index).setCellStyle(style);
                        index++;
                        break;
                    case "作业":
                        eachRow.createCell(index).setCellValue(score.getWorkScore());
                        eachRow.getCell(index).setCellStyle(style);
                        index++;
                        break;
                    case "期中测试":
                        eachRow.createCell(index).setCellValue(score.getMidTermScore());
                        eachRow.getCell(index).setCellStyle(style);
                        index++;
                        break;
                }
            }

            rowIndex++;
        }

        //写入文件
        //使用字节数组读取
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        workbook.write(byteArrayOutputStream);
        byte[] bytes = byteArrayOutputStream.toByteArray();

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=template.xls");
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
        return ResponseEntity.ok()
                .headers(headers)
                .body(bytes);
    }

    //学生平时成绩导入
    @Override
    public DataResponses inputStudentUsualScore(MultipartFile file, String courseId) {
        try {
            HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
            HSSFSheet sheet = workbook.getSheetAt(0);

            DataFormatter formatter = new DataFormatter();
            //遍历列
            for (int rowIndex = 4; rowIndex < sheet.getLastRowNum(); rowIndex++) {
                HSSFRow row = sheet.getRow(rowIndex);

                QueryWrapper<StudentInformation> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("student_number",formatter.formatCellValue(row.getCell(0)));
                queryWrapper.eq("course_id",courseId);
                Integer id = studentInformationMAPPER.selectOne(queryWrapper).getId();

                StudentInformation student = new StudentInformation();
                student.setStudentName(formatter.formatCellValue(row.getCell(1)));
                student.setClassName(formatter.formatCellValue(row.getCell(2)));
                student.setId(id);

                studentInformationMAPPER.updateById(student);

                StudentUsualScore studentUsualScore = new StudentUsualScore();

            }
        } catch (IOException ignored) {
        }
        return new DataResponses();
    }
}
