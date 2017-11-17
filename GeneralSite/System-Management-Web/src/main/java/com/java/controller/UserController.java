package com.java.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.mongodb.framework.action.GeneralAction;
import org.mongodb.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.annotation.SystemControllerLog;
import com.java.pojo.Resource;
import com.java.pojo.Role;
import com.java.pojo.User;
import com.java.service.ResourceService;
import com.java.service.RoleService;
import com.java.service.UserService;
import com.java.util.Constant;
import com.java.util.FileOperateUtil;

@Controller
@RequestMapping("/user")
public class UserController extends GeneralAction<User> {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private ResourceService resourceService;

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private FileOperateUtil fileOperateUtil;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loginToIndex", method = RequestMethod.POST)
	@SystemControllerLog(description = "用户登录")
	public ModelAndView userLogin(User user, @RequestParam(value = "remember", defaultValue = "") String remember,
			HttpSession session, RedirectAttributes attr) throws Exception {
		String msg = "";
		ModelAndView modelAndView = new ModelAndView();
		User usersession = (User) session.getAttribute("userSession");

		if (usersession == null) {
			modelAndView.setViewName("redirect:login");
			boolean rememberMe = false;
			if (remember != "") {
				rememberMe = true;
			}
			String accountName = user.getAccountName();
			String password = user.getPassWord();
			if (accountName != "" && password != "") {
				UsernamePasswordToken token = new UsernamePasswordToken(accountName, password);
				token.setRememberMe(rememberMe);
				Subject subject = SecurityUtils.getSubject();// 获得主体
				try {
					subject.login(token);
					if (subject.isAuthenticated()) {
						modelAndView.setViewName("redirect:index");
					} else {
						msg = "登录失败";
					}
				} catch (IncorrectCredentialsException e) {
					msg = "登录密码错误. Password for account " + token.getPrincipal() + " wasincorrect.";
				} catch (ExcessiveAttemptsException e) {
					msg = "登录失败次数过多";
				} catch (LockedAccountException e) {
					msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was locked.";
				} catch (DisabledAccountException e) {
					msg = "帐号已被禁用. The account for username " + token.getPrincipal() + "  was disabled.";
				} catch (ExpiredCredentialsException e) {
					msg = "帐号已过期. the account for username " + token.getPrincipal() + "  was expired.";
				} catch (UnknownAccountException e) {
					msg = "帐号不存在. There is no user with username of " + token.getPrincipal();
				} catch (UnauthorizedException e) {
					msg = "您没有得到相应的授权！" + e.getMessage();
				} finally {
					attr.addFlashAttribute("msg", msg);
				}

			}
		} else {
			modelAndView.setViewName("redirect:/index");
		}
		List<Resource> rslist = (List<Resource>) session.getAttribute("resourceslist");
		session.setAttribute("resourceslist", rslist);

		return modelAndView;

	}

