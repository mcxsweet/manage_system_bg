package com.example.service.examinePaper;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.object.finalExamine.courseFinalExamPaperDetail;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface CourseFinalExamPaperDetailSERVICE extends IService<courseFinalExamPaperDetail> {
    ResponseEntity<byte[]> ExportExamPaperRelationExcel(HttpServletResponse response) throws IOException;
}
