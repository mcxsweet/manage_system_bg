package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.object.LoginDTO;
import com.example.object.User;
import com.example.utility.DataResponses;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

public interface UserSERVICE extends IService<User> {
    DataResponses loginCheck(User user, HttpServletResponse response);
    //mapper中添加的方法在此处声明
    //也可以通过@Override重写方法

    DataResponses login(LoginDTO user);


    //用户信息导入
    @Transactional
    DataResponses inputUserInfo(MultipartFile file);

}
