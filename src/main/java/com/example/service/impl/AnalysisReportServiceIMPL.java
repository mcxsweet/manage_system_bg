package com.example.service.impl;

import com.example.object.CourseBasicInformation;
import com.spire.doc.FileFormat;
import com.spire.doc.documents.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import com.spire.doc.*;
import com.spire.doc.documents.HorizontalAlignment;
import com.spire.doc.documents.VerticalAlignment;

@Service
public class AnalysisReportServiceIMPL {
    @Autowired
    private CourseBasicInformationServiceIMPL courseBasicInformationServiceIMPL;

    //生成表格
    private Table generateTable(Section section, int row, int col) {
        section.addParagraph();
        Table table = section.addTable(true);
        table.resetCells(row, col);
        //将表格居中对齐（或设置为靠左或靠右）
        table.getTableFormat().setHorizontalAlignment(RowAlignment.Center);
        //设置表格是否跨页断行
        table.getTableFormat().isBreakAcrossPages(false);
        //表格自适应页面宽度
        table.setDefaultColumnWidth(200f);
        table.autoFit(AutoFitBehaviorType.Auto_Fit_To_Window);
//            table.autoFit(AutoFitBehaviorType.Auto_Fit_To_Contents)

        section.addParagraph();
        return table;
    }

    //表格内容居中
    private void cellCenter(Table table) {
        for (int row = 0; row < table.getRows().getCount(); row++) {
            TableRow tableRow = table.getRows().get(row);
            tableRow.setHeight(30f);
            for (int col = 0; col < table.getDefaultColumnsNumber(); col++) {
                TableCell cell = tableRow.getCells().get(col);
                cell.getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
            }
        }
    }

