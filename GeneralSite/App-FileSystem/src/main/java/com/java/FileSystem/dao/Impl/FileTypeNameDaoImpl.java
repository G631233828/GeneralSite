package com.java.FileSystem.dao.Impl;

import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.FileSystem.pojo.FileTypeName;
@Repository
public class FileTypeNameDaoImpl  extends GeneralDaoImpl<FileTypeName>{

	@Override
	protected Class<FileTypeName> getEntityClass() {
		// TODO Auto-generated method stub
		return FileTypeName.class;
	}

}
