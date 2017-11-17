package com.java.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.pojo.School;
import com.java.service.SchoolService;

@Controller
@RequestMapping("/school")
public class SchoolController extends GeneralAction<School> {

    private static final Logger log = LoggerFactory.getLogger(SchoolController.class);

    @Autowired
    private SchoolService schoolService;

    /**
     * 跳转到编辑界面
     * 
     * @param type
     *            1为添加 2为修改 其余数字不进行操作
     * @return
     */
    @RequestMapping("/toaddPage")
    @RequiresPermissions(value = "school:add")
    public ModelAndView toaddPage(@RequestParam(value = "type", defaultValue = "") String type,
	    @RequestParam(value = "id", defaultValue = "") String id) {
	ModelAndView modelAndView = new ModelAndView();
	// 获取所有角色信息
	if ("1".equals(type)) {
	    // 添加用户
	    modelAndView.addObject("type", "添加学校");
	} else if ("2".equals(type)) {
	    if (!"".equals(id)) {
		// 通过id查询该条记录
		try {
		    School school = this.schoolService.findSchoolById(id);
		    modelAndView.addObject("school", school);
		} catch (Exception e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}

	    }
	    modelAndView.addObject("type", "编辑学校");
	}
	modelAndView.setViewName("admin/school/edit");
	return modelAndView;
    }

    @RequestMapping("/addorUpdate")
    @RequiresPermissions(value = "school:add")
    public ModelAndView addorUpdate(School school, @RequestParam(value = "hid", defaultValue = "") String hid) {
	ModelAndView modelAndView = new ModelAndView();
	try {
	    // 判断用户信息不为空，并且用户id不为空
	    if (school != null && !("").equals(hid)) {
		// 执行修改操作
		School ed = this.schoolService.findSchoolById(hid);
		if (ed == null)
		    ed = new School();
		ed.setAccountName(school.getAccountName());
		ed.setAddress(school.getAddress());
		ed.setMobile(school.getMobile());
		ed.setName(school.getName());
		ed.setPassword(school.getPassword());
		ed.setWebkey(school.getWebkey());
		ed.setWebsite(school.getWebsite());
		ed.setIshiden(school.isIshiden());
		this.schoolService.save(ed);

	    } else if (school != null && ("").equals(hid)) {
		School ad = new School();
		ad.setAccountName(school.getAccountName());
		ad.setAddress(school.getAddress());
		ad.setMobile(school.getMobile());
		ad.setName(school.getName());
		ad.setPassword(school.getPassword());
		ad.setWebkey(school.getWebkey());
		ad.setIshiden(school.isIshiden());
		ad.setWebsite(school.getWebsite());
		// 执行添加操作
		this.schoolService.insert(ad);
	    }

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

	modelAndView.setViewName("redirect:/school/list");
	return modelAndView;
    }

    @RequestMapping("/list")
    @RequiresPermissions(value = "school:list")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
	    @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize, HttpSession session) {
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.setViewName("admin/school/list");
	// 分页查询数据
	Pagination<School> pagination;
	try {

	    pagination = this.schoolService.findPaginationByQuery(new Query(), pageNo, pageSize);
	    if (pagination == null)
		pagination = new Pagination<School>();

	    modelAndView.addObject("pageList", pagination);
	    System.out.println(pagination.toString());
	} catch (Exception e) {
	    log.info("查询所有学校信息失败——————————》" + e.toString());
	    e.printStackTrace();
	}

	return modelAndView;
    }

    @RequestMapping("/delete")
    @RequiresPermissions(value = "school:delete")
    public ModelAndView delete(@RequestParam(value = "id", defaultValue = "0") String id,
	    @RequestParam(value = "ids", defaultValue = "0") String ids) {
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.setViewName("redirect:/school/list");
	try {
	    if (!id.isEmpty() && !id.equals("0")) {
		School rm = this.schoolService.findSchoolById(id);
		this.schoolService.remove(rm);// 删除某个id
		log.info("删除学校---》" + id);
	    } else if (!ids.isEmpty() && !ids.equals("0")) {
		String[] strids = ids.split(",");
		for (String delids : strids) {
		    log.info("删除学校---》" + delids);
		    School rm = this.schoolService.findSchoolById(delids);
		    this.schoolService.remove(rm);// 删除某个id
		}
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    log.info("删除学校失败" + e.toString());
	}

	return modelAndView;

    }



}
