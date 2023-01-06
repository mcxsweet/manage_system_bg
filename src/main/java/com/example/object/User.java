package com.example.object;

import lombok.Data;

//测试使用
@Data
public class User {
    private int Id;
    private String Name;
    private int Age;

    public User(int id, String name, int age) {
        this.Id = id;
        this.Name = name;
        this.Age = age;
    }
}
