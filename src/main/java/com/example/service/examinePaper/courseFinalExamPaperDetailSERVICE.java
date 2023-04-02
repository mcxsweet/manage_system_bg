package com.example.service.examinePaper;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.object.finalExamine.courseFinalExamPaperDetail;
import com.itextpdf.text.DocumentException;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface courseFinalExamPaperDetailSERVICE extends IService<courseFinalExamPaperDetail> {
    ResponseEntity<byte[]> ExportExamPaperRelationExcel(HttpServletResponse response) throws IOException, DocumentException;
}
