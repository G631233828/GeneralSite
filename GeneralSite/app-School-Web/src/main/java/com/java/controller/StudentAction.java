package com.java.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mongodb.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.annotation.SystemControllerLog;
import com.java.pojo.Student;
import com.java.service.StudentService;
import com.java.util.ExcelReadUtil;
import com.java.util.FileOperateUtil;


@Controller
@RequestMapping("/student")
public class StudentAction  {

	private static final Logger log= LoggerFactory.getLogger(StudentAction.class);
	ExcelReadUtil ex=new ExcelReadUtil();
	@Autowired
	private StudentService studentService;

	/**
	 * 查询所有学生信息
	 * @param pageNo
	 * @param pageSize
	 * @param session
	 * @return&search1=${search1}&search1text=${search1text}&search1val=${search1val}&
	 * search2=${search2}&search2text=${search2text}&search2val=${search2val}
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	@SystemControllerLog(description = "查询所有的学生信息")  
	public ModelAndView findlist(
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "roleType", defaultValue = "") String roleType,
			@RequestParam(value = "error", defaultValue = "") String error,
			@RequestParam(value = "search1", defaultValue = "") String search1,
			@RequestParam(value = "search1val", defaultValue = "") String search1val,
			@RequestParam(value = "search2", defaultValue = "") String search2,
			@RequestParam(value = "search2val", defaultValue = "") String search2val,
			HttpSession session) {
		log.info("查询所有学生信息——————————》");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/student/list");
		
		if(!"".equals(error)){
			modelAndView.addObject("error", error);
		}
		
		if(roleType.length()>1){
			roleType=roleType.substring(0, 1);
		}
		
			// 分页查询数据
			Pagination<Student> pagination;
			try {
				search1=new String(search1.getBytes("iso8859-1"),"UTF-8");
				search2=new String(search2.getBytes("iso8859-1"),"UTF-8");
				
				modelAndView.addObject("search1", search1);
				modelAndView.addObject("search2", search2);
				String search1text="";
				String search2text="";
				if(!"".equals(search1)){
					search1text=search1.substring(search1.lastIndexOf("_")+1, search1.length());
					search1=search1.substring(0, search1.lastIndexOf("_"));
				}
				if(!"".equals(search2)){
					search2text=search2.substring(search2.lastIndexOf("_")+1, search2.length());
					search2=search2.substring(0, search2.lastIndexOf("_"));
				}
				search1val=new String(search1val.getBytes("iso8859-1"),"UTF-8");
				search2val=new String(search2val.getBytes("iso8859-1"),"UTF-8");
				pagination = studentService.findPaginationByQuery(this.studentService.searchQuery(search1, search1val, search2, search2val), pageNo, pageSize);
				if (pagination == null)
					pagination = new Pagination<Student>();
				modelAndView.addObject("pageList", pagination);
				modelAndView.addObject("search1val", search1val);
				modelAndView.addObject("search2val", search2val);
				modelAndView.addObject("search1text", search1text);
				modelAndView.addObject("search2text", search2text);
			} catch (Exception e) {
				log.info("查询所有学生信息失败——————————》"+e.toString());
				e.printStackTrace();
			}

			modelAndView.addObject("roleType", roleType);
		return modelAndView;// 返回到学校信息
	}
	/***
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param roleType
	 * @param error
	 * 高级查询
	 * @param search1
	 * @param search1val
	 * @param search2
	 * @param search2val
	 * 普通查询
	 * @param search3
	 * @param serach3val
	 * @param search4
	 * @param serach4val
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@SystemControllerLog(description = "查询所有的学生信息")  
	public ModelAndView searchlist(
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(value = "roleType", defaultValue = "") String roleType,
			@RequestParam(value = "error", defaultValue = "") String error,
			@RequestParam(value = "search1", defaultValue = "") String search1,
			@RequestParam(value = "search1val", defaultValue = "") String search1val,
			@RequestParam(value = "search2", defaultValue = "") String search2,
			@RequestParam(value = "search2val", defaultValue = "") String search2val,
			HttpSession session) {
		log.info("查询所有学生信息——————————》");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/student/list");
		
		if(!"".equals(error)){
			modelAndView.addObject("error", error);
		}
		if(search1.equals(search2)){
			search2="";
			search2val="";
		}
		//如果type为1为高级查询
			modelAndView.addObject("search1", search1);
			modelAndView.addObject("search2", search2);
			String search1text="";
			String search2text="";
			if(!"".equals(search1)){
				search1text=search1.substring(search1.lastIndexOf("_")+1, search1.length());
				search1=search1.substring(0, search1.lastIndexOf("_"));
			}
			if(!"".equals(search2)){
				search2text=search2.substring(search2.lastIndexOf("_")+1, search2.length());
				search2=search2.substring(0, search2.lastIndexOf("_"));
			}
			
			// 分页查询数据
			Pagination<Student> pagination;
			try {
				pagination = studentService.findPaginationByQuery(this.studentService.searchQuery(search1, search1val, search2, search2val), pageNo, pageSize);
				if (pagination == null)
					pagination = new Pagination<Student>();
				modelAndView.addObject("pageList", pagination);
		
				modelAndView.addObject("search1val", search1val);
				modelAndView.addObject("search2val", search2val);
				modelAndView.addObject("search1text", search1text);
				modelAndView.addObject("search2text", search2text);
			} catch (Exception e) {
				log.info("查询所有学生信息失败——————————》"+e.toString());
				e.printStackTrace();
			}
			
		modelAndView.addObject("roleType", roleType);
		return modelAndView;// 返回到学校信息
	}
	
	
	
	/***
	 * 
	 * @param id
	 * @param session
	 * @param schoolName校区
	 * @param enrollmentYear入学年份
	 * @param classes班级
	 * @param studentName姓名
	 * @param studentsex性别
	 * @param studentBirthday出生日期
	 * @param permanentAddress户籍地址
	 * @param accountoftheStreet户口所属街道
	 * @param accountCategory户口类别
	 * @param accountProperties户口性质
	 * @param residenceAddress居住地址
	 * @param postcode邮政编码
	 * @param fatherName父亲姓名
	 * @param contactPhone联系电话
	 * @param fatherEducation父亲学历
	 * @param fatherWorkUnit父亲工作单位
	 * @param fatherPost父亲职务
	 * @param fatherContactPhone父亲联系电话
	 * @param matherName母亲姓名
	 * @param matherEducation母亲学历
	 * @param matherWorkUnit母亲工作单位
	 * @param matherPost母亲职务
	 * @param matherContactPhone母亲联系电话
	 * @param jiedou借读
	 * @param studentIdCard学生身份证号码
	 * @param otherCertificates其他证件
	 * @return
	 */
	@RequestMapping(value="/addorupdate",method=RequestMethod.POST)
	@SystemControllerLog(description = "学生信息添加或修改") 
	public ModelAndView  addorupdate(@RequestParam(value = "id", defaultValue = "") String id,
			HttpSession session,
			@RequestParam(value = "schoolName", defaultValue = "")String schoolName,
			@RequestParam(value = "enrollmentYear", defaultValue = "")String enrollmentYear,
			@RequestParam(value = "classes", defaultValue = "")String classes,
			@RequestParam(value = "studentName", defaultValue = "")String studentName,
			@RequestParam(value = "studentsex", defaultValue = "")String studentsex,
			@RequestParam(value = "studentBirthday", defaultValue = "")String studentBirthday,
			@RequestParam(value = "permanentAddress", defaultValue = "")String permanentAddress,
			@RequestParam(value = "accountoftheStreet", defaultValue = "")String accountoftheStreet,
			@RequestParam(value = "accountCategory", defaultValue = "")String accountCategory,
			@RequestParam(value = "accountProperties", defaultValue = "")String accountProperties,
			@RequestParam(value = "residenceAddress", defaultValue = "")String residenceAddress,
			@RequestParam(value = "postcode", defaultValue = "")String postcode,
			@RequestParam(value = "fatherName", defaultValue = "")String fatherName,
			@RequestParam(value = "fatherEducation", defaultValue = "")String fatherEducation,
			@RequestParam(value = "contactPhone", defaultValue = "")String contactPhone,
			@RequestParam(value = "fatherWorkUnit", defaultValue = "")String fatherWorkUnit,
			@RequestParam(value = "fatherPost", defaultValue = "")String fatherPost,
			@RequestParam(value = "fatherContactPhone", defaultValue = "")String fatherContactPhone,
			@RequestParam(value = "matherName", defaultValue = "")String matherName,
			@RequestParam(value = "matherEducation", defaultValue = "")String matherEducation,
			@RequestParam(value = "matherWorkUnit", defaultValue = "")String matherWorkUnit,
			@RequestParam(value = "matherPost", defaultValue = "")String matherPost,
			@RequestParam(value = "matherContactPhone", defaultValue = "")String matherContactPhone,
			@RequestParam(value = "jiedou", defaultValue = "")String jiedou,
			@RequestParam(value = "studentIdCard", defaultValue = "")String studentIdCard,
			@RequestParam(value = "otherCertificates", defaultValue = "")String otherCertificates
			){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/student/list");
		//判断id是否为空，如果id为空说明是添加数据否则是修改数据
		if("".equals(id)){
			//判断必填字段是否是口，如果为空不执行添加
			if(!"".equals(studentName)&&!"".equals(schoolName)&&!"".equals(classes)&&!"".equals(contactPhone)&&!"".equals(studentIdCard)){
				//添加学生
				log.info("添加学生"+studentName);
				try {
					//修改学生信息
					Student student = this.studentService.findbystudentIdCard(studentIdCard);
					if(student==null){
						student=new Student();
					}
					
					student.setAccountCategory(accountCategory);
					student.setAccountoftheStreet(accountoftheStreet);
					student.setAccountProperties(accountProperties);
					student.setClasses(classes);
					student.setContactPhone(contactPhone);
					student.setEnrollmentYear(enrollmentYear);
					student.setFatherContactPhone(fatherContactPhone);
					student.setFatherEducation(fatherEducation);
					student.setFatherName(fatherName);
					student.setFatherPost(fatherPost);
					student.setFatherWorkUnit(fatherWorkUnit);
					student.setJiedou(jiedou);
					student.setMatherContactPhone(matherContactPhone);
					student.setMatherEducation(matherEducation);
					student.setMatherName(matherName);
					student.setMatherPost(matherPost);
					student.setMatherWorkUnit(matherWorkUnit);
					student.setOtherCertificates(otherCertificates);
					student.setPermanentAddress(permanentAddress);
					student.setPostcode(postcode);
					student.setResidenceAddress(residenceAddress);
					student.setSchoolName(schoolName);
					student.setStudentBirthday(studentBirthday);
					student.setStudentIdCard(studentIdCard);
					student.setStudentName(studentName);
					student.setStudentsex(studentsex);
					this.studentService.save(student);
					log.info("添加学生"+studentName+"成功");
				} catch (Exception e) {
					log.info("添加学生"+studentName+"失败"+e.getMessage());
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else{
			try {
				//修改学生信息
				Student student = this.studentService.findUserById(id);
				if(student==null){
					student=new Student();
				}
				student.setAccountCategory(accountCategory);
				student.setAccountoftheStreet(accountoftheStreet);
				student.setAccountProperties(accountProperties);
				student.setClasses(classes);
				student.setContactPhone(contactPhone);
				student.setEnrollmentYear(enrollmentYear);
				student.setFatherContactPhone(fatherContactPhone);
				student.setFatherEducation(fatherEducation);
				student.setFatherName(fatherName);
				student.setFatherPost(fatherPost);
				student.setFatherWorkUnit(fatherWorkUnit);
				student.setJiedou(jiedou);
				student.setMatherContactPhone(matherContactPhone);
				student.setMatherEducation(matherEducation);
				student.setMatherName(matherName);
				student.setMatherPost(matherPost);
				student.setMatherWorkUnit(matherWorkUnit);
				student.setOtherCertificates(otherCertificates);
				student.setPermanentAddress(permanentAddress);
				student.setPostcode(postcode);
				student.setResidenceAddress(residenceAddress);
				student.setSchoolName(schoolName);
				student.setStudentBirthday(studentBirthday);
				student.setStudentIdCard(studentIdCard);
				student.setStudentName(studentName);
				student.setStudentsex(studentsex);
				this.studentService.save(student);
				log.info("修改"+studentName+"的信息成功");
			} catch (Exception e) {
				log.info("修改"+studentName+"的信息失败:"+e.getMessage());
				e.printStackTrace();
			}
		}
		return modelAndView;
	}
	
	/***
	 * 删除学生信息
	 * @param session
	 * @param id
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@SystemControllerLog(description = "删除学生数据") 
	public ModelAndView delete(HttpSession session,@RequestParam(value="id",defaultValue="0")String id,@RequestParam(value="ids",defaultValue="0")String ids){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/student/list");
		try {
		if(!id.isEmpty()&&!id.equals("0")){
			Student rm=this.studentService.findUserById(id);
				this.studentService.remove(rm);//删除某个id
				log.info("删除学生信息---》"+id);
				}
		else if(!ids.isEmpty()&&!ids.equals("0")){
			String[] strids=ids.split(",");
			for(String delids:strids){
				log.info("删除学生信息---》"+delids);
				Student rm=this.studentService.findUserById(delids);
				this.studentService.remove(rm);//删除某个id
			}
		}
			} catch (Exception e) {
				e.printStackTrace();
				log.info("删除学生信息失败"+e.toString());
			}
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/***
	 * 文件上传
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "static-access", "unused" })
	@RequestMapping(value = "upload")  
    public ModelAndView upload(HttpServletRequest request,HttpSession session,RedirectAttributes attr) {  
		System.out.println("上传文件");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/student/list");
		String error="";
        try{
		Map<String, Object> map = new HashMap<String, Object>();  
    	Student t = null;
        // 别名  
        String[] alaises = ServletRequestUtils.getStringParameters(request,  
                "upload");  
//        String newpath = path + File.separator + "file" + File.separator
//				+ gallery.getTitle();
        String upname="WEB-INF"+File.separator+"FileUpload"+File.separator+"studentMessage";
        //可以上传的文件格式
       log.info("准备上传学生数据");
        String filetype[]={"xls,xlsx"};
        List<Map<String, Object>> result = FileOperateUtil.upload(request,upname,filetype);  
       log.info("上传文件成功");
        boolean has= (Boolean) result.get(0).get("hassuffix");
        
        if(has!=false){
          	//获得上传的xls文件路径
            String path=(String) result.get(0).get("savepath");
            	File file=new File(path);
     	       String[][] resultexcel;
     	       resultexcel = ex.readExcel(file, 1);
     		       int rowLength = resultexcel.length;
     		      ProcessInfo pri = new ProcessInfo();  
     		     pri.allnum=rowLength;
     		       for(int i=0;i<rowLength;i++) {
     		    	  pri.nownum=i;
          		     pri.lastnum=rowLength-i;
          		     session.setAttribute("proInfo",pri);
          		     System.out.println("当前导入"+pri.nownum);
          		     System.out.println("当前导入"+pri.nownum);
     		    	   int j=0;
     		    	   try{
     		    		  String schoolName=resultexcel[i][j];
     		              String enrollmentYear=resultexcel[i][j+1];
     		              String classes=resultexcel[i][j+2];
     		              String studentName=resultexcel[i][j+3];
     		              String studentsex=resultexcel[i][j+4];
     		              String studentBirthday=resultexcel[i][j+5];
     		              String permanentAddress=resultexcel[i][j+6];
     		              String accountoftheStreet=resultexcel[i][j+7];
     		              String accountCategory=resultexcel[i][j+8];
     		              String accountProperties=resultexcel[i][j+9];
     		              String residenceAddress=resultexcel[i][j+10];
     		              String postcode=resultexcel[i][j+11];
     		              String contactPhone=resultexcel[i][j+12];
     		              String fatherName=resultexcel[i][j+13];
     		              String fatherEducation=resultexcel[i][j+14];
     		              String fatherWorkUnit=resultexcel[i][j+15];
     		              String fatherPost=resultexcel[i][j+16];
     		              String fatherContactPhone=resultexcel[i][j+17];
     		              String matherName=resultexcel[i][j+18];
     		              String matherEducation=resultexcel[i][j+19];
     		              String matherWorkUnit=resultexcel[i][j+20];
     		              String matherPost=resultexcel[i][j+21];
     		              String matherContactPhone=resultexcel[i][j+22];
     		              String jiedou=resultexcel[i][j+23];
     		              String studentIdCard=resultexcel[i][j+24];
     		              String otherCertificates=resultexcel[i][j+25];
     		              if("".equals(studentIdCard)){
     		            	 error+="导入文件过程中出现错误第<b>&nbsp&nbsp"+(i+2)+"&nbsp&nbsp</b>行出现错误内容为<b>&nbsp&nbsp导入学生身份证不能为空&nbsp&nbsp</b></br>";
          		            continue;
     		              }
     		             Student student= this.studentService.findbystudentIdCard(studentIdCard);
     		             if(student!=null){
     		            	 if(student.getStudentIdCard().equals(studentIdCard)){
     		            	student.setAccountCategory(accountCategory);
     		   				student.setAccountoftheStreet(accountoftheStreet);
     		   				student.setAccountProperties(accountProperties);
     		   				student.setClasses(classes);
     		   				student.setContactPhone(contactPhone);
     		   				student.setEnrollmentYear(enrollmentYear);
     		   				student.setFatherContactPhone(fatherContactPhone);
     		   				student.setFatherEducation(fatherEducation);
     		   				student.setFatherName(fatherName);
     		   				student.setFatherPost(fatherPost);
     		   				student.setFatherWorkUnit(fatherWorkUnit);
     		   				student.setJiedou(jiedou);
     		   				student.setMatherContactPhone(matherContactPhone);
     		   				student.setMatherEducation(matherEducation);
     		   				student.setMatherName(matherName);
     		   				student.setMatherPost(matherPost);
     		   				student.setMatherWorkUnit(matherWorkUnit);
     		   				student.setOtherCertificates(otherCertificates);
     		   				student.setPermanentAddress(permanentAddress);
     		   				student.setPostcode(postcode);
     		   				student.setResidenceAddress(residenceAddress);
     		   				student.setSchoolName(schoolName);
     		   				student.setStudentBirthday(studentBirthday);
     		   				student.setStudentIdCard(studentIdCard);
     		   				student.setStudentName(studentName);
     		   				student.setStudentsex(studentsex);
     		   				this.studentService.save(student);
     		            	 }
     		             }
    		              if(student==null){
    		            	student = new Student();
    		            	student.setAccountCategory(accountCategory);
       		   				student.setAccountoftheStreet(accountoftheStreet);
       		   				student.setAccountProperties(accountProperties);
       		   				student.setClasses(classes);
       		   				student.setContactPhone(contactPhone);
       		   				student.setEnrollmentYear(enrollmentYear);
       		   				student.setFatherContactPhone(fatherContactPhone);
       		   				student.setFatherEducation(fatherEducation);
       		   				student.setFatherName(fatherName);
       		   				student.setFatherPost(fatherPost);
       		   				student.setFatherWorkUnit(fatherWorkUnit);
       		   				student.setJiedou(jiedou);
       		   				student.setMatherContactPhone(matherContactPhone);
       		   				student.setMatherEducation(matherEducation);
       		   				student.setMatherName(matherName);
       		   				student.setMatherPost(matherPost);
       		   				student.setMatherWorkUnit(matherWorkUnit);
       		   				student.setOtherCertificates(otherCertificates);
       		   				student.setPermanentAddress(permanentAddress);
       		   				student.setPostcode(postcode);
       		   				student.setResidenceAddress(residenceAddress);
       		   				student.setSchoolName(schoolName);
       		   				student.setStudentBirthday(studentBirthday);
       		   				student.setStudentIdCard(studentIdCard);
       		   				student.setStudentName(studentName);
       		   				student.setStudentsex(studentsex);
       		   				this.studentService.insert(student);
     		    	   }
    		              	//捕捉批量导入过程中遇到的错误，记录错误行数继续执行下去
     		              }catch(Exception e){
     		            	 log.debug("导入文件过程中出现错误第"+(i+2)+"行出现错误"+e);
     		            	String aa=e.getLocalizedMessage();
     		            	String b=aa.substring(aa.indexOf(":")+1,aa.length()).replaceAll("\"", "");
     		            	 
     		            	error+="导入文件过程中出现错误第<b>&nbsp&nbsp"+(i+2)+"&nbsp&nbsp</b>行出现错误内容为<b>&nbsp&nbsp"+b+"&nbsp&nbsp</b></br>";
     		            	 if((i+1)<rowLength){
     		            		 continue;
     		            	 }
     		            	
     		              }
     		       		}
     		       log.info(error);
     		       attr.addFlashAttribute("error",error);
          //  map.put("result", result);  
           return new ModelAndView("redirect:/student/list"); 
     		     //  return modelAndView;
        }
        }catch(Exception e){
        	modelAndView.addObject("error", e);
        	 return new ModelAndView("redirect:/student/list"); 
        	
        }
        
        
        return modelAndView;
      
    }  
	
	/**
	 * 文件下载
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "download")  
    public ModelAndView download(HttpServletRequest request,  
            HttpServletResponse response) throws Exception {  
        String storeName = "学生信息导入模版.xlsx";  
        String contentType = "application/octet-stream";  
        String UPLOAD="WEB-INF/Template/studentMessage/";
        FileOperateUtil.download(request, response, storeName, contentType,UPLOAD);  
  
        return null;  
    }  
	
    
  
  /** 
   * process 获取进度 
   * @param request 
   * @param response 
   * @return 
   * @throws Exception 
   */  
  @RequestMapping(value = "uploadprocess")  
  @ResponseBody  
  public Object process(HttpServletRequest request,  
          HttpServletResponse response) throws Exception { 
  	System.out.println(( ProcessInfo)request.getSession().getAttribute("proInfo"));
      return ( ProcessInfo)request.getSession().getAttribute("proInfo");  
  }  
    
  class ProcessInfo{  
      public long allnum=0;//导入数据总数
      public long nownum=0;//当前导入第几条
      public long lastnum=0;//还剩几条数据
  }  
   
    
    
    
    
}
