package com.java.FileSystem.dao.Impl;

import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.FileSystem.pojo.FileType;

@Repository
public class FileTypeDaoImpl  extends GeneralDaoImpl<FileType>{

	
	@Override
	protected Class<FileType> getEntityClass() {
		// TODO Auto-generated method stub
		return FileType.class;
	}

	

	
	
	
	
	
	
	
	
	
	
	

}
