package com.example.mapper.examinePaper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.object.finalExamine.StudentComprehensiveScore;
import com.example.object.finalExamine.StudentInformation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface StudentInformationMAPPER extends BaseMapper<StudentInformation> {

    @Select("Select student_information.id,\n" +
            "       student_information.student_number,\n" +
            "       student_information.student_name,\n" +
            "       student_information.class_name,\n" +
            "       student_information.course_id,\n" +
            "       student_information.comprehensive_score,\n" +
            "       student_usual_score.score as usualScore,\n" +
            "       student_final_score.score as finalScore\n" +
            "from student_information\n" +
            "         left outer join student_usual_score on student_information.id = student_usual_score.student_id\n" +
            "         left outer join student_final_score on student_information.id = student_final_score.student_id\n" +
            "where student_information.course_id = #{courseId};")
    List<StudentComprehensiveScore> getComprehensiveScore(@Param("courseId") int courseId);


    @Update("update student_information set comprehensive_score = #{score} where id = #{studentId};")
    void UpdateComprehensiveScore(double score,int studentId);
}
