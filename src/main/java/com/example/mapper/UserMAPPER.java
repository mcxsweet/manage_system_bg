package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.object.User;
import com.example.object.finalExamine.StudentUsualScore;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMAPPER extends BaseMapper<User> {
//    在此出写拓展sql
@Select("Select id,name,teacher_name,password,is_admin,department from user ;")
List<User> getAllUser();
}
