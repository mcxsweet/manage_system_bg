package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.mapper.CourseTargetMAPPER;
import com.example.mapper.IndicatorsMAPPER;
import com.example.mapper.courseSurvey.CourseAttainmentSurveyMAPPER;
import com.example.object.CourseBasicInformation;
import com.example.object.CourseTarget;
import com.example.object.Indicators;
import com.example.object.comprehensiveAnalyse.KeyValue;
import com.example.object.courseSurvey.CourseAttainmentSurvey;
import com.example.service.impl.CourseBasicInformationServiceIMPL;
import com.example.service.impl.IndicatorsServiceIMPL;
import com.example.utility.DataResponses;
import com.example.utility.export.export;
//import com.sun.istack.internal.NotNull;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*")
@Api(tags = "课程信息")
@RestController
@RequestMapping("/courseInfo")
public class CourseBasicInformationController {

    @ApiOperation("检查登录接口")
    @PostMapping("/checkSubmit")
    public DataResponses checkSubmit() {
        return new DataResponses(true);
    }

    /*
        课程基本信息相关接口
     */
    //课程基本信息
    @Autowired
    private CourseBasicInformationServiceIMPL courseBasicInformationService;

    @ApiOperation("查询全部")
    @GetMapping
    public DataResponses getAll() {
        return new DataResponses(true, courseBasicInformationService.list());
    }

    @ApiOperation("按当前用户查询")
    @GetMapping("/currentUser/{currentUserId}")
    public DataResponses getByCurrentUser(@PathVariable int currentUserId) {
        QueryWrapper<CourseBasicInformation> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("teacher_id", currentUserId);
        QueryWrapper.orderByDesc("term_start");
        QueryWrapper.orderByAsc("term");
        return new DataResponses(true, courseBasicInformationService.list(QueryWrapper));
    }

    @ApiOperation("当前用户筛选")
    @PostMapping("/currentUser/{currentUserId}")
    public DataResponses searchByCurrentUser(@PathVariable int currentUserId, @RequestBody CourseBasicInformation searchTable) {
        QueryWrapper<CourseBasicInformation> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("teacher_id", currentUserId);
        QueryWrapper.orderByDesc("term_start");
        QueryWrapper.orderByAsc("term");
        if (searchTable.getCourseName() != null) {
            QueryWrapper.eq("course_name", searchTable.getCourseName());
        }
        if (searchTable.getClassName() != null) {
            QueryWrapper.eq("class_name", searchTable.getClassName());
        }
        if (searchTable.getTermStart() != null) {
            QueryWrapper.eq("term_start", searchTable.getTermStart());
        }
        if (searchTable.getTermEnd() != null) {
            QueryWrapper.eq("term_end", searchTable.getTermEnd());
        }
        if (searchTable.getTerm() != 0) {
            QueryWrapper.eq("term", searchTable.getTerm());
        }
        return new DataResponses(true, courseBasicInformationService.list(QueryWrapper));
    }

    @ApiOperation("按id查询")
    @GetMapping("/{id}")
    public DataResponses getById(@PathVariable int id) {
        return new DataResponses(true, courseBasicInformationService.getById(id));
    }

    @ApiOperation("按id修改")
    @PutMapping()
    public DataResponses UpdateById(@RequestBody CourseBasicInformation data) {
        return new DataResponses(courseBasicInformationService.updateById(data));
    }

    @ApiOperation("导出课程基本信息")
    @GetMapping("/export/{id}")
    public void exportExcel(HttpServletResponse response, @PathVariable int id) throws IOException {

        CourseBasicInformation information = courseBasicInformationService.getById(id);
        //导出文件的方法统一写入到export类中
        export.ExportCourseBasicInformationExcel(response, information);
    }

    @ApiOperation("添加")
    @PostMapping
    public DataResponses write(@RequestBody CourseBasicInformation pages) {
        return new DataResponses(courseBasicInformationService.save(pages));
    }

    @ApiOperation("删除")
    @DeleteMapping
    public DataResponses delete(@RequestBody CourseBasicInformation pages) {
        return new DataResponses(courseBasicInformationService.removeById(pages));
    }

/*
    课程目标相关接口
 */

    //课程目标
    @Autowired
    private CourseTargetMAPPER courseTarget;

