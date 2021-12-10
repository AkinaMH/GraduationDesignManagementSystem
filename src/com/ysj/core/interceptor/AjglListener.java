package com.ysj.core.interceptor;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.ysj.core.po.BaseDept;
import com.ysj.core.po.Teacher;
import com.ysj.core.po.UpExcel;
import com.ysj.core.service.BaseDeptService;
import com.ysj.core.service.TeacherService;

public class AjglListener extends AnalysisEventListener<UpExcel> {
	
    public TeacherService teacherService;
    public BaseDeptService baseDeptService;

    //教师监听器
    //生成有参和无参构造方法
    public AjglListener(TeacherService teacherService, BaseDeptService baseDeptService) {
        this.teacherService = teacherService;
        this.baseDeptService = baseDeptService;

    }

    public AjglListener() {
    }


    //读取excel内容方法,一行一行的读取
    @Override
    public void invoke(UpExcel upExcel, AnalysisContext analysisContext) {
    	//System.out.println("这是数据：" + upExcel);
        Teacher teacher = new Teacher();
        
        teacher.settId(upExcel.gettId());
        teacher.settName(upExcel.gettName());
        teacher.setDept(upExcel.getDept());
        
        BaseDept baseDept = baseDeptService.findDeptByDeptName(upExcel.getDept());
        teacher.setDeptId(baseDept.getDeptId());
        
        teacher.setTitle(upExcel.getTitle());
        teacher.setDuties(upExcel.getDuties());
        
        teacher.setPower("否");
        teacher.setMajor("无");
        teacher.settState(1);
        teacher.settPwd("123");
        
        int rows = teacherService.createTeacher(teacher);
        
        if(rows > 0){
	        System.out.println("OK");
	    }else{
	    	System.out.println("FAIL");
	    }
        
    }

    //读取完成之后的操作
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
    	System.out.println("读取表格完成！");
    }
}