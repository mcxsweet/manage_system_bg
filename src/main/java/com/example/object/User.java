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
}

