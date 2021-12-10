package com.ysj.core.dao;

import com.ysj.core.po.Teacher;
import com.ysj.core.po.TeacherExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {
	//统计教师人数
    int countByExample(TeacherExample example);

    //删除教师
    int deleteByExample(TeacherExample example);

    //根据教师编号删除教师
    int deleteByPrimaryKey(String tId);

    //添加教师
    int insert(Teacher record);

    int insertSelective(Teacher record);

    List<Teacher> selectByExample(TeacherExample example);

    Teacher selectByPrimaryKey(String tId);

    int updateByExampleSelective(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByExample(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
    
    int update1(String tId);
    
    int editInfo1(@Param("deptName") String deptName,
    		      @Param("deptId") String deptId);
    
    int editInfo2(@Param("majorName") String majorName,
		      @Param("majorId") String majorId);
    
    List <Teacher> findTeacherBydept(String dept);
    
}