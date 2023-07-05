package com.example.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.mapper.CourseExamineChildMethodsMAPPER;
import com.example.mapper.CourseExamineMethodsMAPPER;
import com.example.mapper.CourseTargetMAPPER;
import com.example.mapper.comprehensiveAnalyse.CourseAchievementAnalyseMAPPER;
import com.example.mapper.comprehensiveAnalyse.CourseScoreAnalyseMAPPER;
import com.example.mapper.comprehensiveAnalyse.CourseTargetAnalyseMAPPER;
import com.example.mapper.examinePaper.*;
import com.example.object.CourseBasicInformation;
import com.example.object.CourseExamineChildMethods;
import com.example.object.CourseExamineMethods;
import com.example.object.CourseTarget;
import com.example.object.comprehensiveAnalyse.CourseAchievementAnalyse;
import com.example.object.comprehensiveAnalyse.CourseScoreAnalyse;
import com.example.object.comprehensiveAnalyse.CourseTargetAnalyse;
import com.example.object.comprehensiveAnalyse.KeyValue;
import com.example.object.finalExamine.*;
import com.example.utility.export.export;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spire.doc.FileFormat;
import com.spire.doc.documents.*;
import com.spire.doc.fields.DocPicture;
import com.spire.xls.*;
import com.spire.xls.core.IChartTrendLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.spire.doc.*;
import com.spire.doc.documents.HorizontalAlignment;
import com.spire.doc.documents.VerticalAlignment;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

@Service
public class AnalysisReportServiceIMPL {
    @Autowired
    private CourseBasicInformationServiceIMPL courseBasicInformationServiceIMPL;
    @Autowired
    private CourseTargetMAPPER courseTargetMAPPER;
    @Autowired
    private CourseExamineMethodsMAPPER courseExamineMethodsMAPPER;
    @Autowired
    private CourseExamineChildMethodsMAPPER courseExamineChildMethodsMAPPER;
    @Autowired
    private CourseScoreAnalyseMAPPER courseScoreAnalyseMAPPER;
    @Autowired
    private CourseFinalExamPaperMAPPER courseFinalExamPaperMAPPER;
    @Autowired
    private CourseFinalExamPaperDetailMAPPER courseFinalExamPaperDetailMAPPER;
    @Autowired
    private CourseAchievementAnalyseMAPPER courseAchievementAnalyseMAPPER;
    @Autowired
    private StudentUsualScoreMAPPER studentUsualScoreMAPPER;
    @Autowired
    private StudentFinalScoreMAPPER studentFinalScoreMAPPER;
    @Autowired
    private StudentInformationMAPPER studentInformationMAPPER;
    @Autowired
    private CourseTargetAnalyseMAPPER courseTargetAnalyseMAPPER;


    //在word文档中生成表格
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

        table.setDefaultRowHeight(200f);

        //给表格应用样式
//        table.applyStyle(DefaultTableStyle.Medium_Shading_1_Accent_1);

        //设置表格的右边框
        table.getTableFormat().getBorders().getRight().setBorderType(BorderStyle.Hairline);
        table.getTableFormat().getBorders().getRight().setLineWidth(1.0F);
        table.getTableFormat().getBorders().getRight().setColor(Color.BLACK);

        //设置表格的顶部边框
        table.getTableFormat().getBorders().getTop().setBorderType(BorderStyle.Hairline);
        table.getTableFormat().getBorders().getTop().setLineWidth(1.0F);
        table.getTableFormat().getBorders().getTop().setColor(Color.BLACK);

        //设置表格的左边框
        table.getTableFormat().getBorders().getLeft().setBorderType(BorderStyle.Hairline);
        table.getTableFormat().getBorders().getLeft().setLineWidth(1.0F);
        table.getTableFormat().getBorders().getLeft().setColor(Color.BLACK);

        //设置表格的底部边框
        table.getTableFormat().getBorders().getBottom().setBorderType(BorderStyle.Hairline);
        table.getTableFormat().getBorders().getBottom().setLineWidth(1.0F);
        table.getTableFormat().getBorders().getBottom().setColor(Color.BLACK);