    //课程目标调查问卷
    @Autowired
    private CourseAttainmentSurveyMAPPER courseAttainmentSurveyMAPPER;

    @ApiOperation("获取该课程所有课程目标")
    @GetMapping("/courseTarget/{courseId}")
    public DataResponses getCourseTarget(@PathVariable int courseId) {
        QueryWrapper<CourseTarget> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("course_id", courseId);
        return new DataResponses(true, courseTarget.selectList(QueryWrapper));
    }

    @ApiOperation("添加该课程课程目标")
    @PostMapping("/courseTarget")
    public DataResponses addCourseTarget(@RequestBody CourseTarget Data) {
        courseTarget.insert(Data);
//        QueryWrapper<CourseTarget> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("course_id", Data.getCourseId());
//        queryWrapper.eq("target_name", Data.getTargetName());
//        CourseTarget target = courseTarget.selectOne(queryWrapper);
//
//        CourseAttainmentSurvey courseAttainmentSurvey = new CourseAttainmentSurvey();
//        courseAttainmentSurvey.setCourseTargetId(target.getId());
//        courseAttainmentSurveyMAPPER.insert(courseAttainmentSurvey);
        return new DataResponses(true);
    }

    @ApiOperation("修改课程目标")
    @PutMapping("/courseTarget")
    public DataResponses modifyCourseTarget(@RequestBody CourseTarget Data) {
        return new DataResponses(true, courseTarget.updateById(Data));
    }

    @ApiOperation("删除课程目标")
    @DeleteMapping("/courseTarget")
    public DataResponses DeleteCourseTarget(@RequestBody CourseTarget Data) {
        return new DataResponses(true, courseTarget.deleteById(Data));
    }

    /*
        指标点相关接口
     */

    @Autowired
    private IndicatorsMAPPER indicators;
    @Autowired
    private IndicatorsServiceIMPL indicatorsServiceIMPL;

    @ApiOperation("查询全部指标点")
    @GetMapping("/indicators")
    public DataResponses getAllIndicators() {
        return new DataResponses(true, indicators.selectList(null));
    }

    @ApiOperation("查询专业指标点")
    @PostMapping("/indicators")
    public DataResponses getMajorIndicators(@RequestBody HashMap<String, String> major) {
        return new DataResponses(true, indicators.getMajorIndicators(major.get("major")));
    }

    @ApiOperation("指标点PDF")
    @GetMapping("/{major}/indicatorsPDF")
    public ResponseEntity<byte[]> IndicatorsPDF(@PathVariable String major) {
        return indicatorsServiceIMPL.IndicatorsPDF(major);
    }

//    @ApiOperation("添加指标点")
//    @PostMapping("/indicators")
//    public DataResponses insertIndicators(@RequestBody Indicators item) {
//        return new DataResponses(indicators.insert(item));
//    }

    @ApiOperation("删除指标点")
    @DeleteMapping("/indicators")
    public DataResponses removeIndicators(@RequestBody Indicators item) {
        return new DataResponses(indicators.deleteById(item));
    }

    @ApiOperation("修改指标点")
    @PutMapping("/indicators")
    public DataResponses PutIndicators(@RequestBody Indicators item) {
        return new DataResponses(indicators.updateById(item));
    }


    /*
        教学大纲相关接口
     */

