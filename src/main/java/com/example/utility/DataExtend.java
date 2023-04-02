package com.example.utility;


import lombok.Data;

//多数据模型
@Data
public class DataExtend {
    private Object data1;
    private Object data2;
    private Object data3;

    public DataExtend(Object data1, Object data2, Object data3) {
        this.data1 = data1;
        this.data2 = data2;
        this.data3 = data3;
    }

    public DataExtend(Object data1, Object data2) {
        this.data1 = data1;
        this.data2 = data2;
    }

    public DataExtend(Object data1) {
        this.data1 = data1;
    }

    public DataExtend() {
    }
}