        section.addParagraph();
        return table;
    }

    //在word文档中绘制空行
    private void nullRow(Section section, int row) {
        for (int i = 0; i < row; i++) {
            section.addParagraph();
        }
    }

    //在word表格中绘制空行
    private void nullRow(Table table, int row, int column, int count) {
        for (int i = 0; i < count; i++) {
            table.get(row, column).addParagraph();
        }
    }

    //在word文档中设置段落文字及其样式
    private void addText(Section section, String text, String style, Boolean center) {
        Paragraph para = section.addParagraph();
        para.appendText(text);
        para.applyStyle(style);
        if (center) {
            para.getFormat().setHorizontalAlignment(HorizontalAlignment.Center);
        }
    }

    //在word文档使用excel中生成图表
    private byte[] generateCharts(JSONArray jsonArray, int index) {
        try {
            //先在xls中生成图表
            Workbook workbook = new Workbook();
            Worksheet sheet = workbook.getWorksheets().get(0);

            //设置列宽,工作表名
            sheet.getCellRange("A1:B1").setColumnWidth(15f);

            //添加图表数据源
            int i = 1;
            for (Object item : jsonArray) {
                i++;
                KeyValue value = new ObjectMapper().convertValue(item, KeyValue.class);
                sheet.getCellRange("A" + i).setValue(String.valueOf(value.getValue()));
                sheet.getCellRange("B" + i).setValue(String.valueOf(value.getIndex()));
            }

            sheet.setName("散点图");

            //创建散点图
            Chart chart = sheet.getCharts().add(ExcelChartType.ScatterMarkers);
            chart.setDataRange(sheet.getCellRange("B2:B" + i));
            chart.setSeriesDataFromRange(false);

            //添加图表标题、系列标签
            chart.setChartTitle("课程目标" + index + "达成情况");
            chart.getChartTitleArea().isBold(true);
            chart.getChartTitleArea().setSize(12);
            chart.getSeries().get(0).setCategoryLabels(sheet.getCellRange("B2:B" + i));
            chart.getSeries().get(0).setValues(sheet.getCellRange("A2:A" + i));

            //添加趋势线
            IChartTrendLine trendLine = chart.getSeries().get(0).getTrendLines().add(TrendLineType.Linear);
            trendLine.setName("趋势线");

            //添加坐标轴名称
            chart.getPrimaryValueAxis().setTitle("成绩达成情况");
            chart.getPrimaryCategoryAxis().setTitle("学生人数");

            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            BufferedImage image = workbook.saveChartAsImage(workbook.getWorksheets().get(0), 0);
            ImageIO.write(image, "PNG", outStream);
            byte[] bytes = outStream.toByteArray();

            return bytes;
        } catch (Exception exception) {
            return null;
        }
    }

    //在word文档中插入图表
    private void insertChart(Document document, byte[] bytes, Section section) {
        DocPicture picture = new DocPicture(document);
        picture.loadImage(bytes);

        Paragraph para = section.addParagraph();
        para.getFormat().setHorizontalAlignment(HorizontalAlignment.Center);
        para.getChildObjects().insert(0, picture);

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

    //生成报告文档version_1
    public ResponseEntity<byte[]> getReport1(int courseId, int type) {
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
            Table table = generateTable(section, 5, 6);
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
            Table table2 = generateTable(section, 6, 6);
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

            Table table3 = generateTable(section, 2, 2);

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
            return null;
        }
    }

    //生成报告文档version_2
    public ResponseEntity<byte[]> getReport(HttpServletResponse response, int courseId, int type) {
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

            //一级标题样式
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
            //标题
            nullRow(section, 10);
            addText(section, "西南林业大学", "titleStyle", true);
            addText(section, "课程考核分析和目标达成情况分析报告", "titleStyle", true);


            //绘制空行
            nullRow(section, 10);
            addText(section, "1.课程考核分析报告", "title2Style", true);
            addText(section, "2.课程教学小结", "title2Style", true);
            addText(section, "3.课程目标达成情况分析报告", "title2Style", true);

            //第二段
            //课程目标达成情况分析报告
            Section section2 = document.addSection();
            addText(section2, "西南林业大学", "titleStyle", true);
            addText(section2, "课程目标达成情况分析报告", "titleStyle", true);

            //添加表格
            section2.addParagraph();
            CourseBasicInformation courseBasicInformation = courseBasicInformationServiceIMPL.getById(courseId);
            Table table = generateTable(section2, 3, 4);
            cellCenter(table);
            table.get(0, 0).addParagraph().appendText("课程名称");
            table.get(0, 1).addParagraph().appendText(courseBasicInformation.getCourseName());
            table.get(0, 2).addParagraph().appendText("课程代码");
            table.get(0, 3).addParagraph().appendText("课程代码#####");

            table.get(1, 0).addParagraph().appendText("任课教师姓名");
            table.get(1, 1).addParagraph().appendText(courseBasicInformation.getClassroomTeacher());
            table.get(1, 2).addParagraph().appendText("课程性质");
            table.get(1, 3).addParagraph().appendText(courseBasicInformation.getCourseType());

            table.get(2, 0).addParagraph().appendText("授课班级");
            table.get(2, 1).addParagraph().appendText(courseBasicInformation.getMajor());
            table.get(2, 2).addParagraph().appendText("学生人数");
            table.get(2, 3).addParagraph().appendText(String.valueOf(courseBasicInformation.getStudentsNum()));

            //获取课程目标
            QueryWrapper<CourseTarget> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("course_id", courseId);
            queryWrapper.orderByAsc("id");
            List<CourseTarget> courseTargets = courseTargetMAPPER.selectList(queryWrapper);

            addText(section2, "一、课程目标", "title2Style", false);
            addText(section2, "（1）课程目标", "title2Style", false);
            section2.addParagraph();
            addText(section2, "本课程的课程目标如下：", "contentStyle", false);
            for (CourseTarget target : courseTargets) {
                String targetName = target.getTargetName();
                String courseTarget = target.getCourseTarget();
                addText(section2, targetName + "：" + courseTarget, "contentStyle", false);
                nullRow(section2, 1);
            }


            addText(section2, "（2）课程目标对毕业要求的支撑", "title2Style", false);
            Table table2 = generateTable(section2, courseTargets.size() + 1, 3);
            table2.applyStyle(DefaultTableStyle.Medium_Shading_1_Accent_1);
            cellCenter(table2);
            table2.get(0, 0).addParagraph().appendText("课程目标");
            table2.get(0, 1).addParagraph().appendText("支撑权重");
            table2.get(0, 2).addParagraph().appendText("毕业要求指标点");

            int i = 1;
            for (CourseTarget target : courseTargets) {
                if (i > courseTargets.size()) {
                    break;
                }
                String indicatorPoints = target.getIndicatorPoints();
                JSONArray jsonArray = JSONArray.parseArray(indicatorPoints);

                table2.get(i, 0).addParagraph().appendText(target.getTargetName());
                table2.get(i, 1).addParagraph().appendText(String.valueOf(target.getWeight()));

                String s = "";
                for (Object o : jsonArray) {
                    s += o.toString() + " ";
                }
                table2.get(i, 2).addParagraph().appendText(s);
                i++;
            }

            addText(section2, "二、评分规则", "title2Style", false);
            nullRow(section2, 1);
            addText(section2, "（1）评价方法", "title2Style", false);
            section2.addParagraph();
            addText(section2, "课程目标达成考核与评价方式是成绩评定法。", "contentStyle", false);

            //获取考核评价方式
            QueryWrapper<CourseExamineMethods> queryWrapper2 = new QueryWrapper<>();
            queryWrapper2.eq("course_id", courseId);
            List<CourseExamineMethods> courseExamineMethods = courseExamineMethodsMAPPER.selectList(queryWrapper2);

            StringBuilder text = new StringBuilder("成绩评定法: 期末成绩=");
            for (int j = 0; j < courseExamineMethods.size(); j++) {
                String examineItem = courseExamineMethods.get(j).getExamineItem();
                int percentage = courseExamineMethods.get(j).getPercentage();
                String s = examineItem + percentage + "%";
                if (j == courseExamineMethods.size() - 1) {
                    text.append(s);
                    break;
                }
                text.append(s).append(" + ");
            }
            addText(section2, text.toString(), "contentStyle", false);

            nullRow(section2, 1);
            addText(section2, "（2）考核环节及成绩比例", "title2Style", false);
            section2.addParagraph();
            addText(section2, "评价比重", "contentStyle", false);

            List<List> courseExamineChildMethods = new ArrayList<>();
            for (CourseExamineMethods target : courseExamineMethods) {
                Integer id = target.getId();
                QueryWrapper<CourseExamineChildMethods> queryWrapper1 = new QueryWrapper<>();
                queryWrapper1.eq("course_examine_methods_id", id);
                List<CourseExamineChildMethods> courseExamineChildMethods1 = courseExamineChildMethodsMAPPER.selectList(queryWrapper1);
                courseExamineChildMethods.add(courseExamineChildMethods1);
            }
            //统计考核方式数量
            int rowNum = 0;
            for (List<CourseExamineChildMethods> item : courseExamineChildMethods) {
                rowNum += item.size();
            }

            Table table3 = generateTable(section2, rowNum + 1, 4);
            table3.applyStyle(DefaultTableStyle.Medium_Shading_1_Accent_1);
            cellCenter(table3);
            table3.get(0, 0).addParagraph().appendText("考核项目");
            table3.get(0, 1).addParagraph().appendText("项目百分比");
            table3.get(0, 2).addParagraph().appendText("考核子项目");
            table3.get(0, 3).addParagraph().appendText("子项目百分比");

            int rowIndex = 1;
            int i1 = 0;
            for (List<CourseExamineChildMethods> item : courseExamineChildMethods) {
                int temp = rowIndex;
                table3.get(rowIndex, 0).addParagraph().appendText(courseExamineMethods.get(i1).getExamineItem());
                table3.get(rowIndex, 1).addParagraph().appendText(String.valueOf(courseExamineMethods.get(i1).getPercentage()));
                for (CourseExamineChildMethods childItem : item) {
                    table3.get(rowIndex, 2).addParagraph().appendText(childItem.getExamineChildItem());
                    table3.get(rowIndex, 3).addParagraph().appendText(String.valueOf(childItem.getChildPercentage()));
                    rowIndex++;
                }
                table3.applyVerticalMerge(0, temp, rowIndex - 1);
                table3.applyVerticalMerge(1, temp, rowIndex - 1);

                i1++;
            }

            //计分方法与对应的课程目标
//            Section section3 = document.addSection();
            addText(section2, "计分方法与对应的课程目标", "contentStyle", false);

            rowNum = courseTargets.size() * courseExamineMethods.size();
            Table table4 = generateTable(section2, rowNum + 1, 4);
            table4.applyStyle(DefaultTableStyle.Medium_Shading_1_Accent_1);
            cellCenter(table4);
            table4.get(0, 0).addParagraph().appendText("课程教学目标");
            table4.get(0, 1).addParagraph().appendText("预设的学习任务");
            table4.get(0, 2).addParagraph().appendText("观测点");
            table4.get(0, 3).addParagraph().appendText("标准计分");

            rowIndex = 1;
            for (CourseTarget courseTarget : courseTargets) {
                int temp = rowIndex;
                table4.get(rowIndex, 0).addParagraph().appendText(courseTarget.getTargetName());
                for (CourseExamineMethods courseExamineMethod : courseExamineMethods) {
                    table4.get(rowIndex, 1).addParagraph().appendText(courseExamineMethod.getExamineItem());

                    QueryWrapper<CourseExamineChildMethods> queryWrapper1 = new QueryWrapper<>();
                    queryWrapper1.eq("course_examine_methods_id", courseExamineMethod.getId());
                    List<CourseExamineChildMethods> courseExamineChildMethods1 = courseExamineChildMethodsMAPPER.selectList(queryWrapper1);

                    String s = "";
                    int n = 0;
                    if (courseExamineMethod.getExamineItem().contains("平时")) {
                        for (CourseExamineChildMethods item : courseExamineChildMethods1) {
                            //判断是否含有该课程目标
                            JSONArray jsonArray = JSONArray.parseArray(item.getCourseTarget());
                            for (Object o : jsonArray) {
                                if (courseTarget.getTargetName().contains(o.toString())) {
                                    s += item.getExamineChildItem() + " ";
                                    n += item.getChildPercentage();
                                }
                            }
                        }
                        table4.get(rowIndex, 2).addParagraph().appendText(s);
                        table4.get(rowIndex, 3).addParagraph().appendText(String.valueOf(n));

                    } else if (courseExamineMethod.getExamineItem().contains("期末")) {
                        for (CourseExamineChildMethods item : courseExamineChildMethods1) {
                            if (item.getExamineChildItem().contains("试卷")) {
                                QueryWrapper<CourseFinalExamPaper> queryWrapper3 = new QueryWrapper<>();
                                queryWrapper3.eq("exam_child_method_id", item.getId());
                                List<CourseFinalExamPaper> courseFinalExamPapers = courseFinalExamPaperMAPPER.selectList(queryWrapper3);

                                String itemName;
                                for (CourseFinalExamPaper item2 : courseFinalExamPapers) {
                                    itemName = item2.getItemName();

                                    QueryWrapper<CourseFinalExamPaperDetail> queryWrapper4 = new QueryWrapper<>();
                                    queryWrapper4.eq("primary_id", item2.getId());
                                    List<CourseFinalExamPaperDetail> courseFinalExamPaperDetails = courseFinalExamPaperDetailMAPPER.selectList(queryWrapper4);

                                    for (CourseFinalExamPaperDetail item3 : courseFinalExamPaperDetails) {
                                        JSONArray jsonArray = JSONArray.parseArray(item3.getCourseTarget());
                                        for (Object o : jsonArray) {
                                            if (courseTarget.getTargetName().contains(o.toString())) {
                                                itemName += item3.getTitleNumber() + " ";
                                                n += item3.getScore();
                                            }
                                        }
                                    }
                                    table4.get(rowIndex, 2).addParagraph().appendText(itemName);
                                }
                                table4.get(rowIndex, 3).addParagraph().appendText(String.valueOf(n));
                                n = 0;
                            }
                        }
                    }


                    rowIndex++;
                }
                table4.applyVerticalMerge(0, temp, rowIndex - 1);
            }

            //评价标准
            addText(section2, "（3）评分标准", "title2Style", false);
            Table table5 = generateTable(section2, 10, 3);
            table5.applyStyle(DefaultTableStyle.Medium_Shading_1_Accent_1);
            table5.get(0, 0).addParagraph().appendText("考核方式");
            table5.get(0, 1).addParagraph().appendText("评价标准");
            table5.get(0, 2).addParagraph().appendText("得分");

            addText(section2, "（4）考核成绩情况", "title2Style", false);
            addText(section2, "学生考核成绩见附件，无考核成绩调整情况。", "contentStyle", false);
            nullRow(section2, 3);

            addText(section2, "三、课程目标达成情况分析", "title2Style", false);
            nullRow(section2, 1);
            addText(section2, "（1）评分标准", "title2Style", false);
            section2.addParagraph();
            addText(section2, "\t依据" + courseBasicInformation.getClassName() + "班《" + courseBasicInformation.getCourseName() + "》原始考试成绩中学生个体所对应的各观测点数据分析，可得各课程目标考试成绩达成情况散点分布：", "contentStyle", false);


            //获取绘制表格所需的数据
            QueryWrapper<CourseAchievementAnalyse> queryWrapper5 = new QueryWrapper<>();
            queryWrapper5.eq("course_id", courseId);
            CourseAchievementAnalyse courseAchievementAnalyse = courseAchievementAnalyseMAPPER.selectOne(queryWrapper5);

            //绘制图表
            JSONArray jsonArray = JSONArray.parseArray(courseAchievementAnalyse.getValue());
            for (int j = 0; j < jsonArray.size(); j++) {

                JSONArray jsonArray1 = JSONArray.parseArray(jsonArray.get(j).toString());
                byte[] bytes = generateCharts(jsonArray1, j + 1);

                insertChart(document, bytes, section2);
                nullRow(section2, 2);
            }

            Section section3 = document.addSection();
            addText(section3, "（2）课程目标达成情况", "title2Style", false);
            section3.addParagraph();
            addText(section3, "本课程各目标评价结果如下：", "contentStyle", false);

            rowNum = courseTargets.size() * courseExamineMethods.size();
            Table table6 = generateTable(section3, rowNum + 2, 7);
            table6.applyStyle(DefaultTableStyle.Medium_Shading_1_Accent_1);
            cellCenter(table6);
            table6.get(0, 0).addParagraph().appendText("课程教学目标");
            table6.get(0, 1).addParagraph().appendText("预设的学习任务");
            table6.get(0, 2).addParagraph().appendText("观测点");
            table6.get(0, 3).addParagraph().appendText("标准计分");
            table6.get(0, 4).addParagraph().appendText("学生所得平均分");
            table6.get(0, 5).addParagraph().appendText("观测点达成度");
            table6.get(0, 6).addParagraph().appendText("课程目标达成度");

            rowIndex = 1;

            List<StudentUsualScore> studentUsualScores = studentUsualScoreMAPPER.getAllStudent(courseId);
            List<StudentFinalScore> studentFinalScores = studentFinalScoreMAPPER.getAllStudent(courseId);

            QueryWrapper<CourseTargetAnalyse> queryWrapper6 = new QueryWrapper<>();
            queryWrapper6.eq("course_id", courseId);
            List<CourseTargetAnalyse> courseTargetAnalyses = courseTargetAnalyseMAPPER.selectList(queryWrapper6);

            String resultStr = "";
            double result = 0;

            for (CourseTarget courseTarget : courseTargets) {
                int temp = rowIndex;
                table6.get(rowIndex, 0).addParagraph().appendText(courseTarget.getTargetName());

                CourseTargetAnalyse currentTarget = null;
                for (CourseTargetAnalyse item : courseTargetAnalyses) {
                    if (item.getTargetName().equals(courseTarget.getTargetName())) {
                        currentTarget = item;
                    }
                }
                double usualAchievement = 0;
                double finalAchievement = 0;

                for (CourseExamineMethods courseExamineMethod : courseExamineMethods) {
                    table6.get(rowIndex, 1).addParagraph().appendText(courseExamineMethod.getExamineItem());

                    QueryWrapper<CourseExamineChildMethods> queryWrapper1 = new QueryWrapper<>();
                    queryWrapper1.eq("course_examine_methods_id", courseExamineMethod.getId());
                    List<CourseExamineChildMethods> courseExamineChildMethods1 = courseExamineChildMethodsMAPPER.selectList(queryWrapper1);

                    String s = "";
                    int n = 0;
                    if (courseExamineMethod.getExamineItem().contains("平时")) {
                        boolean[] boolArray = new boolean[courseExamineChildMethods1.size()];

                        int childMethodsIndex = 0;
                        for (CourseExamineChildMethods item : courseExamineChildMethods1) {
                            //判断是否含有该课程目标
                            boolean isHave = false;
                            JSONArray jsonArray2 = JSONArray.parseArray(item.getCourseTarget());
                            for (Object o : jsonArray2) {
                                if (courseTarget.getTargetName().contains(o.toString())) {
                                    //标准计分
                                    s += item.getExamineChildItem() + " ";
                                    isHave = true;
                                    n += item.getChildPercentage();
                                }
                            }
                            //构建关系数组
                            boolArray[childMethodsIndex] = isHave;
                            childMethodsIndex++;
                        }

                        double sum = 0;
                        for (StudentUsualScore items : studentUsualScores) {
                            JSONArray jsonArray1 = JSONArray.parseArray(items.getScoreDetails());
                            for (int j = 0; j < jsonArray1.size(); j++) {
                                if (boolArray[j]) {
                                    sum += Double.parseDouble(jsonArray1.get(j).toString());
                                }
                            }

                        }
                        double v = export.doubleFormat(sum / studentUsualScores.size(), 2);
                        double v2 = export.doubleFormat(v / n, 2);
                        usualAchievement = v2 * courseExamineMethod.getPercentage() * 0.01;

                        table6.get(rowIndex, 2).addParagraph().appendText(s);
                        table6.get(rowIndex, 3).addParagraph().appendText(String.valueOf(n));
                        table6.get(rowIndex, 4).addParagraph().appendText(String.valueOf(v));
                        table6.get(rowIndex, 5).addParagraph().appendText(String.valueOf(v2));

                    } else if (courseExamineMethod.getExamineItem().contains("期末")) {
                        for (CourseExamineChildMethods item : courseExamineChildMethods1) {
                            if (item.getExamineChildItem().contains("试卷")) {
                                QueryWrapper<CourseFinalExamPaper> queryWrapper3 = new QueryWrapper<>();
                                queryWrapper3.eq("exam_child_method_id", item.getId());
                                List<CourseFinalExamPaper> courseFinalExamPapers = courseFinalExamPaperMAPPER.selectList(queryWrapper3);

                                String itemName;
                                for (CourseFinalExamPaper item2 : courseFinalExamPapers) {
                                    itemName = item2.getItemName();

                                    QueryWrapper<CourseFinalExamPaperDetail> queryWrapper4 = new QueryWrapper<>();
                                    queryWrapper4.eq("primary_id", item2.getId());
                                    List<CourseFinalExamPaperDetail> courseFinalExamPaperDetails = courseFinalExamPaperDetailMAPPER.selectList(queryWrapper4);

                                    for (CourseFinalExamPaperDetail item3 : courseFinalExamPaperDetails) {
                                        JSONArray jsonArray3 = JSONArray.parseArray(item3.getCourseTarget());
                                        for (Object o : jsonArray3) {
                                            if (courseTarget.getTargetName().contains(o.toString())) {
                                                itemName += item3.getTitleNumber() + " ";
                                                n += item3.getScore();
                                            }
                                        }
                                    }
                                    table6.get(rowIndex, 2).addParagraph().appendText(itemName);
                                }

                                double sum = 0;
                                String matrix = currentTarget.getMatrix();
                                JSONArray jsonArray1 = JSONArray.parseArray(matrix);


                                for (StudentFinalScore items : studentFinalScores) {
                                    List<String> strings = export.toArray(export.stringTo2DArray(items.getScoreDetails()));
                                    for (int j = 0; j < strings.size(); j++) {
                                        if (Boolean.parseBoolean(jsonArray1.get(j).toString())) {
                                            sum += Double.parseDouble(strings.get(j));
                                        }
                                    }
                                }

                                double v = export.doubleFormat(sum / studentFinalScores.size(), 2);
                                double v2 = export.doubleFormat(v / n, 2);

                                finalAchievement = v2 * courseExamineMethod.getPercentage() * 0.01;

                                table6.get(rowIndex, 3).addParagraph().appendText(String.valueOf(n));
                                table6.get(rowIndex, 4).addParagraph().appendText(String.valueOf(v));
                                table6.get(rowIndex, 5).addParagraph().appendText(String.valueOf(v2));

                                n = 0;
                            }
                        }
                    }


                    rowIndex++;
                }
                double v = export.doubleFormat(usualAchievement + finalAchievement, 2);
                table6.applyVerticalMerge(0, temp, rowIndex - 1);
                table6.get(rowIndex - 1, 6).addParagraph().appendText(String.valueOf(v));
                table6.applyVerticalMerge(6, temp, rowIndex - 1);

                resultStr += v + " x " + courseTarget.getWeight() + " + ";
                result += v * courseTarget.getWeight();
            }

            result = export.doubleFormat(result, 2);
            resultStr = resultStr.substring(0, resultStr.length() - 1);
            resultStr = resultStr + " = " + result;

            table6.get(rowIndex, 0).addParagraph().appendText("总课程目标达成度");
            table6.applyHorizontalMerge(rowIndex, 0, 1);
            table6.get(rowIndex, 2).addParagraph().appendText(resultStr);
            table6.applyHorizontalMerge(rowIndex, 2, 6);


            nullRow(section3, 5);
            addText(section3, "四、面向学生的课程目标达成度评价问卷调查结果", "title2Style", false);
            addText(section3, "\t在调查问卷中，对课程目标达成情况的评价为“完全达成、较好达成、基本达成、未达成”四个等级。针对本课程目标达成情况的问卷调查结果如图5所示。", "contentStyle", false);
            nullRow(section3, 20);
            addText(section3, "五、课程持续改进措施", "title2Style", false);
            addText(section3, "（1）近两学年教学课程目标达成度对比", "title2Style", false);

            Table table7 = generateTable(section3, 4, courseTargets.size());
            table7.applyStyle(DefaultTableStyle.Medium_Shading_1_Accent_1);
            cellCenter(table7);
            table7.get(0, 0).addParagraph().appendText("授课时间");
            table7.applyVerticalMerge(0, 0, 1);
            table7.get(0, 1).addParagraph().appendText("课程目标达成度");
            table7.applyHorizontalMerge(0, 1, courseTargets.size() - 1);

            table7.get(2, 0).addParagraph().appendText("XX学年第X学期");
            table7.get(3, 0).addParagraph().appendText("XX学年第X学期");

            addText(section3, "（2）存在问题及持续改进", "title2Style", false);
            Table table8 = generateTable(section3, 5, 3);
            cellCenter(table8);
            table8.get(0, 0).addParagraph().appendText("上轮教学");
            table8.get(1, 0).addParagraph().appendText("本轮教学");
            table8.applyVerticalMerge(0, 1, 4);


            addText(section3, "任课教师签字", "contentStyle", false);
            section3.addParagraph();
            addText(section3, "系（教研室）主任签字", "contentStyle", false);
            section3.addParagraph();
            addText(section3, "填写时间", "contentStyle", false);

            Section section4 = document.addSection();
            addText(section4, "附件:学生考核成绩", "contentStyle", false);
            List<StudentComprehensiveScore> comprehensiveScore = studentInformationMAPPER.getComprehensiveScore(courseId);

            Table table9 = generateTable(section4, comprehensiveScore.size() + 1, 6);
            table9.applyStyle(DefaultTableStyle.Medium_Shading_1_Accent_1);
            cellCenter(table9);
            table9.get(0, 0).addParagraph().appendText("学号");
            table9.get(0, 1).addParagraph().appendText("姓名");
            table9.get(0, 2).addParagraph().appendText("班级");
            table9.get(0, 3).addParagraph().appendText("平时成绩");
            table9.get(0, 4).addParagraph().appendText("期末卷面成绩");
            table9.get(0, 5).addParagraph().appendText("综合成绩");

            rowIndex = 1;
            for (StudentComprehensiveScore item : comprehensiveScore) {
                table9.get(rowIndex, 0).addParagraph().appendText(item.getStudentNumber());
                table9.get(rowIndex, 1).addParagraph().appendText(item.getStudentName());
                table9.get(rowIndex, 2).addParagraph().appendText(item.getClassName());
                table9.get(rowIndex, 3).addParagraph().appendText(String.valueOf(item.getUsualScore()));
                table9.get(rowIndex, 4).addParagraph().appendText(String.valueOf(item.getFinalScore()));
                table9.get(rowIndex, 5).addParagraph().appendText(String.valueOf(item.getComprehensiveScore()));
                rowIndex++;
            }

            byte[] Bytes;
            String fileName = "";
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            response.reset();

            if (type == 1) {
                document.saveToStream(outputStream, FileFormat.Docx);
                fileName = "课程目标达成评价分析报告.docx";
                response.setContentType("application/msword");

            } else if (type == 2) {
                document.saveToStream(outputStream, FileFormat.PDF);
                fileName = "课程目标达成评价分析报告.pdf";
                response.setContentType("application/pdf");
            }

            Bytes = outputStream.toByteArray();
            outputStream.close();

            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes(), "iso-8859-1"));

            return ResponseEntity.ok()
                    .body(Bytes);
        } catch (IOException ignored) {
            return null;
        }
    }

    //生成课程试卷分析报告表
    public ResponseEntity<byte[]> getReport3(HttpServletResponse response, int courseId, int type) {
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


            //一级标题样式
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
            //标题
            addText(section, "试卷分析报告", "title2Style", true);

            //添加表格数据
            CourseBasicInformation courseBasicInformation = courseBasicInformationServiceIMPL.getById(courseId);
            QueryWrapper<CourseScoreAnalyse> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("course_id", courseId);
            CourseScoreAnalyse scoreAnalyse = courseScoreAnalyseMAPPER.selectOne(queryWrapper);

            addText(section, courseBasicInformation.getTermStart() + "-" + courseBasicInformation.getTermEnd() + "学年第" + courseBasicInformation.getTerm() + "学期", "contentStyle", true);

            addText(section, "课程名称: " + courseBasicInformation.getCourseName() + "\t\t课程代码: XXXXX\t\t课程性质: " + courseBasicInformation.getCourseNature() + "\t\t学分: 4\t", "contentStyle", true);

            Table table = generateTable(section, 9, 7);
            cellCenter(table);
            // 合并单元格
//            table.applyHorizontalMerge(2, 3, 5);
            table.get(0, 0).addParagraph().appendText("任课教师");
            table.get(0, 1).addParagraph().appendText(courseBasicInformation.getClassroomTeacher());
            table.get(0, 2).addParagraph().appendText("授课班级");
            table.get(0, 3).addParagraph().appendText(courseBasicInformation.getClassName());
            table.applyHorizontalMerge(0, 3, 6);

            table.get(1, 0).addParagraph().appendText("考试形式");
            table.get(1, 1).addParagraph().appendText("XXXX");
            table.get(1, 2).addParagraph().appendText("考试日期");
            table.get(1, 3).addParagraph().appendText("XXXX-XX-XX");
            table.applyHorizontalMerge(1, 3, 4);
            table.get(1, 5).addParagraph().appendText("人数");
            table.get(1, 6).addParagraph().appendText(String.valueOf(courseBasicInformation.getStudentsNum()));

            table.get(2, 0).addParagraph().appendText("试卷成绩");
            table.applyVerticalMerge(0, 2, 5);
            table.get(2, 1).addParagraph().appendText("成绩等级");
            table.get(2, 2).addParagraph().appendText("< 60");
            table.get(2, 3).addParagraph().appendText("60 - 69");
            table.get(2, 4).addParagraph().appendText("70 - 79");
            table.get(2, 5).addParagraph().appendText("80 - 89");
            table.get(2, 6).addParagraph().appendText("90 - 100");

            table.get(3, 1).addParagraph().appendText("人数");
            table.get(3, 2).addParagraph().appendText(String.valueOf(scoreAnalyse.getFailed()));
            table.get(3, 3).addParagraph().appendText(String.valueOf(scoreAnalyse.getPass()));
            table.get(3, 4).addParagraph().appendText(String.valueOf(scoreAnalyse.getGood()));
            table.get(3, 5).addParagraph().appendText(String.valueOf(scoreAnalyse.getGreat()));
            table.get(3, 6).addParagraph().appendText(String.valueOf(scoreAnalyse.getSuperior()));

            table.get(4, 1).addParagraph().appendText("所占比例");
            double i = export.doubleFormat(scoreAnalyse.getFailed() * 1.0 / scoreAnalyse.getStudentNum(), 2);
            table.get(4, 2).addParagraph().appendText(String.valueOf(i));

            i = export.doubleFormat(scoreAnalyse.getPass() * 1.0 / scoreAnalyse.getStudentNum(), 2);
            table.get(4, 3).addParagraph().appendText(String.valueOf(i));

            i = export.doubleFormat(scoreAnalyse.getGood() * 1.0 / scoreAnalyse.getStudentNum(), 2);
            table.get(4, 4).addParagraph().appendText(String.valueOf(i));

            i = export.doubleFormat(scoreAnalyse.getGreat() * 1.0 / scoreAnalyse.getStudentNum(), 2);
            table.get(4, 5).addParagraph().appendText(String.valueOf(i));

            i = export.doubleFormat(scoreAnalyse.getSuperior() * 1.0 / scoreAnalyse.getStudentNum(), 2);
            table.get(4, 6).addParagraph().appendText(String.valueOf(i));

            table.get(5, 1).addParagraph().appendText("平均值");
            table.get(5, 2).addParagraph().appendText(String.valueOf(scoreAnalyse.getAverageScore()));
            table.get(5, 3).addParagraph().appendText("最高分");
            table.get(5, 4).addParagraph().appendText(String.valueOf(scoreAnalyse.getMaxScore()));
            table.get(5, 5).addParagraph().appendText("最低分");
            table.get(5, 6).addParagraph().appendText(String.valueOf(scoreAnalyse.getMinScore()));

            table.get(6, 0).addParagraph().appendText("试卷情况分析");
            table.applyHorizontalMerge(6, 1, 6);
            nullRow(table, 6, 0, 20);

            table.get(7, 0).addParagraph().appendText("改进措施");
            table.applyHorizontalMerge(7, 1, 6);
            nullRow(table, 7, 0, 20);

            table.get(8, 0).addParagraph().appendText("教研室主任（签字）：");
            table.applyHorizontalMerge(8, 0, 1);
            table.applyHorizontalMerge(8, 2, 3);

            table.get(8, 4).addParagraph().appendText("日期：");
            table.applyHorizontalMerge(8, 4, 6);

            byte[] Bytes;
            String fileName = "";
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            response.reset();

            if (type == 1) {
                document.saveToStream(outputStream, FileFormat.Docx);
                fileName = "课程试卷分析报告.docx";

            } else if (type == 2) {
                document.saveToStream(outputStream, FileFormat.PDF);
                fileName = "课程试卷分析报告.pdf";
            }
            Bytes = outputStream.toByteArray();
            outputStream.close();

            response.setCharacterEncoding("utf-8");
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes(), "iso-8859-1"));

            //            return ResponseEntity.ok().headers(headers).body(Bytes);
            return ResponseEntity.ok().body(Bytes);
        } catch (IOException ignored) {
            return null;
        }
    }

    //生成课程教学小结表
    public ResponseEntity<byte[]> getReport4(HttpServletResponse response, int courseId, int type) {
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


            //一级标题样式
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
            //标题
            addText(section, "西南林业大学课程教学小结表", "title2Style", true);

            //添加表格数据
            CourseBasicInformation courseBasicInformation = courseBasicInformationServiceIMPL.getById(courseId);

            Table table = generateTable(section, 10, 6);
            cellCenter(table);
            // 合并单元格
//            table.applyHorizontalMerge(2, 3, 5);
            table.get(0, 0).addParagraph().appendText("授课学期");
            table.get(0, 1).addParagraph().appendText(courseBasicInformation.getTermStart() + "-" + courseBasicInformation.getTermEnd() + "-" + courseBasicInformation.getTerm());
            table.get(0, 2).addParagraph().appendText("课程名称");
            table.get(0, 3).addParagraph().appendText(courseBasicInformation.getCourseName());
            table.applyHorizontalMerge(0, 3, 5);

            table.get(1, 0).addParagraph().appendText("总学时");
            table.get(1, 1).addParagraph().appendText(String.valueOf(courseBasicInformation.getTheoreticalHours()));
            table.get(1, 2).addParagraph().appendText("实验学时");
            table.get(1, 3).addParagraph().appendText(String.valueOf(courseBasicInformation.getLabHours()));
            table.get(1, 4).addParagraph().appendText("实习天数");
            table.get(1, 5).addParagraph().appendText("XXXX");

            table.get(2, 0).addParagraph().appendText("开课院系");
            table.get(2, 1).addParagraph().appendText("大数据与智能工程系");
            table.get(2, 2).addParagraph().appendText("授课班级");
            table.get(2, 3).addParagraph().appendText(courseBasicInformation.getClassName());
            table.get(2, 4).addParagraph().appendText("学生人数");
            table.get(2, 5).addParagraph().appendText(String.valueOf(courseBasicInformation.getStudentsNum()));

            table.get(3, 0).addParagraph().appendText("多媒体教学");
            table.get(3, 1).addParagraph().appendText("xxxx");
            table.get(3, 2).addParagraph().appendText("双语教学");
            table.get(3, 3).addParagraph().appendText("XXXX");
            table.get(3, 4).addParagraph().appendText("考核方式");
            table.get(3, 5).addParagraph().appendText("统考");

            table.get(4, 0).addParagraph().appendText("所用教材");
            table.get(4, 1).addParagraph().appendText(courseBasicInformation.getTextBook());
            table.applyHorizontalMerge(4, 1, 3);
            table.get(4, 4).addParagraph().appendText("出版日期");
            table.get(4, 3).addParagraph().appendText("XXXX-xx-xx");

            table.get(5, 0).addParagraph().appendText("课程教学总结");
            table.applyHorizontalMerge(5, 1, 5);
            nullRow(table, 5, 0, 20);

            table.get(6, 0).addParagraph().appendText("今后改革设想");
            table.applyHorizontalMerge(6, 1, 5);
            nullRow(table, 6, 0, 20);

            table.get(7, 0).addParagraph().appendText("填报人");
            table.applyHorizontalMerge(7, 1, 2);
            table.get(7, 3).addParagraph().appendText("职称");
            table.applyHorizontalMerge(7, 4, 5);

            table.get(8, 0).addParagraph().appendText("填报日期：");
            table.applyHorizontalMerge(8, 0, 5);

            table.get(9, 0).addParagraph().appendText("教研室负责人审阅意见：");
            table.applyHorizontalMerge(9, 0, 5);
            nullRow(table, 9, 0, 5);
            table.get(9, 0).addParagraph().appendText("签名：                       年    月    日");
            table.get(9, 0).getLastParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Right);

            byte[] Bytes;
            String fileName = "";
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            response.reset();

            if (type == 1) {
                document.saveToStream(outputStream, FileFormat.Docx);
                fileName = "课程教学小结表.docx";

            } else if (type == 2) {
                document.saveToStream(outputStream, FileFormat.PDF);
                fileName = "课程教学小结表.pdf";
            }
            Bytes = outputStream.toByteArray();
            outputStream.close();

            response.setCharacterEncoding("utf-8");
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes(), "iso-8859-1"));

//            return ResponseEntity.ok().headers(headers).body(Bytes);
            return ResponseEntity.ok().body(Bytes);
        } catch (IOException ignored) {
            return null;
        }
    }

}
