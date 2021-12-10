package com.ysj.core.service;

import org.springframework.web.multipart.MultipartFile;
import com.ysj.core.po.Admin;

public interface AdminService {
	//通过id，密码查询管理员
	public Admin findAdmin(String adminId, String adminPwd);
	
	//通过id查询管理员
	public Admin getAdmin(String adminId);
	
	//编辑管理员信息
	public int editInfo(Admin admin);
	
	//上传Excel文件导入教师信息
	public void saveTeacher(MultipartFile file, TeacherService teacherService, BaseDeptService baseDeptService);
	
	//上传Excel文件导入学生信息
	public void saveStudent(MultipartFile file, StudentService studentService, BaseMajorService baseMajorService);
	
}