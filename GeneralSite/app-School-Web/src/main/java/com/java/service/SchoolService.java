package com.java.service;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.java.dao.SchoolDao;
import com.java.pojo.School;

@Service
public class SchoolService extends GeneralServiceImpl<School> {

    @Autowired
    private SchoolDao schoolDao;

    /**
     * 添加用户
     * 
     * @param user
     * @return
     */
    public void addSchool(School school) {
	try {
	    this.schoolDao.insert(school);
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }

    /**
     * 根据用户id查询用户
     * 
     * @param id
     * @return
     * @throws Exception
     */
    public School findSchoolById(String id) throws Exception {
	Query query = new Query();
	query.addCriteria(Criteria.where("_id").is(id));
	// User user= this.userDao.findOneById(id);
	School school = this.schoolDao.findOneByQuery(query);
	if (school != null)
	    return school;
	else
	    return null;
    }

}
