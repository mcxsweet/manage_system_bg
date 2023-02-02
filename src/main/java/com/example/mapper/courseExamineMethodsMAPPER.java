package com.example.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.object.courseAllInformation;
import com.example.object.courseExamineMethods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface courseExamineMethodsMAPPER extends BaseMapper<courseExamineMethods> {
    //    在此出写拓展sql
    @Select("select * from course_basic_information,course_examine_methods,course_examine_child_methods where course_basic_information.id = #{id} && course_examine_methods.course_id = course_basic_information.id && course_examine_child_methods.course_examine_methods_id = course_examine_methods.id;")
//    @Select("Select * from course_basic_information")
    List<courseAllInformation> getAllInformation(@Param("id") int id);
}

