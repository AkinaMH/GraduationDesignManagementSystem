package com.ysj.core.service;

import java.util.List;

import com.ysj.core.po.BaseDept;
import com.ysj.core.po.BaseMajor;
import com.ysj.core.po.Student;

public interface StudentService {
	//通过id，密码查询学生
	public Student findStudent(String sId, String sPwd);
	
	//通过id查询学生
	public Student findStudentById(String sId);
	
	//修改学生信息
	public int editInfo(Student student);
	
	//统计学生的总人数
	public int findStudentSum(String major);
	
	
	public List<Student> findStudnetBySeltitlState(String major);
	
	
	public List<Student> Studentlist(Student student);
	
	
	public int createStudent(Student student);
	
	
	public int editInfo1(BaseDept baseDept,String oldName);
	
	
	public int editInfo2(BaseMajor baseMajor);
}