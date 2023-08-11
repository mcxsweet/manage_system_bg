package com.example.object;

import lombok.Data;

@Data
public class User {
    private Integer id;
    private String name;
    private String teacherName;
    private String password;
    private int isAdmin;
    private String department;

    /**
     * 关于isAdmin的说明
     * 0    普通教师
     * 1    系主任
     * 2    学院
     *
     * 3    普通教师 系主任
     * 4    普通教师 学院
     * 5    系主任 学院
     * 6    全部
     */
}

