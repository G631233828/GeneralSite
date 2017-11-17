package org.mongodb.framework.service;

import java.util.List;

import org.mongodb.framework.dao.GeneralDao;
import org.mongodb.framework.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;


@Repository("generalService")
public abstract class GeneralServiceImpl<T> implements GeneralService<T> {
	
	
	@Autowired
	protected GeneralDao<T> generalDao;

	public List<T> find(Query query) throws Exception {
		return generalDao.find(query);
	}

	public Pagination<T> findPaginationByQuery(Query query, int pageNo,
			int pageSize) throws Exception {

		return generalDao.findPaginationByQuery(query, pageNo, pageSize);
	}

	public void insert(T t) throws Exception {
		this.generalDao.insert(t);
	}

	public void save(T t) throws Exception {
		this.generalDao.save(t);
	}

	public void remove(T t) throws Exception {
		this.generalDao.remove(t);

	}

	public void updateFirst(Query query, Update update) throws Exception {
		this.generalDao.updateFirst(query, update);
	}

	public T findOneById(String id) throws Exception {

		return this.generalDao.findOneById(id);/*findOneById(id);*/
	}

	public T findAndModify(Query query, Update update) {
		return this.findAndModify(query, update);
	}

	public T findAndRemove(Query query) throws Exception {
		return (T) this.generalDao.findAndRemove(query);
	}

	public T findByIdAndCollectionName(String id, String collectionName)
			throws Exception {
		return (T) this.generalDao
				.findByIdAndCollectionName(id, collectionName);
	}

	public T findOneByQuery(Query query) throws Exception {
		// TODO Auto-generated method stub
		return (T) this.generalDao.findOneByQuery(query);
	}

	public void updateAllByQuery(Query query, Update update) {
		this.updateAllByQuery(query, update);

	}

	public Integer findCountByQuery(Query query) throws Exception {
		return generalDao.findCountByQuery(query);
	}

	public GeneralDao<T> getGeneralDao() {
		return generalDao;
	}

	public void setGeneralDao(GeneralDao<T> generalDao) {
		this.generalDao = generalDao;
	}
	
	/**
	 * 
	 * @Title: delete 
	 * @Description: TODO(删除文件类型) 
	 * @param @param fileType
	 * 设定文件 @return void 返回类型 @throws
	 */
	public void delete(String id,String ids) {
		try {
			if (!id.isEmpty() && !id.equals("0")) {
				this.remove(this.findOneById(id));// 删除某个id
			} else if (!ids.isEmpty() && !ids.equals("0")) {
				String[] strids = ids.split(",");
				for (String delids : strids) {
					this.remove(this.findOneById(delids));// 删除某个id
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	

}
