package com.ysj.core.dao;

import java.util.List;

import com.ysj.core.po.ProjTBook;

public interface ProjTBookMapper {
	
	int insert(ProjTBook record);
	
	List<ProjTBook> selectByTId(String tId);

}
