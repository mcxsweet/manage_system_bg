package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.object.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMAPPER extends BaseMapper<User> {
//    在此出写拓展sql
}