    public ResponseEntity<byte[]> getReport(int courseId, int type) {
        try {
            Document document = new Document();

            //添加一个section
            Section section = document.addSection();
            //设置页面大小为A3
            section.getPageSetup().setPageSize(com.spire.doc.documents.PageSize.A3);
            //设置页面方向为Landscape纵向
            section.getPageSetup().setOrientation(PageOrientation.Portrait);
            //设置页边距
            section.getPageSetup().getMargins().setTop(60f);
            section.getPageSetup().getMargins().setBottom(60f);
            section.getPageSetup().getMargins().setLeft(60f);
            section.getPageSetup().getMargins().setRight(80f);


            //标题样式
            ParagraphStyle style1 = new ParagraphStyle(document);
            style1.setName("titleStyle");
            style1.getCharacterFormat().setBold(true);
            //设置字体颜色
//            style1.getCharacterFormat().setTextColor(Color.BLUE);
            style1.getCharacterFormat().setFontName("宋体");
            style1.getCharacterFormat().setFontSize(30f);
            document.getStyles().add(style1);

            //文本样式
            ParagraphStyle style2 = new ParagraphStyle(document);
            style2.setName("contentStyle");
            style2.getCharacterFormat().setFontName("宋体");
            style2.getCharacterFormat().setFontSize(15f);
            document.getStyles().add(style2);

            //二级标题样式
            ParagraphStyle style3 = new ParagraphStyle(document);
            style3.setName("title2Style");
            style3.getCharacterFormat().setBold(true);
            style3.getCharacterFormat().setFontName("宋体");
            style3.getCharacterFormat().setFontSize(20f);
            document.getStyles().add(style3);

            /*
                段落文字部分
             */

            Paragraph para1 = section.addParagraph();
            para1.appendText("西南林业大学课程考核分析报告");
            para1.applyStyle("titleStyle");
            para1.getFormat().setHorizontalAlignment(HorizontalAlignment.Center);


            CourseBasicInformation courseBasicInformation = courseBasicInformationServiceIMPL.getById(courseId);
            String courseInformation = "( " + courseBasicInformation.getTermStart() + " —— " + courseBasicInformation.getTermEnd() + " 学年 " + "第 " + courseBasicInformation.getTerm() + " 学期 )";
            Paragraph para2 = section.addParagraph();
            para2.appendText(courseInformation);
            para2.applyStyle("contentStyle");
            para2.getFormat().setHorizontalAlignment(HorizontalAlignment.Center);


            section.addParagraph();
            Paragraph para3 = section.addParagraph();
            para3.appendText("填表时间:   年   月   日");
            para3.applyStyle("contentStyle");
            para3.getFormat().setHorizontalAlignment(HorizontalAlignment.Right);

            section.addParagraph();
            Paragraph para4 = section.addParagraph();
            para4.appendText("一、基本情况");
            para4.applyStyle("title2Style");
            para4.getFormat().setHorizontalAlignment(HorizontalAlignment.Left);
            //添加表格
            Table table = generateTable(section,5,6);
            // 合并单元格
            table.applyHorizontalMerge(2, 3, 5);
            table.applyHorizontalMerge(3, 1, 2);
            table.applyHorizontalMerge(3, 4, 5);
            table.applyHorizontalMerge(4, 1, 5);

            table.get(0, 0).addParagraph().appendText("课程名称");
            table.get(0, 1).addParagraph().appendText(courseBasicInformation.getCourseName());
            table.get(0, 2).addParagraph().appendText("授课学时");
            table.get(0, 3).addParagraph().appendText(String.valueOf(courseBasicInformation.getTheoreticalHours()));
            table.get(0, 4).addParagraph().appendText("学分");
            table.get(0, 5).addParagraph().appendText("4");

            table.get(1, 0).addParagraph().appendText("考核时间");
            table.get(1, 1).addParagraph().appendText("2021 年__1_月__13_日");
            table.get(1, 2).addParagraph().appendText("课程号");
            table.get(1, 3).addParagraph().appendText(String.valueOf(courseBasicInformation.getTheoreticalHours()));
            table.get(1, 4).addParagraph().appendText("课序号");
            table.get(1, 5).addParagraph().appendText("42312313");

            table.get(2, 0).addParagraph().appendText("任课教师/职称");
            table.get(2, 1).addParagraph().appendText(courseBasicInformation.getClassroomTeacher());
            table.get(2, 2).addParagraph().appendText("考试类别");
            table.get(2, 3).addParagraph().appendText("笔试√ 口试 实际 操作");

            table.get(3, 0).addParagraph().appendText("考核方式");
            table.get(3, 1).addParagraph().appendText("开卷   闭卷√   上机   综述   论文   设计   其他");
            table.get(3, 3).addParagraph().appendText("课程类型");
            table.get(3, 4).addParagraph().appendText(courseBasicInformation.getCourseNature());

            table.get(4, 0).addParagraph().appendText("考核对象");
            String s = "专业班级: " + courseBasicInformation.getClassName() + "\n应考人数: " + courseBasicInformation.getStudentsNum() + "\n实考人数: " + courseBasicInformation.getStudentsNum();
            table.get(4, 1).addParagraph().appendText(s);

            //设置单元格格式
            cellCenter(table);
            //表二
            section.addParagraph();
            Paragraph para5 = section.addParagraph();
            para5.appendText("二、命题评价、卷面质量");
            para5.applyStyle("title2Style");
            para5.getFormat().setHorizontalAlignment(HorizontalAlignment.Left);
            //添加表格
            Table table2 = generateTable(section,6,6);
            table2.applyHorizontalMerge(0, 1, 2);
            table2.applyHorizontalMerge(0, 4, 5);
            table2.applyHorizontalMerge(2, 1, 2);
            table2.applyHorizontalMerge(2, 4, 5);
            table2.applyHorizontalMerge(3, 1, 2);
            table2.applyHorizontalMerge(3, 4, 5);
            table2.applyHorizontalMerge(4, 1, 2);
            table2.applyHorizontalMerge(4, 4, 5);
            table2.applyHorizontalMerge(5, 1, 5);

            table2.get(0, 0).addParagraph().appendText("命题方式");
            table2.get(0, 1).addParagraph().appendText("试题库 试卷库 集体命题√");
            table2.get(0, 3).addParagraph().appendText("评分标准拟定人");

            table2.get(1, 0).addParagraph().appendText("审题人");
            table2.get(1, 2).addParagraph().appendText("试做试卷教师");
            table2.get(1, 4).addParagraph().appendText("试做试卷时间");
            table2.get(1, 5).addParagraph().appendText("90 分钟");

            table2.get(2, 0).addParagraph().appendText("符合大纲要求");
            table2.get(2, 1).addParagraph().appendText("符合√ 基本符合 不符合");
            table2.get(2, 3).addParagraph().appendText("题量大小");
            table2.get(2, 4).addParagraph().appendText("偏多 适中√ 偏少");

            table2.get(3, 0).addParagraph().appendText("题型难易程度");
            table2.get(3, 1).addParagraph().appendText("难 偏难 适中√ 简单");
            table2.get(3, 3).addParagraph().appendText("题意表述");
            table2.get(3, 4).addParagraph().appendText("好 较好√ 一般");

            table2.get(4, 0).addParagraph().appendText("内容覆盖面");
            table2.get(4, 1).addParagraph().appendText(">90%√  >80%  >70%  >60%");
            table2.get(4, 3).addParagraph().appendText("插图");
            table2.get(4, 4).addParagraph().appendText("清晰√ 中等 一般");

            table2.get(5, 0).addParagraph().appendText("题型");

            //表格单元格格式
            cellCenter(table2);

            //表三
            Paragraph para6 = section.addParagraph();
            para6.appendText("三、成绩分析");
            para6.applyStyle("title2Style");
            para6.getFormat().setHorizontalAlignment(HorizontalAlignment.Left);

            Table table3 =  generateTable(section,2,2);

            table3.get(0, 0).addParagraph().appendText("平时成绩考核");
            table3.get(0, 1).addParagraph().appendText("考勤 作业 √ 课堂讨论√ 小论文 期中考试 其他√");
            table3.get(1, 0).addParagraph().appendText("总评成绩比例");
            table3.get(1, 1).addParagraph().appendText("期末考试 50% ;平时 30%(课堂讨论 10%;平时作业 10%;综述论文 10%);实验 20%");

            cellCenter(table3);
            //设置首行缩进
//            Paragraph para = section.getParagraphs().get(3);
//            ParagraphFormat format = para.getFormat();
//            format.setFirstLineIndent(30);

            //保存文档
//            document.saveToFile("Output.docx", FileFormat.Docx);

            byte[] Bytes = null;
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            document.saveToStream(outputStream, FileFormat.Docx);
            Bytes = outputStream.toByteArray();
            outputStream.close();

            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=Output.docx");
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_FORM_URLENCODED_VALUE);


            return ResponseEntity.ok().headers(headers).body(Bytes);
        } catch (IOException ignored) {
        }
        return null;
    }
}
