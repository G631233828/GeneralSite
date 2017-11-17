package test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.query.Query;

import com.java.dao.ResourceDao;
import com.java.pojo.Resource;

public class TestInserResource {
	
	ApplicationContext ac=null;
	
	@Before
	public void befort(){
		 ac=new ClassPathXmlApplicationContext(new String[]{"application-config.xml","dispatcher-servlet.xml"});
	}
	
	
	
	
	@Test
	public void test() throws Exception {
		ResourceDao resdao=(ResourceDao) ac.getBean("resourceDaoImpl");
		Resource res=new Resource();
//		res.setName("系统基础管理");
//		res.setDescription("系统基础管理");
//		res.setIcon("icon");
//		res.setIshiden(false);
//		res.setParentId("0");//父目录id  如果id为0则为主目录
//		res.setResKey("system");
//		res.setResUrl("system");
//		res.setType(0);//0为目录  //0为父目录  1为菜单   2为操作功能（添加删除修改）
//		resdao.insert(res);
		res.setName("用户管理");
		res.setDescription("用户管理");
		res.setIcon("icon");
		res.setIshiden(false);
		res.setParentId("593b490977c802f49483144a");//父目录id  如果id为0则为主目录
		res.setResKey("user:list");
		res.setResUrl("/user/list");
		res.setType(1);//0为目录  //0为父目录  1为菜单   2为操作功能（添加删除修改）
		resdao.insert(res);
		res=new Resource();
		res.setName("资源管理");
		res.setDescription("资源管理");
		res.setIcon("icon");
		res.setIshiden(false);
		res.setParentId("593b490977c802f49483144a");//父目录id  如果id为0则为主目录
		res.setResKey("resource:list");
		res.setResUrl("resource/list");
		res.setType(1);//0为目录  //0为父目录  1为菜单   2为操作功能（添加删除修改）
		resdao.insert(res);
		res=new Resource();
		res.setName("角色管理");
		res.setDescription("角色管理");
		res.setIcon("icon");
		res.setIshiden(false);
		res.setParentId("593b490977c802f49483144a");//父目录id  如果id为0则为主目录
		res.setResKey("role:list");
		res.setResUrl("role/list");
		res.setType(1);//0为目录  //0为父目录  1为菜单   2为操作功能（添加删除修改）	
		resdao.insert(res);
		
		res=new Resource();
		res.setName("添加");
		res.setDescription("添加按钮");
		res.setIcon("icon");
		res.setIshiden(false);
		res.setParentId("593b490977c802f49483144a");//父目录id  如果id为0则为主目录
		res.setResKey("user:add");
		res.setResUrl("user/add");
		res.setType(2);//0为目录  //0为父目录  1为菜单   2为操作功能（添加删除修改）按钮
		resdao.insert(res);
		
		res=new Resource();
		res.setName("删除");
		res.setDescription("删除按钮");
		res.setIcon("icon");
		res.setIshiden(false);
		res.setParentId("593b490977c802f49483144a");//父目录id  如果id为0则为主目录
		res.setResKey("user:delete");
		res.setResUrl("user/delete");
		res.setType(2);//0为目录  //0为父目录  1为菜单   2为操作功能（添加删除修改）按钮
		resdao.insert(res);
		
		res=new Resource();
		res.setName("修改");
		res.setDescription("修改按钮");
		res.setIcon("icon");
		res.setIshiden(false);
		res.setParentId("593b490977c802f49483144a");//父目录id  如果id为0则为主目录
		res.setResKey("user:edit");
		res.setResUrl("user/edit");
		res.setType(2);//0为目录  //0为父目录  1为菜单   2为操作功能（添加删除修改）按钮
		resdao.insert(res);
		
	}

	
	//@Test
	public void getResources() throws Exception{
		ResourceDao resdao=(ResourceDao) ac.getBean("resourceDaoImpl");
		  List<Resource> list = resdao.find(new Query());
		  for(Resource re:list){
			  System.out.println(re.getResKey());
		  }
	}
/*	
	//@Test
	public void getResources2() throws Exception{
		ResourceService resdao=(ResourceService) ac.getBean("resourceService");
		List list= new ArrayList();
		list.add("593b490977c802f49483144a");
		list.add("5937b9b6d724bac208e93c8a");
		list.add("5937b9b6d724bac208e93c8b");
		list.add("5937b9b6d724bac208e93c8c");
		List<Resource> list2=resdao.findlistResource(list);
		for(Resource r:list2){
			System.out.println(r.getName());
		}
	}*/

}
