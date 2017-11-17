package com.java.FileSystem.service.Impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mongodb.framework.service.GeneralServiceImpl;
import org.mongodb.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.java.FileSystem.pojo.FileType;
import com.java.FileSystem.pojo.FileTypeName;
import com.java.util.FileOperateUtil;


/**
 * 
 * @ClassName: FileTypeServiceImpl
 * @Description: TODO(文件类型Service类 )
 * @author fliay
 * @date 2017年10月26日 上午10:14:54
 *
 */
@Service
public class FileTypeService extends GeneralServiceImpl<FileType> {

	private final Logger log = LoggerFactory.getLogger(FileTypeService.class);
	@Autowired
	private FileTypeNameService fileTypeNameService;
	
	@Autowired
	private FileOperateUtil fileOperateUtil;
	

	public void addFileType(HttpServletRequest request,FileType fileType,String fileTypeNameId,String hid) {
		

		try {
			
		String[] filetype = new String[] { "png", "jpeg", "gif", "jpg" };
		String UPLOADDIR = File.separator + "FileUpload" + File.separator + "FileTypeImg" + File.separator;
		List<Map<String, Object>> result = fileOperateUtil.upload(request, UPLOADDIR, filetype);
		Boolean hasfile = (Boolean) result.get(0).get("nofile");

		if (!hasfile) {
			boolean has = (Boolean) result.get(0).get("hassuffix");
			// 如果上传文件符合要求
			if (has != false) {
				String imgPath = (String) result.get(0).get("servletPath");
				String fileName = (String) result.get(0).get("fileName");
				fileType.setImgPath(imgPath);
				fileType.setImgName(fileName);
			}
		}
		

			if(fileTypeNameId!=""||fileTypeNameId!=null){
				
				FileTypeName fileTypeName = fileTypeNameService.findFileTypeNameById(fileTypeNameId);
				if(fileTypeName!=null)
					fileType.setFileTypeName(fileTypeName);
				else
					fileType.setFileTypeName(new FileTypeName());
			}
			
			if(!"".equals(hid)){
				FileType fileT=this.findOneById(hid);
				if(fileT == null)
					fileT =new FileType();
				fileT.setDescription(fileType.getDescription());
				fileT.setDisable(fileType.isDisable());
				
				
				if(fileType.getImgName()!=null){
					fileT.setImgName(fileType.getImgName());
				}else{
					fileT.setImgName(fileT.getImgName());
				}
				
				if(fileType.getImgPath()!=null){
					fileT.setImgPath(fileType.getImgPath());
				}else{
					fileT.setImgPath(fileT.getImgPath());
				}
				fileT.setSuffixName(fileType.getSuffixName());
				
				fileT.setFileTypeName(fileType.getFileTypeName());
				
				this.save(fileT);
			}else{
				this.insert(fileType);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 
	* @Title: findList 
	* @Description: TODO(分页查询数据) 
	* @param @param pageNo
	* @param @param pageSize
	* @param @return    设定文件 
	* @return Pagination    返回类型 
	* @throws
	 */
	public Pagination<FileType> findList(int pageNo, int pageSize) {
		
		// 分页查询数据
		Pagination<FileType> pagination = null;
		try {
			pagination = this.findPaginationByQuery(new Query(), pageNo, pageSize);
			if (pagination == null)
				pagination = new Pagination<FileType>();
		} catch (Exception e) {
			log.info("FileTypeService--------分页查询" + e.toString());
			e.printStackTrace();
		}
		return pagination;
	}

	
	
	/**
	 * 
	* @Title: findFileTypeNameById 
	* @Description: TODO(通过id查询所有数据) 
	* @param @param id
	* @param @return    设定文件 
	* @return FileTypeName    返回类型 
	* @throws
	 */
	public FileType findFileTypeById(String id){
		
		FileType fileType = null;
		try {
			fileType = this.findOneById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(fileType == null)
			return null;
		else 
			return fileType;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
