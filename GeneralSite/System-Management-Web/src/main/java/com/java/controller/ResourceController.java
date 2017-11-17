package com.java.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.mongodb.framework.action.GeneralAction;
import org.mongodb.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.java.annotation.SystemControllerLog;
import com.java.pojo.Resource;
import com.java.service.ResourceService;

@Controller
@RequestMapping("/resource")
public class ResourceController extends GeneralAction<Resource> {

    private static final Logger log = LoggerFactory.getLogger(ResourceController.class);

    @Autowired
    private ResourceService resourceService;

    /**
     * 跳转到编辑界面
     * 
     * @param type
     *            1为添加 2为修改 其余数字不进行操作
     * @return
     */
    @RequestMapping("/toaddPage")
    @RequiresPermissions(value = "resource:add")
    public ModelAndView toaddPage(@RequestParam(value = "type", defaultValue = "") String type,
	    @RequestParam(value = "id", defaultValue = "") String id) {
	ModelAndView modelAndView = new ModelAndView();
	// 获取所有目录级别菜单
	try {
	    List<Resource> reslist = this.resourceService.findParentResource();
	    modelAndView.addObject("reslist", reslist);
	    if ("1".equals(type)) {
		// 添加用户
		modelAndView.addObject("type", "添加资源");
	    } else if ("2".equals(type)) {
		if (!"".equals(id)) {
		    // 通过按钮的id获取资源
		    Resource resource = this.resourceService.findResourceById(id);
		    modelAndView.addObject("resource", resource);
		    // 如果type为1 说明是菜单 则需要加载菜单选中项
		    if (resource.getType() == 1) {
			// 根据parentId获取目录id
			Resource resparentsmenu = this.resourceService.findResourceById(resource.getParentId());
			modelAndView.addObject("resparentsmenu", resparentsmenu);
		    }
		    if (resource.getType() == 2) {
			// 根据parentId获取目录id
			Resource resmenulist = this.resourceService.findResourceById(resource.getParentId());
			modelAndView.addObject("resmenulist", resmenulist);
			// 根据id获取菜单
			List<Resource> resmenu = this.resourceService.findResourceMenu(resmenulist.getParentId());
			modelAndView.addObject("resmenu", resmenu);

			Resource resparentsmenu = this.resourceService.findResourceById(resmenulist.getParentId());
			modelAndView.addObject("resparentsmenu", resparentsmenu);
		    }
		}
		modelAndView.addObject("type", "编辑资源");
	    }
	} catch (Exception e1) {
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	}

	modelAndView.setViewName("admin/resource/edit");
	return modelAndView;

    }