    @ApiOperation("教学大纲PDF上传")
    @PostMapping("/syllabus")
    public DataResponses teachingPDF(@RequestParam("file") MultipartFile file,
                                     @RequestParam String courseName,
                                     @RequestParam String type,
                                     @RequestParam String major) {
        DataResponses res = new DataResponses(false, "上传失败");
        try {
            String contentType = file.getContentType();
            if (contentType == null) {
                return res;
            } else if (!contentType.equals("application/pdf")) {
                res.setMessage("只能上传pdf文件");
                return res;
            }
            File directory = new File("");
            String filePath = directory.getCanonicalPath();

            String filename = courseName + ".pdf";
            String filePath_ = filePath + "/pdf/syllabus/" + major + "/" + type;
            File fileRealPath = new File(filePath_);
            //路径不存在则创建
            if (!fileRealPath.exists()) {
                if (!fileRealPath.mkdirs()) {
                    return res;
                }
            }
            File result = new File(filePath_ + "/" + filename);
            file.transferTo(result);
            res = new DataResponses(true, filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return res;
    }

    @ApiOperation("培养方案PDF上传")
    @PostMapping("/educationProgramPDF")
    public DataResponses educationProgramPDF(@RequestParam("file") MultipartFile file,
                                             @RequestParam String major,
                                             @RequestParam String type) {
        DataResponses res = new DataResponses(false, "上传失败");
        try {
            String contentType = file.getContentType();
            if (contentType == null) {
                return res;
            } else if (!contentType.equals("application/pdf")) {
                res.setMessage("只能上传pdf文件");
                return res;
            }
            File directory = new File("");//参数为空
            String filePath = directory.getCanonicalPath();

            String filename = major + ".pdf";
            String filePath_ = filePath + "/pdf/" + type;
            File fileRealPath = new File(filePath_);
            //路径不存在则创建
            if (!fileRealPath.exists()) {
                if (!fileRealPath.mkdirs()) {
                    return res;
                }
            }
            File result = new File(filePath_ + "/" + filename);
            file.transferTo(result);
            res = new DataResponses(true, filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return res;
    }

    @ApiOperation("培养方案PDF查看")
    @GetMapping("/file/{type}/{filename:.*\\.pdf}")
    public ResponseEntity<byte[]> getFile(@PathVariable String type, @PathVariable String filename) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        File directory = new File("");//参数为空
        String filePath = directory.getCanonicalPath();

        Path path = Paths.get(filePath + "/pdf/" + type + '/' + filename);
        File file = path.toFile();
        if (!file.exists()) {
            headers.setContentType(MediaType.APPLICATION_JSON);
            return new ResponseEntity<>(null, headers, HttpStatus.OK);
        }
        // 获取文件的字节数组
        byte[] bytes = Files.readAllBytes(path);

        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentLength(bytes.length);

        return new ResponseEntity<>(bytes, headers, HttpStatus.OK);
    }

    @ApiOperation("教学大纲PDF查看")
    @GetMapping("/file/syllabus/{major}/{type}/{fileName}")
    public ResponseEntity<byte[]> getSyllabusPDF(@PathVariable String major, @PathVariable String type, @PathVariable String fileName) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        File directory = new File("");//参数为空
        String filePath = directory.getCanonicalPath();

        Path path = Paths.get(filePath + "/pdf/syllabus/" + major + '/' + type + '/' + fileName);
        File file = path.toFile();
        if (!file.exists()) {
            headers.setContentType(MediaType.APPLICATION_JSON);
            return new ResponseEntity<>(null, headers, HttpStatus.OK);
        }
        // 获取文件的字节数组
        byte[] bytes = Files.readAllBytes(path);

        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentLength(bytes.length);

        return new ResponseEntity<>(bytes, headers, HttpStatus.OK);
    }

    @ApiOperation("教学大纲PDF查看")
    @DeleteMapping("/file/syllabus/{major}/{type}/{fileName}")
    public DataResponses deleteSyllabusPDF(@PathVariable String major, @PathVariable String type, @PathVariable String fileName) throws IOException {
        File directory = new File("");//参数为空
        String filePath = directory.getCanonicalPath();

        Path path = Paths.get(filePath + "/pdf/syllabus/" + major + '/' + type + '/' + fileName);
        File file = path.toFile();
        if (!file.delete()) {
            return new DataResponses(false,"删除失败");
        }
        return new DataResponses(true,"删除成功");
    }

    @ApiOperation("获取本地教学大纲pdf列表")
    @PostMapping("/syllabusList")
    public DataResponses getPdfList(@RequestBody HashMap<String, String> info) {
        DataResponses res = new DataResponses();
        try {
            //当前项目路径
            String filePath = new File("").getCanonicalPath();

            String filePath_ = filePath + "/pdf/syllabus/" + info.get("major") + "/" + info.get("type");
            File fileRealPath = new File(filePath_);

            String[] list = fileRealPath.list();
            List<Map<String, String>> list1 = new ArrayList<>();
            if (list != null) {
                for (String s : list) {
                    Map<String, String> map = new HashMap<>();
                    map.put("fileName", s);
                    s = s.substring(0, s.length() - 4);
                    map.put("courseName", s);
                    list1.add(map);
                }
            }

            return new DataResponses(true, list1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return res;
    }


}