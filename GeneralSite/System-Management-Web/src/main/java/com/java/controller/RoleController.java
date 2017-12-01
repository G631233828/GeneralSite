package com.java.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.SimpleAuthorizationInfo;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.annotation.SystemControllerLog;
import com.java.pojo.Resource;
import com.java.pojo.Role;
import com.java.service.ResourceService;
import com.java.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController extends GeneralAction<Role> {

	private static final Logger log = LoggerFactory.getLogger(RoleController.class);


	@Autowired
	private RoleService roleService;
	
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
	@RequiresPermissions(value = "role:add")
	public ModelAndView toaddPage(@RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();
		if ("1".equals(type)) {
			// 添加用户
			modelAndView.addObject("type", "添加角色");
		} else if ("2".equals(type)) {
			if (!"".equals(id)) {
				// 通过id查询该条记录
				try {
					Role role = this.roleService.findRoleById(id);
					modelAndView.addObject("role", role);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			modelAndView.addObject("type", "编辑角色");
		}
		modelAndView.setViewName("admin/role/edit");
		return modelAndView;
	}

	@RequestMapping("/addorUpdate")
	@RequiresPermissions(value = "role:add")
	  @SystemControllerLog(description="编辑角色")
	public ModelAndView addorUpdate(Role role, @RequestParam(value = "hid", defaultValue = "") String hid) {
		ModelAndView modelAndView = new ModelAndView();

		try {
			// 判断用户信息不为空，并且用户id不为空
			if (role != null && !("").equals(hid)) {
				// 执行修改操作
				Role ed = this.roleService.findRoleById(hid);
				if (ed == null)
					ed = new Role();
					ed.setRoleKey(role.getRoleKey());
					ed.setRoleName(role.getRoleName());
					ed.setIshiden(role.isIshiden());
					ed.setDescription(role.getDescription());
					this.roleService.save(ed);
			} else if (role != null && ("").equals(hid)) {
				Role ad = new Role();
				ad.setRoleKey(role.getRoleKey());
				ad.setRoleName(role.getRoleName());
				ad.setIshiden(role.isIshiden());
				ad.setDescription(role.getDescription());
				this.roleService.save(ad);
				// 执行添加操作
				this.roleService.insert(ad);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		modelAndView.setViewName("redirect:list");
		return modelAndView;
	}

	@RequestMapping("/list")
	 @RequiresPermissions(value = "role:list")
	  @SystemControllerLog(description="查看所有角色")
	public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/role/list");
		// 分页查询数据
		Pagination<Role> pagination;
		try {
			pagination = this.roleService.findPaginationByQuery(new Query(), pageNo, pageSize);
			if (pagination == null)
				pagination = new Pagination<Role>();

			modelAndView.addObject("pageList", pagination);
			
			
			List<Resource> listResource = this.resourceService.findAllResource();
			
			modelAndView.addObject("listResource", listResource);
			
			
			
			System.out.println(pagination.toString());
		} catch (Exception e) {
			log.info("查询所有角色信息失败——————————》" + e.toString());
			e.printStackTrace();
		}

		return modelAndView;
	}

	@RequestMapping("/delete")
	 @RequiresPermissions(value = "role:delete") 
	  @SystemControllerLog(description="删除角色")
	public ModelAndView delete(@RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/role/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {
				Role rm = this.roleService.findRoleById(id);
				this.roleService.remove(rm);// 删除某个id
				log.info("删除角色---》" + id);
			} else if (!ids.isEmpty() && !ids.equals("0")) {
				String[] strids = ids.split(",");
				for (String delids : strids) {
					log.info("删除角色---》" + delids);
					Role rm = this.roleService.findRoleById(delids);
					this.roleService.remove(rm);// 删除某个id
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("删除角色失败" + e.toString());
		}

		return modelAndView;

	}
	
	
	
	

	/**
	 * 通过ajax获取是否存在重复账号的信息
	 * @param printWriter
	 * @param session
	 * @param response
	 */
	@RequestMapping(value = "/ajaxgetRepletes", method = RequestMethod.POST) 
    public void ajaxgetRepletes(@RequestParam(value = "roleName", defaultValue = "")String roleName,PrintWriter printWriter,HttpSession session,HttpServletResponse response) { 
		//通过ajax获取
		if(!roleName.equals("")){
			Role  role;
			try {
				role = this.roleService.findRoleByRoleName(roleName);
				if(role!=null){
					printWriter.write("true");
				}else{
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
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/addauthor")
	public  ModelAndView  addauthor(HttpSession session,@RequestParam(defaultValue="",value="id")String id,
			@RequestParam(value = "checkallPermission", defaultValue = "") String checkallPermission){
		
		ModelAndView modelAndView  = new ModelAndView();
		
		modelAndView.setViewName("redirect:/role/list");
		try {
			List<Resource> listres = new ArrayList<Resource>();
			
			Role role =this.roleService.findRoleById(id);
			//清除该角色原有的权限
			role.setResource(new ArrayList<Resource>());
			
			this.roleService.save(role);
			
			String[] strids = checkallPermission.split(",");
			
			for (String resids : strids) {
				// 通过资源的id获取资源
				Resource res = this.resourceService.findResourceById(resids);
				
				listres.add(res);
			}
			
			role.setResource(listres);
			
			this.roleService.save(role);
			
			/*//获取所有角色的权限
			List<Resource> rs = role.getResource();
			
			// 权限信息对象info，用来存放查出的用户所有角色（role）及权限（permission）
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			//设置权限名称
			info.addRole(role.getRoleName());
			
				for (Resource r : rs) {
				
				log.info("资源：" + r.getName() + ":" + r.getResUrl());
				
				info.addStringPermission(r.getResKey());
				
				session.setAttribute("resourceslist", rs);
				
				log.info("当前登录用户访问资源权限：" + info.getStringPermissions());
			}*/
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return modelAndView;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
