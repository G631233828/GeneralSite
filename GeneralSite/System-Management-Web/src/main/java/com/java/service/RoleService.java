package com.java.service;

import java.util.List;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.java.dao.RoleDao;
import com.java.pojo.Role;

@Service
public class RoleService extends GeneralServiceImpl<Role> {
	@Autowired
	private RoleDao roleDao;

	/**
	 * 根据d查询角色
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Role findRoleById(String id) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(id));
		// User user= this.userDao.findOneById(id);
		Role o = this.roleDao.findOneByQuery(query);
		if (o != null)
			return o;
		else
			return null;
	}

	/**
	 * 根据角色名称查询是否存在重复
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Role findRoleByRoleName(String roleName) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("roleName").is(roleName));
		// User user= this.userDao.findOneById(id);
		Role o = this.roleDao.findOneByQuery(query);
		if (o != null)
			return o;
		else
			return null;
	}

	/***
	 * 获取所有使用状态下的角色
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Role> findAllRoleByhiden() throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("ishiden").is(true));
		List<Role> listRole = this.roleDao.find(query);
		if (listRole != null)
			return listRole;
		else
			return null;
	}
	
	/**
	 * 获取所有角色
	 * @return
	 * @throws Exception
	 */
	public List<Role> findAllRole() throws Exception{
	    List<Role> listRole = this.roleDao.find(new Query());
	    if(listRole != null)
		return listRole;
	    else return null;
	}

}
