package com.example.object;

import lombok.Data;

@Data
public class User {

    private Integer id;
    private String name;
    private String teacherName;
    private String password;
    private int isAdmin;
    private int collegeId;
    private int departmentId;

    /**
     * 关于isAdmin的说明
     * 0    普通教师
     * 1    系主任
     * 2    学院

     */

    public void userInfo(String name, String password, String teacherName, int isAdmin, int collegeId,int departmentId) {
        this.name = name;
        this.password = password;
        this.teacherName = teacherName;
        this.isAdmin = isAdmin;
        this.collegeId = collegeId;
        this.departmentId = departmentId;
    }

    public void userInfo() {}

    public void userInfo(String formatCellValue) {
    }
}

