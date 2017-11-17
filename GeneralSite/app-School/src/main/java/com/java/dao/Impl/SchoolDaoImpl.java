package com.java.dao.Impl;

import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.dao.SchoolDao;
import com.java.pojo.School;

@Repository
public class SchoolDaoImpl extends GeneralDaoImpl<School> implements SchoolDao {

	@Override
	protected Class<School> getEntityClass() {
		// TODO Auto-generated method stub
		return School.class;
	}

	
	
}
