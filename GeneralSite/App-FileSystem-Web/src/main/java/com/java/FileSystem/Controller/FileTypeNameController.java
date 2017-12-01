package com.java.FileSystem.Controller;

import java.util.Date;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.mongodb.framework.action.GeneralAction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.FileSystem.pojo.FileTypeName;
import com.java.FileSystem.service.Impl.FileTypeNameService;
import com.java.annotation.SystemControllerLog;

/**
 * 
 * @ClassName: FileTypeNameController
 * @Description: TODO(文件分类名称)
 * @author fliay
 * @date 2017年10月26日 下午1:39:42
 *
 */
@Controller
@RequestMapping("/fileTypeName")
public class FileTypeNameController extends GeneralAction<FileTypeName> {
	private final Logger log = LoggerFactory.getLogger(FileTypeNameController.class);
	@Autowired
	private FileTypeNameService fileTypeNameService;

	/*
	 * @RequestMapping("/list")
	 * 
	 * @RequiresPermissions(value = "fileTypeName:list")
	 * 
	 * @SystemControllerLog(description = "查询所有文件类名称") public ModelAndView
	 * list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
	 * HttpSession session) { ModelAndView modelAndView = new ModelAndView();
	 * 
	 * modelAndView.setViewName("admin/fileTypeName/list");
	 * 
	 * Pagination<FileTypeName> pagination =
	 * this.fileTypeNameService.findList(pageNo, pageSize);
	 * 
	 * modelAndView.addObject("pageList", pagination); return modelAndView; }
	 * 
	 */

	/**
	 * 跳转到编辑界面
	 * 
	 * @param type
	 *            1为添加 2为修改 其余数字不进行操作
	 * @return
	 */
	/*
	 * @RequestMapping("/toaddPage")
	 * 
	 * @RequiresPermissions(value = "fileTypeName:add") public ModelAndView
	 * toaddPage(@RequestParam(value = "type", defaultValue = "") String type,
	 * 
	 * @RequestParam(value = "id", defaultValue = "") String id) { ModelAndView
	 * modelAndView = new ModelAndView();
	 * 
	 * if ("1".equals(type)) {
	 * 
	 * modelAndView.addObject("type", "添加分类名称");
	 * 
	 * } else if ("2".equals(type)) {
	 * 
	 * if (!"".equals(id)) {
	 * 
	 * FileTypeName fileTypeName =
	 * this.fileTypeNameService.findFileTypeNameById(id);
	 * 
	 * modelAndView.addObject("fileTypeName", fileTypeName);
	 * 
	 * } modelAndView.addObject("type", "编辑分类名称"); }
	 * modelAndView.setViewName("admin/fileTypeName/edit");
	 * 
	 * return modelAndView; }
	 */

	@RequestMapping("/addorUpdate")
	@RequiresPermissions(value = "fileTypeName:edit")
	@SystemControllerLog(description = "添加/编辑类型名称")
	public ModelAndView addFileType(@ModelAttribute("fileTypeName") FileTypeName fileTypeName) {

		ModelAndView model = new ModelAndView();

		log.info("添加文件分类");

		model.setViewName("redirect:/fileTypeName/list");

		fileTypeNameService.addFileTypeName(fileTypeName);

		return model;
	}

	@RequestMapping("/delete")
	@RequiresPermissions(value = "fileTypeName:delete")
	@SystemControllerLog(description = "删除文件分类")
	public ModelAndView delete(@RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {

		ModelAndView model = new ModelAndView();

		model.setViewName("redirect:/fileTypeName/list");

		log.info("删除数据单条" + id + ",多条数据：" + ids);

		this.fileTypeNameService.delete(id, ids);

		log.info("删除数据成功" + new Date());

		return model;
	}

	@ResponseBody
	@RequestMapping("/ajaxSave")
	public FileTypeName ajaxSave(@RequestParam(defaultValue = "", value = "fileTypeName") String fileTypeName,
			@RequestParam(defaultValue = "", value = "disable") String disable,
			@RequestParam(defaultValue = "",value = "id") String id) {
		boolean flag = false;
		if ("OFF".equals(disable)) {
			flag = true;
		}

		FileTypeName f = new FileTypeName();
		f.setFileTypeName(fileTypeName);
		f.setDisable(flag);
		if(!"".equals(id)){
		f.setId(id);
		}
		fileTypeNameService.addFileTypeName(f);
		System.out.println(f.getId());
	

		return f;

	}
	
	
	
	@ResponseBody
	@RequestMapping("/ajaxdelete")
	public String  ajaxdelete(
			@RequestParam(defaultValue = "",value = "id") String id) {
		
		this.fileTypeNameService.delete(id, "");

		log.info("删除数据成功" + new Date());
		
		
		return "true";
		
	}

}
