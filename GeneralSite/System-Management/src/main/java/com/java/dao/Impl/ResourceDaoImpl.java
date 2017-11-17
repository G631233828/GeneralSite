package com.java.dao.Impl;


import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.dao.ResourceDao;
import com.java.pojo.Resource;

@Repository
public class ResourceDaoImpl extends GeneralDaoImpl<Resource> implements ResourceDao {


	@Override
	protected Class<Resource> getEntityClass() {
		// TODO Auto-generated method stub
		return Resource.class;
	}



}
