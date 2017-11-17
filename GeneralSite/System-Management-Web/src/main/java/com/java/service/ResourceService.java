package com.java.service;

import java.util.List;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.java.dao.ResourceDao;
import com.java.pojo.Resource;

@Repository
public class ResourceService extends GeneralServiceImpl<Resource> {

	@Autowired
	private ResourceDao resourceDao;

	/**
	 * 通过用户id查询所有的资源
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<Resource> findlistResource(String userId) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(userId));
		return this.resourceDao.find(query);

	}

	
	
	

	/**
	 * 根据资源Id查询资源
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Resource findResourceById(String id) throws Exception{
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(id));
		//User user= this.userDao.findOneById(id);
		Resource rs= this.resourceDao.findOneByQuery(query);
		if(rs!=null)
			return rs;
		else 
			return null;
	}
	
	/**
	 * 根据资源Id查询资源
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Resource findResourceByResUrl(String url) throws Exception{
		Query query = new Query();
		query.addCriteria(Criteria.where("resUrl").is(url));
		//User user= this.userDao.findOneById(id);
		Resource rs= this.resourceDao.findOneByQuery(query);
		if(rs!=null)
			return rs;
		else 
			return null;
	}
	/**
	 * 查询所有1级菜单
	 * @return
	 * @throws Exception
	 */
	public List<Resource> findParentResource() throws Exception{
		Query query= new Query();
		query.addCriteria(Criteria.where("parentId").is("0"));
		List<Resource> list = this.resourceDao.find(query);
		if(list!=null)
			return list;
		else
			return null;
	}
	/**
	 * 查询所有2级菜单
	 * @return
	 * @throws Exception
	 */
	public List<Resource> findResourceMenu(String parentId) throws Exception{
		Query query= new Query();
		query.addCriteria(Criteria.where("parentId").is(parentId));
		List<Resource> list = this.resourceDao.find(query);
		if(list!=null)
			return list;
		else
			return null;
	}
	

	/**
	 * 获取所有的资源
	 * @return
	 * @throws Exception
	 */
	public List<Resource> findAllResource() throws Exception{
	    List<Resource> listRes = this.find(new Query());
	    if(listRes != null)
		return listRes;
	    else
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
