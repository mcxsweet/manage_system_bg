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
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.*;

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

    @Override
    public List<User> getAll() {
        List<User> allUser = userMAPPER.getAll();
        return allUser;
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

    //用户导出 导入模板
    @Override
    public ResponseEntity<byte[]> exportUserInformation(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String fileName = "UserTemplate.xlsx";
            String userAgent = request.getHeader("user-agent");
            if (userAgent != null && userAgent.indexOf("Edge") >= 0) {
                fileName = URLEncoder.encode(fileName, "UTF8");
            } else if (userAgent.indexOf("Firefox") >= 0 || userAgent.indexOf("Chrome") >= 0
                    || userAgent.indexOf("Safari") >= 0) {
                fileName = new String((fileName).getBytes("UTF-8"), "ISO8859-1");
            } else {
                fileName = URLEncoder.encode(fileName, "UTF8");
            }

            // Create a list of headers
            List<String> headers = Arrays.asList( "账号名称", "账号密码", "教师姓名", "教师权限", "所属院系");

            // Create a new Excel workbook
            XSSFWorkbook wb = new XSSFWorkbook();
            OutputStream os = response.getOutputStream();

            try {
                XSSFSheet sheet = wb.createSheet("用户信息模板");
                sheet.setDefaultRowHeight((short) (2 * 256));
                sheet.setDefaultColumnWidth(17);

                // Create the header row
                XSSFRow headerRow = sheet.createRow(0);
                for (int i = 0; i < headers.size() ; i++) {
                    XSSFCell headerCell = headerRow.createCell(i);
                    headerCell.setCellValue(headers.get(i));
                }

                // Write the Excel file to a ByteArrayOutputStream
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                wb.write(bos);
                wb.close();
                bos.close();

                byte[] excelBytes = bos.toByteArray();

                // Set HTTP headers for the response
                HttpHeaders httpHeaders = new HttpHeaders();
                httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                httpHeaders.setContentLength(excelBytes.length);
                httpHeaders.setContentDispositionFormData("attachment", fileName);

                return new ResponseEntity<>(excelBytes, httpHeaders, HttpStatus.OK);
            } catch (Exception e) {
                log.error("export error: {}", e);
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }
    }


    //用户导出 用户信息
    @Override
    public ResponseEntity<byte[]> outUserInformation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fileName = "UserInformation.xlsx";
        String userAgent = request.getHeader("user-agent");
        if (userAgent != null && userAgent.indexOf("Edge") >= 0) {
            fileName = URLEncoder.encode(fileName, "UTF8");
        } else if (userAgent.indexOf("Firefox") >= 0 || userAgent.indexOf("Chrome") >= 0
                || userAgent.indexOf("Safari") >= 0) {
            fileName = new String((fileName).getBytes("UTF-8"), "ISO8859-1");
        } else {
            fileName = URLEncoder.encode(fileName, "UTF8");
        }

        // Replace this with your code to retrieve user data and create a list of user information
        List<User> users = getAll(); // Implement this method to get user data

        // Create a new Excel workbook
        XSSFWorkbook wb = new XSSFWorkbook();

        try {
            XSSFSheet sheet = wb.createSheet("用户信息");
            sheet.setDefaultRowHeight((short) (2 * 256));
            sheet.setDefaultColumnWidth(17);

            // Create the header row
            List<String> headers = Arrays.asList("序号", "账号名称", "账号密码", "教师姓名", "教师权限", "所属院系");
            XSSFRow headerRow = sheet.createRow(0);
            for (int i = 0; i < headers.size(); i++) {
                XSSFCell headerCell = headerRow.createCell(i);
                headerCell.setCellValue(headers.get(i));
            }

            // Create rows with user information
            for (int i = 0; i < users.size(); i++) {
                User user = users.get(i);
                XSSFRow dataRow = sheet.createRow(i + 1);
                XSSFCell cell0 = dataRow.createCell(0);
                cell0.setCellValue(i + 1); // Sequence number
                XSSFCell cell1 = dataRow.createCell(1);
                cell1.setCellValue(user.getName());
                XSSFCell cell2 = dataRow.createCell(2);
                cell2.setCellValue(user.getPassword());
                XSSFCell cell3 = dataRow.createCell(3);
                cell3.setCellValue(user.getTeacherName());
                XSSFCell cell4 = dataRow.createCell(4);
                cell4.setCellValue(user.getIsAdmin());
                XSSFCell cell5 = dataRow.createCell(5);
                cell5.setCellValue(user.getDepartment());
            }

            // Write the Excel file to a ByteArrayOutputStream
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            wb.write(bos);
            wb.close();
            bos.close();

            byte[] excelBytes = bos.toByteArray();

            // Set HTTP headers for the response
            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            httpHeaders.setContentLength(excelBytes.length);
            httpHeaders.setContentDispositionFormData("attachment", fileName);

            return new ResponseEntity<>(excelBytes, httpHeaders, HttpStatus.OK);
        } catch (Exception e) {
            log.error("export error: {}", e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    //用户信息导出
//    @Override
//    public ResponseEntity<byte[]> outUserInformation() throws IOException {
//
//        //工作簿事例
//        int rowIndex = 1;
//        int columIndex = 0;
//        Workbook workbook = new HSSFWorkbook();
//        Sheet sheet = workbook.createSheet();
//
//        //单元格样式
//        CellStyle style = workbook.createCellStyle();
//        style.setBorderBottom(BorderStyle.THIN);
//        style.setBorderTop(BorderStyle.THIN);
//        style.setBorderRight(BorderStyle.THIN);
//        style.setBorderLeft(BorderStyle.THIN);
//        style.setAlignment(HorizontalAlignment.CENTER);
//        style.setVerticalAlignment(VerticalAlignment.CENTER);
//
//
//        //表头设置
//        Row row1 = sheet.createRow(0);
//        row1.setRowStyle(style);
//        Row row2 = sheet.createRow(1);
//        row2.setRowStyle(style);
//        Row row3 = sheet.createRow(2);
//        row3.setRowStyle(style);
//        Row row4 = sheet.createRow(3);
//        row4.setRowStyle(style);
//
//        CellRangeAddress mergedRegion = new CellRangeAddress(1, 3, 0, 0);
//        sheet.addMergedRegion(mergedRegion);
//        row2.createCell(0).setCellValue("账号名称");
//        export.reloadCellStyle(mergedRegion, sheet, style);
//        sheet.setColumnWidth(0, 20 * 256);
//
//        mergedRegion = new CellRangeAddress(1, 3, 1, 1);
//        sheet.addMergedRegion(mergedRegion);
//        row2.createCell(1).setCellValue("账号密码");
//        export.reloadCellStyle(mergedRegion, sheet, style);
//        sheet.autoSizeColumn(1);
//
//        mergedRegion = new CellRangeAddress(1, 3, 2, 2);
//        sheet.addMergedRegion(mergedRegion);
//        row2.createCell(2).setCellValue("教师姓名");
//        export.reloadCellStyle(mergedRegion, sheet, style);
//        sheet.setColumnWidth(2, 20 * 256);
//
//        mergedRegion = new CellRangeAddress(1, 3, 2, 2);
//        sheet.addMergedRegion(mergedRegion);
//        row2.createCell(3).setCellValue("教师权限");
//        export.reloadCellStyle(mergedRegion, sheet, style);
//        sheet.setColumnWidth(2, 20 * 256);
//
//        mergedRegion = new CellRangeAddress(1, 3, 2, 2);
//        sheet.addMergedRegion(mergedRegion);
//        row2.createCell(4).setCellValue("所属院系");
//        export.reloadCellStyle(mergedRegion, sheet, style);
//        sheet.setColumnWidth(2, 20 * 256);
//
//        //写入文件
//        //使用字节数组读取
//        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
//        workbook.write(byteArrayOutputStream);
//        byte[] bytes = byteArrayOutputStream.toByteArray();
//
//        return ResponseEntity.ok()
//                .body(bytes);
//    }
}