package com.java.dao.Impl;


import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.dao.LogDao;
import com.java.pojo.Log;

@Repository
public class LogDaoImpl extends GeneralDaoImpl<Log>  implements LogDao {

	@Override
	protected Class<Log> getEntityClass() {
		// TODO Auto-generated method stub
		return Log.class;
	}

}
