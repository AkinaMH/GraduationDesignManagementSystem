package com.ysj.core.dao;

import com.ysj.core.po.Admin;
import com.ysj.core.po.AdminExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
	//管理员总人数
    int countByExample(AdminExample example);

    //删除管理员...
    int deleteByExample(AdminExample example);

    //根据id删除管理员...
    int deleteByPrimaryKey(String adminId);

    //添加管理员...
    int insert(Admin record);

    //添加管理员...
    int insertSelective(Admin record);

    //查找管理员...
    List<Admin> selectByExample(AdminExample example);

    //根据主键查询管理员
    Admin selectByPrimaryKey(String adminId);

    //更新管理员信息...
    int updateByExampleSelective(@Param("record") Admin record, @Param("example") AdminExample example);

    //更新管理员信息...
    int updateByExample(@Param("record") Admin record, @Param("example") AdminExample example);

    //更新管理员信息...
    int updateByPrimaryKeySelective(Admin record);

    //根据id更新管理员信息
    int updateByPrimaryKey(Admin record);
}