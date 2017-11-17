package com.java.service;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.java.dao.StudentDao;
import com.java.pojo.Student;

@Service
public class StudentService extends GeneralServiceImpl<Student> {

	@Autowired
	private StudentDao studentDao;
	
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Student findUserById(String id) throws Exception{
		Student s=this.studentDao.findOneById(id);
		if(s!=null){
			return s;
		}else{
			return null;
		}
	}
	
	/**
	 * 根据学生的身份证号码查询该学生是否已经存在
	 * @param studentIdCard
	 * @return
	 * @throws Exception
	 */
	public Student findbystudentIdCard(String studentIdCard) throws Exception{
		Query query=new Query();
		query.addCriteria(Criteria.where("studentIdCard").is(studentIdCard));
		Student s=this.studentDao.findOneByQuery(query);
		if(s!=null){
			return s;
		}else{
			return null;
		}
	}
	
	/**
	 * 高级查询
	 * @param search1
	 * @param search1val
	 * @param search2
	 * @param search2val
	 * @return
	 */
	public Query searchQuery(String search1,String serach1val,String search2 ,String serach2val){
	Query query=new Query();
	if(!"".equals(search1)&&!"".equals(serach1val)){
		query.addCriteria(Criteria.where(search1).regex(serach1val));
	}
	if(!"".equals(search2)&&!"".equals(serach2val)){
		query.addCriteria(Criteria.where(search2).regex(serach2val));
	}
		
		return query;
		
	}
}