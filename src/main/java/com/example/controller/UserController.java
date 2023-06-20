package com.example.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.example.object.LoginDTO;
import com.example.object.User;
import com.example.service.impl.UserServiceIMPL;
import com.example.utility.DataResponses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


@Api(tags = "用户登录")
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceIMPL userService;

    // 会话登录接口
    @PostMapping("/doLogin")
    public DataResponses doLogin(@RequestBody LoginDTO user) {
        return userService.login(user);
    }

    // 查询登录信息 登录信息可以不存在前端，每次需通过后端验证获取
    @GetMapping("/info")
    public DataResponses isLogin() {
        Map<String, Object> map = new HashMap<>();
        String loginId = StpUtil.getLoginIdAsString();
        Object o = StpUtil.getSession().get(loginId);
        map.put("info", o);
        if (loginId.startsWith("admin_")) {
            map.put("identity", "0");
        } else {
            map.put("identity", "1");
        }
        return new DataResponses(true, map);
    }

    /**
     * 退出
     *
     * @return DataResponses
     */
    @GetMapping("/logout")
    public DataResponses logout() {
        StpUtil.logout();
        return new DataResponses(true);
    }

    /**
     * 多角色账号选择登录的角色
     *
     * @param role 0    普通教师
     *             1    系主任
     *             2    学院
     * @return DataResponses
     */
    @PostMapping("/choiceRole")
    public DataResponses choiceRole(@RequestBody Map<String, Integer> role) {
        User user = (User) StpUtil.getSession().get(StpUtil.getLoginIdAsString());
        user.setIsAdmin(role.get("role"));
        StpUtil.getSession().set(String.valueOf(user.getId()), user);
        return new DataResponses(true, user);
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