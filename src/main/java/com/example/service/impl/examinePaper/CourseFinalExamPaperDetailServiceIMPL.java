package com.example.service.impl.examinePaper;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.CourseBasicInformationMAPPER;
import com.example.mapper.CourseExamineChildMethodsMAPPER;
import com.example.mapper.CourseExamineMethodsMAPPER;
import com.example.mapper.CourseTargetMAPPER;
import com.example.mapper.examinePaper.CourseFinalExamPaperDetailMAPPER;
import com.example.mapper.examinePaper.CourseFinalExamPaperMAPPER;
import com.example.object.CourseBasicInformation;
import com.example.object.CourseTarget;
import com.example.object.finalExamine.courseFinalExamPaper;
import com.example.object.finalExamine.courseFinalExamPaperDetail;
import com.example.service.examinePaper.CourseFinalExamPaperDetailSERVICE;

import com.spire.xls.FileFormat;
import com.spire.xls.Workbook;
import org.apache.poi.hssf.usermodel.*;

import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;

@Service
public class CourseFinalExamPaperDetailServiceIMPL extends ServiceImpl<CourseFinalExamPaperDetailMAPPER, courseFinalExamPaperDetail> implements CourseFinalExamPaperDetailSERVICE {

    @Autowired
    private CourseFinalExamPaperDetailMAPPER courseFinalExamPaperDetailMAPPER;
    @Autowired
    private CourseBasicInformationMAPPER courseBasicInformationMAPPER;
    @Autowired
    private CourseFinalExamPaperMAPPER courseFinalExamPaperMAPPER;
    @Autowired
    private CourseTargetMAPPER courseTargetMAPPER;
    @Autowired
    private CourseExamineMethodsMAPPER courseExamineMethodsMAPPER;
    @Autowired
    private CourseExamineChildMethodsMAPPER courseExamineChildMethodsMAPPER;


