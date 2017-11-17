package test;

import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.query.Query;

import com.java.dao.ResourceDao;
import com.java.dao.RoleDao;
import com.java.dao.UserDao;
import com.java.pojo.Resource;
import com.java.pojo.Role;
import com.java.pojo.User;

public class TestInserUser {
	
	ApplicationContext ac=null;
	
	@Before
	public void befort(){
		 ac=new ClassPathXmlApplicationContext(new String[]{"application-config.xml","dispatcher-servlet.xml"});
	}
	
	
	
	//初始化用户赋予所有权限
	@Test
	public void test() throws Exception {
		UserDao userdao=(UserDao) ac.getBean("userDaoImpl");
		ResourceDao resourceDao=(ResourceDao) ac.getBean("resourceDaoImpl");
		RoleDao roleDao=(RoleDao) ac.getBean("roleDaoImpl");
		User user =new User();
		user.setAccountName("admin");
		user.setCardId("123456");
		user.setCardType("身份证");
		user.setCreateTime(new Date());
		user.setPassWord("123456");
		user.setIshiden(false);
		user.setLastLoginIp(null);
		user.setPhotograph("/user/uploadImg/aaa.jpg");
		user.setUserName("admin");
		List<Resource> list = resourceDao.find(new Query());
		user.setResource(list);
		Role role = roleDao.findOneById("5937b588d7242e82611af4ae");
		user.setRole(role);
		userdao.insert(user);
	}

	
	

}
