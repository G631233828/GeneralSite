package com.java.dao.Impl;

import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.dao.ClazzesDao;
import com.java.pojo.Clazzes;

@Repository
public class ClazzesDaoImpl  extends GeneralDaoImpl<Clazzes> implements ClazzesDao{

    @Override
    protected Class<Clazzes> getEntityClass() {
	// TODO Auto-generated method stub
	return Clazzes.class;
    }

}
