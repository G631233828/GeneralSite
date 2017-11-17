package com.java.dao.Impl;


import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.dao.UserDao;
import com.java.pojo.User;


@Repository
public class UserDaoImpl extends GeneralDaoImpl<User> implements UserDao {

	@Override
	protected Class<User> getEntityClass() {
		// TODO Auto-generated method stub
		return User.class;
	}

	
	
}
