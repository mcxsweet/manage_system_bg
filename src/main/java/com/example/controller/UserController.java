package com.example.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.example.object.User;
import com.example.service.impl.UserServiceIMPL;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;


@Api(tags = "用户登录")
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceIMPL userService;

    // 会话登录接口
    @RequestMapping("/doLogin")
    public DataResponses doLogin(@RequestBody User user) {
        return userService.login(user);
    }

    // 查询登录信息 登录信息可以不存在前端，每次需通过后端验证获取
    @RequestMapping("/info")
    public DataResponses isLogin() {
        Object o = StpUtil.getSession().get(StpUtil.getLoginIdAsString());
        return new DataResponses(true, o);
    }

    @ApiOperation("登录接口")
    @PostMapping
    public DataResponses submit(@RequestBody User user, HttpServletResponse response) {
        return userService.loginCheck(user, response);
    }

    @ApiOperation("按id修改")
    @PutMapping()
    public DataResponses UpdateById(@RequestBody User data) {
        return new DataResponses(userService.updateById(data));
    }

    @ApiOperation("添加")
    @PostMapping("/regin")
    public DataResponses write(@RequestBody User pages) {
        return new DataResponses(userService.save(pages));
    }

    @ApiOperation("删除")
    @DeleteMapping
    public DataResponses delete(@RequestBody User pages) {
        return new DataResponses(userService.removeById(pages));
    }

}