	/**
	 * 跳转登录界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login")
	public ModelAndView login(@ModelAttribute("msg") String msg) {

		ModelAndView modelAndView = new ModelAndView();

		Subject remembered = SecurityUtils.getSubject();
		System.out.println(!remembered.isAuthenticated());
		System.out.println(remembered.isRemembered());
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("login");
		return modelAndView;
	}

	/**
	 * 跳转index界面
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");

		return modelAndView;
	}

	@RequestMapping(value = "/loginOut")
	public ModelAndView loginOut() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:login");
		Subject subject = SecurityUtils.getSubject();// 获得主体
		subject.logout();
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
	@RequiresPermissions(value = "user:add")
	public ModelAndView toaddPage(@RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();
		// 获取所有角色信息
		try {
			List<Role> listRole = this.roleService.findAllRoleByhiden();
			modelAndView.addObject("listRole", listRole);

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if ("1".equals(type)) {
			// 添加用户
			modelAndView.addObject("type", "添加用户");
		} else if ("2".equals(type)) {
			if (!"".equals(id)) {
				// 通过id查询该条记录
				try {
					User user = this.userService.findUserById(id);
					user.setPhotograph(user.getPhotograph().replaceAll("\\\\", "/"));
					modelAndView.addObject("user", user);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			modelAndView.addObject("type", "编辑用户");
		}
		modelAndView.setViewName("admin/user/edit");
		return modelAndView;
	}

	@RequestMapping("/addorUpdate")
	@RequiresPermissions(value = "user:add")
	@SystemControllerLog(description = "添加用户")
	public ModelAndView addorUpdate(HttpServletRequest request, @ModelAttribute("user") User user,
			@RequestParam(value = "hid", defaultValue = "") String hid,
			@RequestParam(value = "roleId", defaultValue = "") String roleId) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			String[] filetype = new String[] { "png", "jpeg", "gif", "jpg" };
			String UPLOADDIR = File.separator + "FileUpload" + File.separator + "Img" + File.separator;
			List<Map<String, Object>> result = fileOperateUtil.upload(request, UPLOADDIR, filetype);
			Boolean hasfile = (Boolean) result.get(0).get("nofile");

			if (!hasfile) {
				boolean has = (Boolean) result.get(0).get("hassuffix");
				// 如果上传文件符合要求
				if (has != false) {
					String photograph = (String) result.get(0).get("servletPath");
					user.setPhotograph(photograph);
				}
			}

			// 判断用户信息不为空，并且用户id不为空
			if (user != null && !("").equals(hid)) {
				// 执行修改操作
				User eduser = this.userService.findUserById(hid);
				if (eduser == null)
					eduser = new User();
				eduser.setAccountName(user.getAccountName());
				eduser.setCardId(user.getCardId());
				eduser.setCardType(user.getCardType());
				eduser.setIshiden(user.isIshiden());
				eduser.setPhotograph(user.getPhotograph());
				eduser.setUserName(user.getUserName());
				eduser.setPhotograph(user.getPhotograph());
				Role role = this.roleService.findRoleById(roleId);
				// 通过hid获取角色信息，如果为null 返回null否则返回role
				eduser.setRole(role != null ? role : null);
				this.userService.save(eduser);
			} else if (user != null && ("").equals(hid)) {
				User aduser = new User();
				aduser.setAccountName(user.getAccountName());
				aduser.setCardId(user.getCardId());
				aduser.setCardType(user.getCardType());
				aduser.setIshiden(user.isIshiden());
				aduser.setPhotograph(user.getPhotograph());
				aduser.setUserName(user.getUserName());
				aduser.setPassWord(user.getPassWord());
				// 默认分配一个空的集合
				aduser.setResource(new ArrayList<Resource>());
				Role role = this.roleService.findRoleById(roleId);
				aduser.setRole(role != null ? role : null);
				// 执行添加操作
				this.userService.insert(aduser);

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		modelAndView.setViewName("redirect:list");
		return modelAndView;
	}

	@RequestMapping("/list")
	@RequiresPermissions(value = "user:list")
	@SystemControllerLog(description = "查询所有用户")
	public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/user/list");
		// 分页查询数据
		Pagination<User> pagination;
		try {

			pagination = userService.findPaginationByQuery(new Query(), pageNo, pageSize);
			if (pagination == null)
				pagination = new Pagination<User>();

			modelAndView.addObject("pageList", pagination);
			System.out.println(pagination.toString());
		} catch (Exception e) {
			log.info("查询所有用户信息失败——————————》" + e.toString());
			e.printStackTrace();
		}

		return modelAndView;
	}

	@RequestMapping("/delete")
	@RequiresPermissions(value = "user:delete")
	@SystemControllerLog(description = "删除用户")
	public ModelAndView delete(@RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {
				User rm = this.userService.findUserById(id);
				this.userService.remove(rm);// 删除某个id
				log.info("删除角色---》" + id);
			} else if (!ids.isEmpty() && !ids.equals("0")) {
				String[] strids = ids.split(",");
				for (String delids : strids) {
					log.info("删除角色---》" + delids);
					User rm = this.userService.findUserById(delids);
					this.userService.remove(rm);// 删除某个id
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
	 * 
	 * @param printWriter
	 * @param session
	 * @param response
	 */
	@RequestMapping(value = "/ajaxgetRepletes", method = RequestMethod.POST)
	public void ajaxgetRepletes(@RequestParam(value = "accountName", defaultValue = "") String accountName,
			PrintWriter printWriter, HttpSession session, HttpServletResponse response) {
		// 通过ajax获取
		if (!accountName.equals("")) {
			User user;
			try {
				user = this.userService.findUserByAccountName(accountName);
				if (user != null) {
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

	@RequestMapping("/toauthorPage")
	@RequiresPermissions(value = "user:author")
	public ModelAndView toauthorPage(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "100") Integer pageSize, HttpSession session,
			@RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/user/author");
		// 分页查询数据
		Pagination<Resource> pagination;
		try {

			User user = this.userService.findUserById(id);
			List<Resource> reslist = user.getResource();

			pagination = this.resourceService.findPaginationByQuery(new Query(), pageNo, pageSize);
			if (pagination == null)
				pagination = new Pagination<Resource>();

			modelAndView.addObject("resuser", reslist);
			modelAndView.addObject("pageList", pagination);
			modelAndView.addObject("type", "权限分配");
			modelAndView.addObject("userId", id);
			System.out.println(pagination.toString());
		} catch (Exception e) {
			log.info("查询所有资源信息失败——————————》" + e.toString());
			e.printStackTrace();
		}

		return modelAndView;
	}

	/**
	 * 用户授权
	 * 
	 * @param ids
	 */
	@RequestMapping("/addauthor")
	@RequiresPermissions(value = "user:author")
	public ModelAndView addauthor(HttpSession session, @RequestParam(value = "ids", defaultValue = "") String ids,
			@RequestParam(value = "userId", defaultValue = "") String userId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:list");
		// 通过用户id查询用户的所有资源
		try {
			List<Resource> listres = new ArrayList<Resource>();
			// 通过用户名获取用户对象
			User user = this.userService.findUserById(userId);
			// 清除原有的权限
			user.setResource(new ArrayList<Resource>());
			this.userService.save(user);

			String[] strids = ids.split(",");
			for (String resids : strids) {
				// 通过资源的id获取资源
				Resource res = this.resourceService.findResourceById(resids);
				if(res!=null)
				listres.add(res);
			}
			user.setResource(listres);

			this.userService.save(user);

		/*	List<Resource> rs = user.getResource();
			// 权限信息对象info，用来存放查出的用户所有角色（role）及权限（permission）
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			
			for (Resource r : rs) {
				
				log.info("资源：" + r.getName() + ":" + r.getResUrl());
				
				info.addStringPermission(r.getResKey());
				
				session.setAttribute("resourceslist", rs);
				
				log.info("当前登录用户访问资源权限：" + info);
			}*/

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	// @RequestMapping(value = "/ajaxLogin", method = RequestMethod.POST)
	// public void ajaxLogin(@RequestParam(value = "accountName", defaultValue =
	// "") String accountName,
	// @RequestParam(value="passWord",defaultValue="")String passWord,
	// PrintWriter printWriter, HttpSession session, HttpServletResponse
	// response,
	// @RequestParam(value = "remember", defaultValue = "") String remember) {
	// User usersession = (User) session.getAttribute("userSession");
	// String msg = "";
	// //如果用户的session为空则登录成功
	// if(usersession == null){
	//
	// boolean rememberMe = false;
	// if (!("").equals(remember)) {
	// rememberMe = true;
	// }
	// if (accountName != "" && passWord != "") {
	// UsernamePasswordToken token = new UsernamePasswordToken(accountName,
	// passWord);
	// token.setRememberMe(rememberMe);
	// Subject subject = SecurityUtils.getSubject();// 获得主体
	// try {
	// subject.login(token);
	// if (subject.isAuthenticated()) {
	// //登录成功页面跳转
	// } else {
	// msg = "登录失败";
	// }
	// } catch (IncorrectCredentialsException e) {
	// msg = "登录密码错误. Password for account " + token.getPrincipal() + "
	// wasincorrect.";
	// } catch (ExcessiveAttemptsException e) {
	// msg = "登录失败次数过多";
	// } catch (LockedAccountException e) {
	// msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was
	// locked.";
	// } catch (DisabledAccountException e) {
	// msg = "帐号已被禁用. The account for username " + token.getPrincipal() + " was
	// disabled.";
	// } catch (ExpiredCredentialsException e) {
	// msg = "帐号已过期. the account for username " + token.getPrincipal() + " was
	// expired.";
	// } catch (UnknownAccountException e) {
	// msg = "帐号不存在. There is no user with username of " + token.getPrincipal();
	// } catch (UnauthorizedException e) {
	// msg = "您没有得到相应的授权！" + e.getMessage();
	// }
	// }
	// }
	// printWriter.write(msg);
	// printWriter.flush();
	// printWriter.close();
	// }

}
