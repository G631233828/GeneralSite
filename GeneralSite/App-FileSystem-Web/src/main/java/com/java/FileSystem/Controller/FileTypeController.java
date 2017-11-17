package com.java.FileSystem.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.mongodb.framework.action.GeneralAction;
import org.mongodb.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.FileSystem.pojo.FileType;
import com.java.FileSystem.pojo.FileTypeName;
import com.java.FileSystem.service.Impl.FileTypeNameService;
import com.java.FileSystem.service.Impl.FileTypeService;
import com.java.annotation.SystemControllerLog;

/**
 * 
 * @ClassName: FileTypeController
 * @Description: TODO(文件类型业务层)
 * @author fliay
 * @date 2017年10月26日 上午10:50:33
 *
 */
@Controller
@RequestMapping("/fileType")
public class FileTypeController extends GeneralAction<FileType> {
	private final Logger log = LoggerFactory.getLogger(FileTypeController.class);
	@Autowired
	private FileTypeService fileTypeService;
	@Autowired
	private FileTypeNameService fileTypeNameService;

	@RequestMapping("/list")
	@RequiresPermissions(value = "fileType:list")
	@SystemControllerLog(description = "查询所有文件分类")
	public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("admin/fileType/list");
		
		Pagination<FileType> pagination = this.fileTypeService.findList(pageNo, pageSize);
		
	
		modelAndView.addObject("pageList", pagination);
		
		return modelAndView;
	}

	
	
	/**
	 * 跳转到编辑界面
	 * 
	 * @param type
	 *            1为添加 2为修改 其余数字不进行操作
	 * @return
	 */
	@RequestMapping("/toaddPage")
//	@RequiresPermissions(value = "fileType:add")
	public ModelAndView toaddPage(@RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();
		
		if ("1".equals(type)) {
		
			modelAndView.addObject("type", "添加分类名称");
			
		} else if ("2".equals(type)) {
			
			if (!"".equals(id)) {
				
				FileType fileType = this.fileTypeService.findFileTypeById(id);
				
				if(fileType.getImgPath()!=null||!"".equals(fileType.getImgPath())){
					
					fileType.setImgPath(fileType.getImgPath().replaceAll("\\\\", "/"));
				}
				
				
				modelAndView.addObject("fileType", fileType);

			}
			modelAndView.addObject("type", "编辑分类名称");
		}
		
		
		List<FileTypeName> fileTypeNameList =this.fileTypeNameService.findAll();
		
		//List<FileTypeName> fileTypeNameList =this.fileTypeNameService.findAllByDisable();
		
		modelAndView.addObject("fileTypeNameList", fileTypeNameList);
		
		
		
		modelAndView.setViewName("admin/fileType/edit");
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/addorUpdate")
	// @RequiresPermissions(value = "fileType:edit")
	@SystemControllerLog(description = "添加/编辑类型名称")
	public ModelAndView add(HttpServletRequest request,@RequestParam(value="suffixName",defaultValue="")String suffixName,
			@RequestParam(value="fileTypeDisable",defaultValue="")String fileTypeDisable,
			@RequestParam(value = "fileTypeNameId", defaultValue = "") String fileTypeNameId,
			@RequestParam(value = "hid", defaultValue = "") String hid) {
		
		ModelAndView model = new ModelAndView();
		
		log.info("添加文件分类");
		
		model.setViewName("redirect:/fileType/list"	);
		
		FileType fileType = new FileType();
		
		if(!"".equals(suffixName)){
			fileType.setSuffixName(suffixName);
		}
		if(!"".equals(fileTypeDisable)){
			if(("1").equals(fileTypeDisable)){
				fileType.setDisable(false);
			}else{
				fileType.setDisable(true);
			}
			
		}
		
		

		fileTypeService.addFileType(request,fileType, fileTypeNameId,hid);

		return model;
	}
	
	
	
	
	
	
/*	@RequestMapping("/add")
	@RequiresPermissions(value = "fileType:add")
	@SystemControllerLog(description = "添加文件分类")
	public void addFileType(HttpServletRequest request,FileType fileType,@RequestParam(value="fileTypeNameId",defaultValue="")String fileTypeNameId){
		if(!fileType.getSuffixName().isEmpty()){
			
			log.info("添加文件分类");
			
		fileTypeService.addFileType(request,fileType,fileTypeNameId);
		
		}
	}
	*/
	
	
	
	
	

	@RequestMapping("/delete")
	@RequiresPermissions(value = "fileType:delete")
	@SystemControllerLog(description = "删除文件分类")
	public ModelAndView delete(@RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView model = new ModelAndView();
		model.setViewName("redirect:/fileType/list");
		log.debug("删除数据单条" + id + ",多条数据：" + ids);
		this.fileTypeService.delete(id, ids);
		log.debug("删除数据成功"+new Date());
		return model;
	}

}
