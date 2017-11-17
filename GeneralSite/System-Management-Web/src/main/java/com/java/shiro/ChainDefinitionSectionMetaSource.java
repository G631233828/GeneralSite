package com.java.shiro;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.shiro.config.Ini;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.query.Query;

import com.java.dao.ResourceDao;
import com.java.pojo.Resource;

public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {
	private static final Logger log = LoggerFactory.getLogger(ChainDefinitionSectionMetaSource.class);
	private String filterChainDefinitions;

	public Ini.Section getObject() throws Exception {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "application-config.xml" });
		
		ResourceDao resourceDao = (ResourceDao) ac.getBean("resourceDaoImpl");
		
		// 获取所有Resource
		Ini ini = new Ini();
		
		// 加载默认的url
		ini.load(filterChainDefinitions);
		
		Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
		
		List<Resource> list = resourceDao.find(new Query());
		
		// 循环Resource的url,逐个添加到section中。section就是filterChainDefinitionMap,
		// 里面的键就是链接URL,值就是存在什么条件才能访问该链接
		for (Resource resource : list) {
			// 构成permission字符串
			if (StringUtils.isNotEmpty(resource.getResUrl() + "")
					&& StringUtils.isNotEmpty(resource.getResKey() + "")) {
				// 不对角色进行权限验证
				//String permission = "perms[" + resource.getResKey() + "]";
				//log.info("所有权限信息" + permission);
				//资源权限
				//section.put(resource.getResUrl() + "", permission);
				
				// map.put(resource.getResUrl() + "", permission);
				
				//添加角色权限对角色进行权限验证
				String permissionRole = "roles[" + resource.getResKey() + "]";
				log.info("所有权限信息" + permissionRole);
				section.put(resource.getResUrl() + "", permissionRole);
				
			}
		}
	

		// 所有资源的访问权限，必须放在最后
		/* section.put("/**", "authc"); */
		/**
		 * 如果需要一个用户只能登录一处地方,,修改为 section.put("/**",
		 * "authc,kickout,sysUser,user");
		 **/
		section.put("/**", "authc");
		return section;
	}

	/**
	 * 通过filterChainDefinitions对默认的url过滤定义
	 * 
	 * @param filterChainDefinitions
	 *            默认的url过滤定义
	 */
	public void setFilterChainDefinitions(String filterChainDefinitions) {
		this.filterChainDefinitions = filterChainDefinitions;
	}

	public Class<?> getObjectType() {
		return this.getClass();
	}

	public boolean isSingleton() {
		return false;
	}
}
