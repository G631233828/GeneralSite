package com.java.service;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.java.dao.ClazzesDao;
import com.java.pojo.Clazzes;

@Service
public class ClazzesService extends GeneralServiceImpl<Clazzes> {

    @Autowired
    private ClazzesDao clazzDao;
    
    
    
    
    /**
     * 根据用户id查询用户
     * 
     * @param id
     * @return
     * @throws Exception
     */
    public Clazzes findClazzById(String id) throws Exception {
	Query query = new Query();
	query.addCriteria(Criteria.where("_id").is(id));
	// User user= this.userDao.findOneById(id);
	Clazzes clazz = this.clazzDao.findOneByQuery(query);
	if (clazz != null)
	    return clazz;
	else
	    return null;
    }

    
    
    
    
}
