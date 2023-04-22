package com.example.service.examinePaper;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.object.finalExamine.StudentScore;
import com.example.object.finalExamine.StudentUsualScore;
import com.example.utility.DataExtend;
import com.example.utility.DataResponses;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface StudentUsualScoreSERVICE extends IService<StudentUsualScore> {
    //mapper中添加的方法在此处声明
    //也可以通过@Override重写方法
    List<StudentScore> getAllStudent(int courseId);

    List<DataExtend> getUsualExamMethods(int courseID);

    ResponseEntity<byte[]> exportStudentUsualScore(int courseId) throws IOException;

    DataResponses inputStudentUsualScore(MultipartFile file, String courseId) throws IOException;
}
