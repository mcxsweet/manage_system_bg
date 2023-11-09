package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.IndicatorOutlineMAPPER;
import com.example.mapper.IndicatorsMAPPER;
import com.example.object.IndicatorOutline;
import com.example.object.Indicators;
import com.example.service.IndicatorsSERVICE;
import com.example.utility.export.export;
import com.spire.xls.FileFormat;
import com.spire.xls.Workbook;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;

@Service
public class IndicatorsServiceIMPL extends ServiceImpl<IndicatorsMAPPER, Indicators> implements IndicatorsSERVICE {

    @Autowired
    private IndicatorsMAPPER indicatorsMAPPER;
    @Autowired
    private IndicatorOutlineMAPPER indicatorOutlineMAPPER;

    @Override
    public ResponseEntity<byte[]> IndicatorsPDF(String major, String version) {
        try {
            //工作簿事例
            int rowIndex = 2;
            int columIndex = 0;

            HSSFWorkbook workbook = new HSSFWorkbook();
            Sheet sheet = workbook.createSheet();

            //单元格样式
            CellStyle style = workbook.createCellStyle();
            style.setBorderBottom(BorderStyle.THIN);
            style.setBorderTop(BorderStyle.THIN);
            style.setBorderRight(BorderStyle.THIN);
            style.setBorderLeft(BorderStyle.THIN);
            style.setWrapText(true);
            style.setVerticalAlignment(VerticalAlignment.CENTER);

            CellStyle style2 = workbook.createCellStyle();
            style2.setBorderBottom(BorderStyle.THIN);
            style2.setBorderTop(BorderStyle.THIN);
            style2.setBorderRight(BorderStyle.THIN);
            style2.setBorderLeft(BorderStyle.THIN);
            style2.setWrapText(true);
            style2.setAlignment(HorizontalAlignment.CENTER);
            style2.setVerticalAlignment(VerticalAlignment.CENTER);

            Row row1 = sheet.createRow(0);
            row1.setRowStyle(style2);
            CellRangeAddress mergedRegion2 = new CellRangeAddress(0, 0, 0, 2);
            sheet.addMergedRegion(mergedRegion2);
            String pdfTitle = major + "专业指标点";
            if (!Objects.equals(version, "NotSelect")) pdfTitle = version + '级' + pdfTitle;
            row1.createCell(0).setCellValue(pdfTitle);
            export.reloadCellStyle(mergedRegion2, sheet, style2);

            Row row = sheet.createRow(1);
            row.setRowStyle(style2);
            CellRangeAddress mergedRegion = new CellRangeAddress(1, 1, 0, 1);
            sheet.addMergedRegion(mergedRegion);
            row.createCell(0).setCellValue("毕业要求（知识、能力与素质要求）");
            sheet.setColumnWidth(0, 25 * 256);
            sheet.setColumnWidth(1, 30 * 256);
            sheet.setColumnWidth(2, 30 * 256);
            export.reloadCellStyle(mergedRegion, sheet, style2);
            export.valueToCell(sheet, 1, 2, "实现课程（开出课程）", style2);

            QueryWrapper<IndicatorOutline> queryWrapper = new QueryWrapper<>();
            queryWrapper.orderByAsc("id");
            List<IndicatorOutline> indicatorOutlines = indicatorOutlineMAPPER.selectList(queryWrapper);
            int temp = rowIndex;
            for (IndicatorOutline outline : indicatorOutlines) {
                Integer id = outline.getId();
                QueryWrapper<Indicators> queryWrapper1 = new QueryWrapper<>();
                queryWrapper1.eq("indicator_index", id);
                queryWrapper1.like("major", major);
                queryWrapper1.like(!Objects.equals(version, "NotSelect"), "version", version);
                List<Indicators> indicators = indicatorsMAPPER.selectList(queryWrapper1);
                if (indicators.size() == 0) {
                    String S = outline.getName() + "\n" + outline.getContent();
                    export.valueToCell(sheet, temp, 0, S, style);
                    rowIndex++;
                } else {
                    for (Indicators indicator : indicators) {
                        sheet.createRow(rowIndex).setRowStyle(style);
                        String s = indicator.getIndicatorName() + "\n" + indicator.getIndicatorContent();
                        export.valueToCell(sheet, rowIndex, 1, s, style);
                        export.valueToCell(sheet, rowIndex, 2, indicator.getCourses(), style);
                        rowIndex++;
                    }
                    String S = outline.getName() + "\n" + outline.getContent();
                    export.valueToCell(sheet, temp, 0, S, style);
                    mergedRegion = new CellRangeAddress(temp, rowIndex - 1, 0, 0);
                    sheet.addMergedRegion(mergedRegion);
                    export.reloadCellStyle(mergedRegion, sheet, style);
                }
                temp = rowIndex;
            }

            //写入xls文件
            FileOutputStream fileOut = new FileOutputStream("workbook.xls");
            workbook.write(fileOut);
            fileOut.close();

            // 加载 XLS 文件
            Workbook workbookn = new Workbook();
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
        } catch (IOException ignored) {
        }
        return null;
    }

}
