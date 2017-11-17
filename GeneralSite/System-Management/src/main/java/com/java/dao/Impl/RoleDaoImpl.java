package com.java.dao.Impl;


import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.dao.RoleDao;
import com.java.pojo.Role;

@Repository
public class RoleDaoImpl  extends GeneralDaoImpl<Role> implements RoleDao  {

	@Override
	protected Class<Role> getEntityClass() {
		// TODO Auto-generated method stub
		return Role.class;
	}

}
