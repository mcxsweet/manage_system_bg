package com.example.mapper.examinePaper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.object.finalExamine.StudentInformation;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentInformationMAPPER extends BaseMapper<StudentInformation> {
//    在此出写拓展sql
}
