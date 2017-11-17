package test;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.java.dao.RoleDao;
import com.java.pojo.Role;

public class TestInserRole {
	
	ApplicationContext ac=null;
	
	@Before
	public void befort(){
		 ac=new ClassPathXmlApplicationContext(new String[]{"application-config.xml","dispatcher-servlet.xml"});
	}
	
	
	
	
	@Test
	public void test() throws Exception {
		RoleDao roledao=(RoleDao) ac.getBean("roleDaoImpl");
		Role role=new Role();
		role.setRoleKey("supermanager");
		role.setDescription("超级管理员");
		role.setRoleName("超级管理员");
		role.setCreateTime(new Date());
		role.setIshiden(false);
		roledao.insert(role);
	}

}
