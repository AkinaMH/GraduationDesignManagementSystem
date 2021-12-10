package com.ysj.core.service.impl;

import java.io.InputStream;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.excel.EasyExcel;
import com.ysj.core.dao.AdminMapper;
import com.ysj.core.interceptor.AjglListener;
import com.ysj.core.interceptor.StudentListener;
import com.ysj.core.po.Admin;
import com.ysj.core.po.AdminExample;
import com.ysj.core.po.UpExcel;
import com.ysj.core.po.UpStudent;
import com.ysj.core.service.AdminService;
import com.ysj.core.service.BaseDeptService;
import com.ysj.core.service.BaseMajorService;
import com.ysj.core.service.StudentService;
import com.ysj.core.service.TeacherService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private AdminService adminService;
	
	//查找管理员
	@Override
	public Admin findAdmin(String adminId, String adimPwd) {
		AdminExample example = new AdminExample();
		//用来封装查询条件的
		AdminExample.Criteria criteria=example.createCriteria();
		
		criteria.andAdminIdEqualTo(adminId);
		criteria.andAdminPwdEqualTo(adimPwd);
		
		List<Admin> list= adminMapper.selectByExample(example);
		//select * from Admin where aId=? and aPwd=?
		if (list!=null&& list.size()>0) {
			 return list.get(0);
		}
		return null;
	}

	//编辑管理员信息
	@Override
	public int editInfo(Admin admin) {
		return adminMapper.updateByPrimaryKey(admin);
	}

	//根据id查找管理员
	@Override
	public Admin getAdmin(String adminId) {
		AdminExample example = new AdminExample();
		//用来封装查询条件的
		AdminExample.Criteria criteria=example.createCriteria();
		
		criteria.andAdminIdEqualTo(adminId);
		
		List<Admin> list= adminMapper.selectByExample(example);
		//select * from Admin where aId=? and aPwd=?
		if (list!=null&& list.size()>0) {
			 return list.get(0);
		}
		return null;
	}

	//上传Excel文件导入教师信息
	@Override
	public void saveTeacher(MultipartFile file, TeacherService teacherService, BaseDeptService baseDeptService) {
		try {
            //得到文件输入流
            InputStream in = file.getInputStream();
            //调用方法进入读取,用的EasyExcel组件
            EasyExcel.read(in, UpExcel.class, new AjglListener(teacherService,baseDeptService)).sheet().doRead();

        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}
	
	//上传Excel文件导入学生信息
	@Override
	public void saveStudent(MultipartFile file, StudentService studentService, BaseMajorService baseMajorService) {
		try {
            //得到文件输入流
            InputStream in = file.getInputStream();
            //调用方法进入读取,用的EasyExcel组件
            EasyExcel.read(in, UpStudent.class, new StudentListener(studentService,baseMajorService)).sheet().doRead();

        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

}