    @RequestMapping("/addorUpdate")
   @RequiresPermissions(value = "resource:add")
    @SystemControllerLog(description="添加资源")
    public ModelAndView addorUpdate(Resource rs, @RequestParam(value = "hid", defaultValue = "") String hid,
	    @RequestParam(value = "parentIdmenu", defaultValue = "") String parentIdmenu) {
	ModelAndView modelAndView = new ModelAndView();
	if (!("").equals(parentIdmenu)) {
	    rs.setParentId(parentIdmenu);
	}
	try {
	    if (rs != null) {
		if ("".equals(rs.getParentId()) || rs.getParentId() == null) {
		    rs.setParentId("0");
		}
	    }
	    // 判断用户信息不为空，并且用户id不为空
	    if (rs != null && !("").equals(hid)) {
		// 执行修改操作
		Resource ed = this.resourceService.findResourceById(hid);
		if (ed == null)
		    ed = new Resource();
		ed.setDescription(rs.getDescription());
		ed.setIcon(rs.getIcon());
		ed.setIshiden(rs.isIshiden());
		ed.setName(rs.getName());
		ed.setParentId(rs.getParentId());
		ed.setResKey(rs.getResKey());
		ed.setResUrl(rs.getResUrl());
		ed.setType(rs.getType());
		this.resourceService.save(ed);
	    } else if (rs != null && ("").equals(hid)) {
		Resource ad = new Resource();
		ad.setDescription(rs.getDescription());
		ad.setIcon(rs.getIcon());
		ad.setIshiden(rs.isIshiden());
		ad.setName(rs.getName());
		ad.setParentId(rs.getParentId());
		ad.setResKey(rs.getResKey());
		ad.setResUrl(rs.getResUrl());
		ad.setType(rs.getType());
		this.resourceService.save(ad);
		// 执行添加操作
		this.resourceService.insert(ad);
	    }

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

	modelAndView.setViewName("redirect:list");
	return modelAndView;
    }

    @RequestMapping("/list")
    @RequiresPermissions(value = "resource:list")
    @SystemControllerLog(description="查询所有资源")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
	    @RequestParam(value = "pageSize", defaultValue = "50") Integer pageSize, HttpSession session) {
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.setViewName("admin/resource/list");
	// 分页查询数据
	Pagination<Resource> pagination;
	try {
	    pagination = this.resourceService.findPaginationByQuery(new Query(), pageNo, pageSize);
	    if (pagination == null)
		pagination = new Pagination<Resource>();

	    modelAndView.addObject("pageList", pagination);
	    System.out.println(pagination.toString());
	} catch (Exception e) {
	    log.info("查询所有资源信息失败——————————》" + e.toString());
	    e.printStackTrace();
	}

	return modelAndView;
    }

    @RequestMapping("/delete")
    @RequiresPermissions(value = "resource:delete")
    @SystemControllerLog(description="删除资源")
    public ModelAndView delete(@RequestParam(value = "id", defaultValue = "0") String id,
	    @RequestParam(value = "ids", defaultValue = "0") String ids) {
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.setViewName("redirect:/resource/list");
	try {
	    if (!id.isEmpty() && !id.equals("0")) {
		Resource rm = this.resourceService.findResourceById(id);
		this.resourceService.remove(rm);// 删除某个id
		log.info("删除角色---》" + id);
	    } else if (!ids.isEmpty() && !ids.equals("0")) {
		String[] strids = ids.split(",");
		for (String delids : strids) {
		    log.info("删除角色---》" + delids);
		    Resource rm = this.resourceService.findResourceById(delids);
		    this.resourceService.remove(rm);// 删除某个id
		}
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    log.info("删除资源失败" + e.toString());
	}

	return modelAndView;

    }

    /**
     * 通过ajax获取是否存在重复账号的信息
     * 
     * @param printWriter
     * @param session
     * @param response
     */
    @RequestMapping(value = "/ajaxgetRepletes", method = RequestMethod.POST)
    public void ajaxgetRepletes(@RequestParam(value = "resUrl", defaultValue = "") String resUrl,
	    PrintWriter printWriter, HttpSession session, HttpServletResponse response) {
	// 通过ajax获取
	if (!resUrl.equals("")) {
	    Resource resource;
	    try {
		resource = this.resourceService.findResourceByResUrl(resUrl);
		if (resource != null) {
		    printWriter.write("true");
		} else {
		    printWriter.write("false");
		}
	    } catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	    }
	    printWriter.flush();
	    printWriter.close();
	}

    }

    /**
     * 通过ajax获取是否存在重复账号的信息
     * 
     * @param printWriter
     * @param session
     * @param response
     */
    @RequestMapping(value = "/getparentmenu", method = RequestMethod.POST)
    public void getparentmenu(@RequestParam(value = "parentId", defaultValue = "") String parentId,
	    PrintWriter printWriter, HttpSession session, HttpServletResponse response) {
	// 通过ajax获取
	try {
	    if (!parentId.equals("")) {

		List<Resource> resmenu = this.resourceService.findResourceMenu(parentId);
		if (resmenu != null) {
		    Gson gson = new Gson();
		    String json = gson.toJson(resmenu);
		    System.out.println(json);
		    printWriter.write(json);
		    printWriter.flush();
		    printWriter.close();
		}

	    }
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

    }
}
