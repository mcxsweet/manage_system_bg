package com.example.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.UserMAPPER;
import com.example.mapper.examinePaper.StudentInformationMAPPER;
import com.example.object.LoginDTO;
import com.example.object.User;
import com.example.object.finalExamine.StudentInformation;
import com.example.service.UserSERVICE;
import com.example.utility.DataResponses;
import com.example.utility.Token.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceIMPL extends ServiceImpl<UserMAPPER, User> implements UserSERVICE {

    @Autowired
    private UserMAPPER userMAPPER;

    @Autowired
    private StudentInformationMAPPER studentInformationMAPPER;

    @Autowired
    TokenUtil tokenUtil;

    @Override
    public DataResponses loginCheck(User user, HttpServletResponse response) {

        QueryWrapper<User> QueryWrapper = new QueryWrapper<>();
        QueryWrapper.eq("name",user.getName());
        User user2 = userMAPPER.selectOne(QueryWrapper);
        if (user2 == null) {
            return new DataResponses(false,"用户不存在");
        }
        if (!user2.getPassword().equals(user.getPassword())) {
            return new DataResponses(false,"密码错误");
        }
        String token = tokenUtil.generateToken(user2);
        Cookie cookie = new Cookie("token", token);
//        设置cookie的作用域：为”/“时，以在webapp文件夹下的所有应用共享cookie
        cookie.setPath("/");
        response.addCookie(cookie);
        user2.setPassword("");
        return new DataResponses(true,user2,"登录成功");
    }

    @Override
    public DataResponses login(LoginDTO user) {
        Map<String,Object> map = new HashMap<>();
        map.put("identity",user.getIdentity());
        if ("0".equals(user.getIdentity())){
            QueryWrapper<User> QueryWrapper = new QueryWrapper<>();
            QueryWrapper.eq("name",user.getName());
            User user2 = userMAPPER.selectOne(QueryWrapper);
            if (user2 == null) {
                return new DataResponses(false,"用户不存在");
            }
            if (!user2.getPassword().equals(user.getPassword())) {
                return new DataResponses(false,"密码错误");
            }
            StpUtil.login("admin_"+user2.getId());
            user2.setPassword("");
            StpUtil.getSession().set("admin_"+user2.getId(),user2);
            map.put("info",user2);
        } else {
            QueryWrapper<StudentInformation> QueryWrapper = new QueryWrapper<>();
            QueryWrapper.eq("student_number",user.getName());
            StudentInformation studentInformation = studentInformationMAPPER.selectOne(QueryWrapper);
            if (studentInformation == null) {
                return new DataResponses(false,"用户不存在");
            }
            if (!"000000".equals(user.getPassword())) {
                return new DataResponses(false,"密码错误");
            }
            StpUtil.login("student_"+studentInformation.getId());
            StpUtil.getSession().set("student_"+studentInformation.getId(),studentInformation);
            map.put("info",studentInformation);
        }

        //此处只是为了前端不过多修改，实际可不用返回用户信息
        return new DataResponses(true,map, "登录成功");
    }


}
