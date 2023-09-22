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
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

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
        QueryWrapper.eq("name", user.getName());
        User user2 = userMAPPER.selectOne(QueryWrapper);
        if (user2 == null) {
            return new DataResponses(false, "用户不存在");
        }
        if (!user2.getPassword().equals(user.getPassword())) {
            return new DataResponses(false, "密码错误");
        }
        String token = tokenUtil.generateToken(user2);
        Cookie cookie = new Cookie("token", token);
//        设置cookie的作用域：为”/“时，以在webapp文件夹下的所有应用共享cookie
        cookie.setPath("/");
        response.addCookie(cookie);
        user2.setPassword("");
        return new DataResponses(true, user2, "登录成功");
    }

    @Override
    public DataResponses login(LoginDTO user) {
        Map<String, Object> map = new HashMap<>();
        map.put("identity", user.getIdentity());
        if ("0".equals(user.getIdentity())) {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("name", user.getName());
            queryWrapper.last("limit 1");
            User user2 = userMAPPER.selectOne(queryWrapper);
            if (user2 == null) {
                return new DataResponses(false, "用户不存在");
            }
            if (!user2.getPassword().equals(user.getPassword())) {
                return new DataResponses(false, "密码错误");
            }
            StpUtil.login("admin_" + user2.getId());
            user2.setPassword("");
            StpUtil.getSession().set("admin_" + user2.getId(), user2);
            map.put("info", user2);
        } else {
            QueryWrapper<StudentInformation> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("student_number", user.getName());
            queryWrapper.last("limit 1");
            StudentInformation studentInformation = studentInformationMAPPER.selectOne(queryWrapper);
            if (studentInformation == null) {
                return new DataResponses(false, "用户不存在");
            }
            if (!"000000".equals(user.getPassword())) {
                return new DataResponses(false, "密码错误");
            }
            StpUtil.login("student_" + studentInformation.getId());
            StpUtil.getSession().set("student_" + studentInformation.getId(), studentInformation);
            map.put("info", studentInformation);
        }

        //此处只是为了前端不过多修改，实际可不用返回用户信息
        return new DataResponses(true, map, "登录成功");
    }

    //用户信息导入
    @Override
    @Transactional
    public DataResponses inputUserInfo(MultipartFile file) {
        try {
            String fileSuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            Workbook workbook = null;
            DataFormatter formatter = new DataFormatter();

            //判断是否是.xls与.xlsx文件
            if (fileSuffix.equals(".xls")) {
                workbook = new HSSFWorkbook(file.getInputStream());
            } else if (fileSuffix.equals(".xlsx")) {
                workbook = new XSSFWorkbook(file.getInputStream());
            }
            assert workbook != null;
            Sheet sheet = workbook.getSheetAt(0);

            //对应的列位置索引
            int name = 0;
            int teacherName = 0;
            int password = 0;
            int is_admin=0;
            int department=0;
            int i = 0;

            Row row1 = sheet.getRow(0);
            while (true) {
                if (row1.getCell(i) != null) {
                    String s = formatter.formatCellValue(row1.getCell(i));
                    if (Objects.equals(s, "")) {
                        break;
                    }
                    switch (s) {
                        case "账号名称":
                            name = i;
                            break;
                        case "账号密码":
                             password= i;
                            break;
                        case "教师姓名":
                            teacherName = i;
                            break;
                        case "权限":
                            is_admin = i;
                            break;
                        case "所属院系":
                            department = i;
                            break;
                    }
                    i++;
                } else {
                    break;
                }
            }
            //遍历行
            for (int rowIndex = 1; rowIndex < sheet.getLastRowNum() + 1; rowIndex++) {
                Row row = sheet.getRow(rowIndex);

                QueryWrapper<User> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("name", formatter.formatCellValue(row.getCell(name)));
                User username = userMAPPER.selectOne(queryWrapper);


                User user = new User();
                user.setName (formatter.formatCellValue(row.getCell(name)));
                user.setPassword (formatter.formatCellValue(row.getCell(password)));
                user.setTeacherName (formatter.formatCellValue(row.getCell(teacherName)));
                user.setIsAdmin (Integer.parseInt(formatter.formatCellValue(row.getCell(is_admin))));
                user.setDepartment (formatter.formatCellValue(row.getCell(department)));


                Integer id = 0;
//                无则添加
                if (username == null) {
                    user.setName(formatter.formatCellValue(row.getCell(name)));
                    userMAPPER.insert(user);
                }
//                存在即更新
                else {
                    id = username.getId();
                    user.setId(id);
                    userMAPPER.updateById(user);
                }
            }


            return new DataResponses(true, "导入成功");

        } catch (IOException exception) {
            return new DataResponses(false, "导入失败，表格数据有缺失");
        }


    }
}