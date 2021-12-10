package com.ysj.core.interceptor;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.ysj.core.po.BaseMajor;
import com.ysj.core.po.Student;
import com.ysj.core.po.UpStudent;
import com.ysj.core.service.BaseMajorService;
import com.ysj.core.service.StudentService;

public class StudentListener extends AnalysisEventListener<UpStudent>{

	public StudentService studentService;
    public BaseMajorService baseMajorService;
	
    //学生监听器
    //生成有参和无参构造方法
    public StudentListener(StudentService studentService, BaseMajorService baseMajorService) {
        this.studentService = studentService;
        this.baseMajorService = baseMajorService;

    }

    public StudentListener() {
    }
	
    //读取excel内容方法,一行一行的读取
	@Override
	public void invoke(UpStudent upStudent, AnalysisContext analysisContext) {
		//System.out.println("这是数据：" + upStudent);
		Student student = new Student();
		
		//从Excel表中读取学生的基本信息
		student.setsId(upStudent.getsId());
		student.setsName(upStudent.getsName());
		student.setDept(upStudent.getDept());
		student.setMajorId(upStudent.getMajorId());
		student.setsClass(upStudent.getSclass());
        
        //获取专业名称
        BaseMajor baseMajor = baseMajorService.findMajorById(upStudent.getMajorId());
        student.setMajor(baseMajor.getMajorName());
        
        student.setBatch((short) 1);
        student.setsState(1);
        student.setsPwd("123");
        
        //添加学生用户
        int rows = studentService.createStudent(student);
        
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