//package test;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import com.java.dao.StudentDao;
//import com.java.pojo.Clazzes;
//import com.java.pojo.Student;
//import com.java.service.ClazzesService;
//import com.java.service.StudentService;
//
//public class TestInertStudentClass {
//
//    ApplicationContext ac=null;
//	
//	//@Before
//	public void befort(){
//		 ac=new ClassPathXmlApplicationContext(new String[]{"application-config.xml","dispatcher-servlet.xml","dispatcher-shiro.xml"});
//	}
//	
//    
//    /**
//     * 添加学生并且绑定班级
//     * @throws Exception
//     */
//    @Test
//    public void InsertStudent() throws Exception {
//	StudentDao studentdao=(StudentDao) ac.getBean("studentDaoImpl");
//	List<Student> studentList = new ArrayList<Student>();
//	ClazzesService clazzService = (ClazzesService)ac.getBean("clazzesService");
//	Clazzes clazz =clazzService.findClazzById("59658fd4d724ccce5ee5cc5b");
//	if(clazz!=null){
//	for(int i=0;i<10;i++){
//	    Student student = new Student();
//	    student.setAge(11);
//	    student.setClazzes(clazz);
//	    student.setEnterYear("2015");
//	    student.setName("学生"+i);
//	    studentdao.insert(student);
//	    studentList.add(student);
//	}
//	    clazz.setStudent(studentList);
//	    clazzService.save(clazz);
//	}
//    }
//    
//    /**
//     * 初始化一个班级
//     * @throws Exception
//     */
//    @Test
//    public void InsertClazz() throws Exception{
//	  ClazzesService clazzService = (ClazzesService)ac.getBean("clazzesService");
//	Clazzes c = new Clazzes();
//	c.setClassRoom("2014年1班");
//	c.setClassTeacher("Mrs zhang");
//	c.setStudent(new ArrayList());
//	clazzService.insert(c);
//	
//    }
//    
//    /**
//     * 通过联合查询获取班级下的所有学生信息
//     * @throws Exception
//     */
//    @Test
//    public void getAllClazz() throws Exception{
//	  ClazzesService clazzService = (ClazzesService)ac.getBean("clazzesService");
//	 Clazzes c = clazzService.findClazzById("59658fd4d724ccce5ee5cc5b");
//	 for(Student s :c.getStudent()){
//	     System.out.println("联合查询学生姓名："+s.getName());
//	 }
//	 
//    }
//    
//    
//    	/*
//    	 * 通过学生的id获取学生的班级
//    	 */
//    @Test
//    public void findAllStudent() throws Exception{
//	StudentService s = (StudentService)ac.getBean("studentService");
//	Student ss = s.findUserById("59658831d724a1cb751c3ef8");
//	//通过联合查询获取班级信息
//	System.out.println(ss.getClazzes().getClassRoom());
//    }
//    
//    
//    
//    
//    /**
//     * 删除学生的时候执行联合删除班级中的学生
//     * @throws Exception
//     */
//    @Test
//    public void deleteStudent() throws Exception{
//	StudentService s = (StudentService)ac.getBean("studentService");
//	ClazzesService clazzService = (ClazzesService)ac.getBean("clazzesService");
//	Student ss = s.findUserById("596591e1d7241f4590bddef5");
//	List<Student> list= ss.getClazzes().getStudent();
//	List<Student> listnew = new ArrayList<Student>();
//	for(Student stu:list){
//	    if(!stu.getId().equals("596591e1d7241f4590bddef5")){
//		listnew.add(stu);
//	    }
//	}
//	
//	Clazzes c = ss.getClazzes();
//	c.setStudent(listnew);
//	clazzService.save(c);
//	s.remove(ss);
//	
//	
//    }
//   
//}
