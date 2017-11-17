package com.java.service;

import java.util.List;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.java.dao.LogDao;
import com.java.pojo.Log;

@Repository
public class LogService  extends GeneralServiceImpl<Log>{

	@Autowired
	private LogDao logDao;
	
	
	/***
	 * 时间倒叙查询所有的日志信息
	 * @return
	 * @throws Exception
	 */
	public List<Log> findAllLog() throws Exception{
		Query query = new Query();
		query.with(new Sort(new Order(Direction.DESC, "createDate")));  
		
		List<Log> loglist=this.logDao.find(query);
		
		if(loglist==null)
			return null;
		else 
			return loglist;
	}

	
	public Query findAllLogbyQuery(String type){
		
		Query query = new Query();
		query.addCriteria(Criteria.where("type").is(type));
		query.with(new Sort(new Order(Direction.DESC, "createDate")));  
		return query;
	}
	
	
}
