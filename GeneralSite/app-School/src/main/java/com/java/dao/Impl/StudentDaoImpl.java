package com.java.dao.Impl;

import org.mongodb.framework.dao.GeneralDaoImpl;
import org.springframework.stereotype.Repository;

import com.java.dao.StudentDao;
import com.java.pojo.Student;
@Repository
public class StudentDaoImpl   extends GeneralDaoImpl<Student> implements StudentDao{

    @Override
    protected Class<Student> getEntityClass() {
	// TODO Auto-generated method stub
	return Student.class;
    }

}
