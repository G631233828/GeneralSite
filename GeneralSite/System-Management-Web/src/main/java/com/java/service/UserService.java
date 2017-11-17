package com.java.service;

import java.util.List;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.java.dao.UserDao;
import com.java.pojo.User;

@Service
public class UserService extends GeneralServiceImpl<User> {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleService roleService;

    /**
     * 添加用户
     * 
     * @param user
     * @return
     */
    public void addUser(User user) {
	try {
	    this.userDao.insert(user);
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	;
    }

    /**
     * 根据用户帐号查询用户信息
     * 
     * @param accountName
     * @return
     * @throws Exception
     */
    public User findUserByAccountName(String accountName) throws Exception {
	Query query = new Query();
	query.addCriteria(Criteria.where("accountName").is(accountName));
	User user = this.userDao.findOneByQuery(query);
	return user;
    }

    /**
     * 根据用户id查询用户
     * 
     * @param id
     * @return
     * @throws Exception
     */
    public User findUserById(String id) throws Exception {
	Query query = new Query();
	query.addCriteria(Criteria.where("_id").is(id)).addCriteria(Criteria.where("ishiden").is(true));
	// User user= this.userDao.findOneById(id);
	User user = this.userDao.findOneByQuery(query);
	if (user != null)
	    return user;
	else
	    return null;
    }
    
    public List<User> findAllUser() throws Exception{
	List<User> listuser =this.userDao.find(new Query());
	if(listuser!= null)
	    return listuser;
	else 
	    return null;
    }


}