    @Override
    public ResponseEntity<byte[]> ExportExamPaperRelationExcel(HttpServletResponse response) throws IOException {

        //行索引
        int rowIndex = 0;
        File file = new File("src/main/resources/static/试卷和指标点对应关系.xls");
        FileInputStream fIP = new FileInputStream(file);
        //Get the workbook instance for XLS file
        HSSFWorkbook workbook2 = new HSSFWorkbook(fIP);

        HSSFWorkbook workbook = workbook2;

        HSSFSheet sheet = workbook.getSheetAt(0);

        //第一行
        HSSFRow row0 = sheet.getRow(0);
        //第二行
        HSSFRow row = sheet.getRow(1);
        //第三行
        HSSFRow row3 = sheet.getRow(2);
        //第四行
        HSSFRow row4 = sheet.getRow(3);
        //单元格样式
        HSSFCellStyle cellStyle3 = row3.getCell(2).getCellStyle();
        HSSFCellStyle cellStyle4 = row4.getCell(2).getCellStyle();


        //第一列（指标点和课程目标）
        //课程id
        int courseId = 10;
        //第五行开始
        rowIndex = 4;

        //获取当前课程的指标点和课程目标（用于表格赋值）
        CourseBasicInformation information = courseBasicInformationMAPPER.selectById(courseId);
        String indicatorPoints = information.getIndicatorPoints();
        //当前指标点
        JSONArray currentIndicatorPoints = JSON.parseArray(indicatorPoints);
        QueryWrapper<CourseTarget> queryWrapper2 = new QueryWrapper<>();
        queryWrapper2.eq("course_id", courseId);
        queryWrapper2.orderByAsc("target_name");
        //当前课程目标
        List<CourseTarget> courseTargets = courseTargetMAPPER.selectList(queryWrapper2);

        //表格赋值指标点
        int indicateNum = 0;
        sheet.autoSizeColumn(0);
        //行样式
        HSSFCellStyle cellStyle1 = sheet.getRow(4).getCell(0).getCellStyle();
        HSSFCellStyle cellStyle2 = sheet.getRow(6).getCell(0).getCellStyle();
        for (int i = 0; i < currentIndicatorPoints.size(); i++) {
            HSSFRow row2 = sheet.createRow(rowIndex);
            row2.setRowStyle(cellStyle1);
            row2.createCell(0).setCellValue(currentIndicatorPoints.getString(i));
            row2.getCell(0).setCellStyle(cellStyle1);
            rowIndex++;
            indicateNum++;
        }
        //绘制空行（隔开指标点和课程目标）
        rowIndex++;
        //表格赋值课程目标
        for (CourseTarget courseTarget : courseTargets) {
            HSSFRow row2 = sheet.createRow(rowIndex);
            row2.setRowStyle(cellStyle2);
            row2.createCell(0).setCellValue(courseTarget.getTargetName());
            row2.getCell(0).setCellStyle(cellStyle2);
            rowIndex++;
        }


        //获取题型，小题，分值并且对其对应指标点和课程目标关系
        QueryWrapper<courseFinalExamPaper> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("exam_child_method_id", 36);//参数是前端输入的考核方式id
        queryWrapper.orderByAsc("id");
        //请求+遍历
        List<courseFinalExamPaper> courseFinalExamPapers = courseFinalExamPaperMAPPER.selectList(queryWrapper);
        int temp = 2;
        int columIndex = 2;

        List<courseFinalExamPaperDetail> courseFinalExamPaperDetails;
        for (courseFinalExamPaper courseFinalExamPaper : courseFinalExamPapers) {

            QueryWrapper<courseFinalExamPaperDetail> queryWrapper3 = new QueryWrapper<>();
            queryWrapper3.orderByAsc("title_number");
            queryWrapper3.eq("primary_id", courseFinalExamPaper.getId());

            courseFinalExamPaperDetails = courseFinalExamPaperDetailMAPPER.selectList(queryWrapper3);

            for (courseFinalExamPaperDetail courseFinalExamPaperDetail : courseFinalExamPaperDetails) {
                sheet.setColumnWidth(columIndex, 5 * 256);
                row0.createCell(columIndex).setCellStyle(cellStyle3);
                row.createCell(columIndex).setCellStyle(cellStyle3);

                row3.createCell(columIndex).setCellStyle(cellStyle3);
                row3.getCell(columIndex).setCellValue(courseFinalExamPaperDetail.getTitleNumber());
                row4.createCell(columIndex).setCellStyle(cellStyle4);
                row4.getCell(columIndex).setCellValue(courseFinalExamPaperDetail.getScore());

                //表格赋值指标点
                String indicatorPoints1 = courseFinalExamPaperDetail.getIndicatorPoints();
                JSONArray indicatorPointsArrary = JSON.parseArray(indicatorPoints1);
                for (int i = 0; i < indicatorPointsArrary.size(); i++) {
                    for (int j = 4; j < rowIndex; j++) {
                        HSSFRow rown = sheet.getRow(j);
                        if (Objects.equals(rown.getCell(0).getStringCellValue(), indicatorPointsArrary.getString(i))) {
                            rown.createCell(columIndex).setCellValue("√");
                            rown.getCell(columIndex).setCellStyle(cellStyle2);
                        }
                    }
                }

                //表格赋值课程目标
                String courseTarget = courseFinalExamPaperDetail.getCourseTarget();
                JSONArray courseTargetArrary = JSON.parseArray(courseTarget);
                for (int i = 0; i < courseTargetArrary.size(); i++) {
                    for (int j = rowIndex - 4 - indicateNum; j < rowIndex; j++) {
                        HSSFRow rown = sheet.getRow(j);
                        if (Objects.equals(rown.getCell(0).getStringCellValue(), courseTargetArrary.getString(i))) {
                            rown.createCell(columIndex).setCellValue("√");
                            rown.getCell(columIndex).setCellStyle(cellStyle1);
                        }
                    }
                }

                columIndex++;
            }
            sheet.addMergedRegion(new CellRangeAddress(1, 1, temp, columIndex - 1));
            row.getCell(temp).setCellValue(courseFinalExamPaper.getItemName() + "(" + courseFinalExamPaper.getItemScore() + ")");
            temp = columIndex;

        }

        //合并标题单元格设置样式
        row0.createCell(columIndex).setCellStyle(cellStyle3);
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 2, columIndex));
        row0.getCell(2).setCellValue("试卷");
        row3.createCell(columIndex).setCellStyle(cellStyle3);
        sheet.addMergedRegion(new CellRangeAddress(1, 2, columIndex, columIndex));
        row.createCell(columIndex).setCellValue("卷面总分");
        row.getCell(columIndex).setCellStyle(cellStyle3);
        int sum = 0;
        for (int i = 2; i < columIndex; i++) {
            double parseInt = row4.getCell(i).getNumericCellValue();
            sum += parseInt;
        }
        row4.createCell(columIndex).setCellValue(sum);
        row4.getCell(columIndex).setCellStyle(cellStyle3);


        FileOutputStream fileOut = new FileOutputStream("workbook.xls");
        workbook.write(fileOut);
        fileOut.close();

        // 加载 XLS 文件
        Workbook workbookn = new Workbook();
        workbookn.loadFromFile("workbook.xls");
        //设置转换后的PDGF页面高度适应工作表的内容大小
        workbookn.getConverterSetting().setSheetFitToPage(true);
        //设置转换后PDF的页面宽度适应工作表的内容宽度
        workbookn.getConverterSetting().setSheetFitToWidth(true);
        // 将 XLS 文件转换为 PDF 文件
        workbookn.saveToFile("workbook.pdf", FileFormat.PDF);
        //导出部分
        // 将 PDF 文件读入字节数组
        byte[] pdfBytes = Files.readAllBytes(Paths.get("workbook.pdf"));


        /*
            用于导出文件
         */
//        response.reset();
//        response.setContentType("application/vnd.ms-excel");
//        response.setHeader("Content-disposition", "attachment;filename=template.xls");

//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition", "attachment; filename=output.pdf");
//        OutputStream outputStream = response.getOutputStream();

//导出excel
//        workbook.write(outputStream);

//        outputStream.write(pdfBytes);
//        outputStream.flush();
//        outputStream.close();

//        ByteArrayResource resource = new ByteArrayResource(pdfBytes);
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=converted.pdf");
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);

        return ResponseEntity.ok()
                .headers(headers)
                .body(pdfBytes);
    }
}
