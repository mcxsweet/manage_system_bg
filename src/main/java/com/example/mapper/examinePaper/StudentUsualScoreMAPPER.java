package com.example.mapper.examinePaper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.object.finalExamine.StudentScore;
import com.example.object.finalExamine.StudentUsualScore;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StudentUsualScoreMAPPER extends BaseMapper<StudentUsualScore> {
    //    在此出写拓展sql
    @Select("Select student_information.id,student_information.student_number,student_information.student_name,student_information.class_name,student_information.course_id,student_usual_score.score, student_usual_score.id as usual_score_id from student_information left outer join student_usual_score on student_information.id = student_usual_score.student_id where student_information.course_id = #{courseId}")
    List<StudentScore> getAllStudent(@Param("courseId") int courseId);


}
