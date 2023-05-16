package com.example.utility.export;

import com.example.object.CourseBasicInformation;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class export {

    //导出课程基本信息
    public static void ExportCourseBasicInformationExcel(HttpServletResponse response, CourseBasicInformation information) throws IOException {

        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("课程基本信息");
        HSSFCellStyle style = workbook.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setVerticalAlignment(VerticalAlignment.CENTER);

//        style.setBorderTop(THIN);//上边框
//        style.setBorderBottom(THIN);//下边框
//        style.setBorderLeft(THIN);//左边框
//        style.setBorderRight(THIN);//右边框

        sheet.setColumnWidth(0, 256 * 12);
        sheet.setColumnWidth(5, 256 * 12);

        // 将第一行的三个单元格给合并
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 5));
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("课程基本信息");
        cell.setCellStyle(style);

        row = sheet.createRow(1);
        row.createCell(0).setCellValue("课程名称");
        sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 5));
        row.createCell(1).setCellValue(information.getCourseName());

        row = sheet.createRow(2);
        row.createCell(0).setCellValue("任课教师");
        row.createCell(1).setCellValue(information.getClassroomTeacher());
        row.createCell(2).setCellValue("理论学时");
        row.createCell(3).setCellValue(information.getTheoreticalHours());
        row.createCell(4).setCellValue("实验学时");
        row.createCell(5).setCellValue(information.getLabHours());

        row = sheet.createRow(3);
        row.createCell(0).setCellValue("班级名称");
        sheet.addMergedRegion(new CellRangeAddress(3, 3, 1, 3));
        row.createCell(1).setCellValue(information.getClassName());
        row.createCell(4).setCellValue("学期");
        row.createCell(5).setCellValue(information.getTerm());

        row = sheet.createRow(4);
        row.createCell(0).setCellValue("学生人数");
        row.createCell(1).setCellValue(information.getStudentsNum());
        row.createCell(2).setCellValue("课程性质");
        row.createCell(3).setCellValue(information.getCourseNature());
        row.createCell(4).setCellValue("课程类别");
        row.createCell(5).setCellValue(information.getCourseType());

        row = sheet.createRow(5);
        row.createCell(0).setCellValue("课程目标数量");
        row.createCell(1).setCellValue(information.getCourseTargetNum());

        row = sheet.createRow(6);
        row.createCell(0).setCellValue("指标点数量");
        row.createCell(1).setCellValue(information.getIndicatorPointsNum());

        row = sheet.createRow(7);
        row.createCell(0).setCellValue("指标点编号");

        String[] indicator = information.getIndicatorPoints().split(",");
        for (int i = 0; i < indicator.length; i++) {
            row.createCell(i + 1).setCellValue(indicator[i]);
        }


        OutputStream outputStream = response.getOutputStream();
        response.reset();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=template.xls");

        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    //合并单元格时单元格样式设置
    public static void reloadCellStyle(CellRangeAddress mergedRegion, Sheet sheet, CellStyle style) {
        for (int i = mergedRegion.getFirstRow(); i <= mergedRegion.getLastRow(); i++) {
            Row row = sheet.getRow(i);
            for (int j = mergedRegion.getFirstColumn(); j <= mergedRegion.getLastColumn(); j++) {
                Cell cell = row.getCell(j);
                if (cell != null) {
                    cell.setCellStyle(style);
                }
            }
        }
    }

    //json字符串转二维数组
    public static List<List<String>> stringTo2DArray(String input) {
        try {
            if (input == null) {
                return null;
            }
            ObjectMapper objectMapper = new ObjectMapper();
            return objectMapper.readValue(input, new TypeReference<List<List<String>>>() {
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    //单元格赋值且带样式
    public static void valueToCell(Sheet sheet, int row, int colum, String value, CellStyle style) {
        Row sheetRow;
        if (sheet.getRow(row) == null) {
            sheetRow = sheet.createRow(row);
            sheetRow.setRowStyle(style);
        }
        sheetRow = sheet.getRow(row);
        Cell cell = sheetRow.createCell(colum);
        cell.setCellValue(value);
        cell.setCellStyle(style);
    }
    public static double doubleFormat(double a, int i) {
        String str = "";
        switch (i) {
            case 1:
                str = String.format("%.1f", a);
                break;
            case 2:
                str = String.format("%.2f", a);
                break;
            case 4:
                str = String.format("%.4f", a);
                break;
        }
        return Double.parseDouble(str);
    }
}
