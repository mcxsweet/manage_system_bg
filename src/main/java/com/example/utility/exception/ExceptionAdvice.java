package com.example.utility.exception;


import com.example.utility.DataResponses;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ExceptionAdvice {

    //异常捕获
    @ExceptionHandler
    public DataResponses doException(Exception exception){

        exception.printStackTrace();
        return new DataResponses(false,"服务端异常，检查操作合理性");
    }
}
