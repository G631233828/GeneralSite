package com.java.FileSystem.service.Impl;

import java.util.List;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.mongodb.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.java.FileSystem.pojo.FileTypeName;

@Service
public class FileTypeNameService extends GeneralServiceImpl<FileTypeName> {

	private final Logger log = LoggerFactory.getLogger(FileTypeNameService.class);

	/**
	 * 
	 * @Title: addFileTypeName @Description: TODO(添加或修改文件类型名称) @param @param
	 * fileTypeName @param @param hid 判断是修改还是新增 @return void 返回类型 @throws
	 */
	public void addFileTypeName(FileTypeName fileTypeName) {
		try {
			if (("").equals(fileTypeName.getId())) {
				if (!fileTypeName.getFileTypeName().isEmpty()) {
					this.insert(fileTypeName);
				}
			} else {
				if (!fileTypeName.getFileTypeName().isEmpty()) {
					this.save(fileTypeName);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	/**
	 * 
	* @Title: findAll 
	* @Description: TODO(查询所有的类型) 
	* @param @return    设定文件 
	* @return List<FileTypeName>    返回类型 
	* @throws
	 */
	public List<FileTypeName> findAll() {

		List<FileTypeName> list = null;
		try {
			list = this.find(new Query());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (list != null)
			return list;
		else
			return null;
	}

	
	/**
	 * 
	* @Title: findAll 
	* @Description: TODO(查询所有的类型) 
	* @param @return    设定文件 
	* @return List<FileTypeName>    返回类型 
	* @throws
	 */
	public List<FileTypeName> findAllByDisable() {
		Query query = new Query();
		query.addCriteria(Criteria.where("disable").is(false));
		List<FileTypeName> list = null;
		try {
			list = this.find(query);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (list != null)
			return list;
		else
			return null;
	}


	
	
	
	
	
	/**
	 * 
	 * @Title: findList @Description: TODO(分页查询数据) @param @param
	 * pageNo @param @param pageSize @param @return 设定文件 @return Pagination
	 * 返回类型 @throws
	 */
	public Pagination<FileTypeName> findList(int pageNo, int pageSize) {

		// 分页查询数据
		Pagination<FileTypeName> pagination = null;
		try {
			pagination = this.findPaginationByQuery(new Query(), pageNo, pageSize);
			if (pagination == null)
				pagination = new Pagination<FileTypeName>();
		} catch (Exception e) {
			log.info("FileTypeNameService--------分页查询" + e.toString());
			e.printStackTrace();
		}
		return pagination;
	}

	/**
	 * 
	 * @Title: findFileTypeNameById @Description: TODO(通过id查询所有数据) @param @param
	 * id @param @return 设定文件 @return FileTypeName 返回类型 @throws
	 */
	public FileTypeName findFileTypeNameById(String id) {

		FileTypeName fileTypeName = null;
		try {
			fileTypeName = this.findOneById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (fileTypeName == null)
			return null;
		else
			return fileTypeName;
	}

}
