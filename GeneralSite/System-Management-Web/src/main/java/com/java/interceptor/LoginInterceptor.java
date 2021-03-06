package com.java.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.java.pojo.User;
import com.java.util.Constant;




/**
 * 登录拦截
 * @author fliay-1008
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger Log=LoggerFactory.getLogger(LoginInterceptor.class);

	
	public String[] allowUrls;//还没发现可以直接配置不拦截的资源，所以在代码里面来排除  
    
    public void setAllowUrls(String[] allowUrls) {  
        this.allowUrls = allowUrls;  
    }  
  
    /** 
     * preHandle方法是进行处理器拦截用的，顾名思义，该方法将在Controller处理之前进行调用，SpringMVC中的Interceptor拦截器是链式的，可以同时存在 
     * 多个Interceptor，然后SpringMVC会根据声明的前后顺序一个接一个的执行，而且所有的Interceptor中的preHandle方法都会在 
     * Controller方法调用之前调用。SpringMVC的这种Interceptor链式结构也是可以进行中断的，这种中断方式是令preHandle的返 
     * 回值为false，当preHandle的返回值为false的时候整个请求就结束了。 
     * @throws Exception 
     */  
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		 
//		Subject remembered = SecurityUtils.getSubject();
//		System.out.println(!remembered.isAuthenticated());
//		System.out.println(remembered.isRemembered());
//		if(!remembered.isAuthenticated()&&remembered.isRemembered()){
//			return true;
//		}
		
		
		String requestUr2 = request.getRequestURI().replace(request.getContextPath(), "");   
		  String selectid =request.getParameter("selectid");
		  String selectparentid =request.getParameter("selectparentid");
		  //不拦截assets目录下的内容
		  if(null != allowUrls && allowUrls.length>=1)  
	            for(String url : allowUrls) {    
	                if(requestUr2.contains(url)) {    
	                    return true;    
	                }    
	            } 
		String url=request.getRequestURI().toString();
		Log.info("请求url:"+url);
		Log.info("请求的IP："+request.getRemoteAddr());
		boolean flag=false;
	
		HttpSession session=request.getSession();
		
		 session.setAttribute("selectid", selectid);
		 session.setAttribute("selectparentid", selectparentid);
		
		
		User usersession=(User) session.getAttribute(Constant.USER_SESSION);
//
		//判断是AJAX请求还是普通请求
		String requestType=request.getHeader("X-Requested-With");
		if(requestType!=null&&request.equals("XMLHttpRequest")){
			response.setContentType("json/application");
			response.setCharacterEncoding("gbk");
			return false;
		}
	
//		HttpSession session=request.getSession();
		if(session.getAttribute(Constant.USER_SESSION)!=null){
						return true;
		}
	
		
		
		
		session.setAttribute("msg", "登录过期请重新登录");
		response.sendRedirect(request.getContextPath()+"/user/login");
		return false;
		
	}
	 /** 
     * 这个方法只会在当前这个Interceptor的preHandle方法返回值为true的时候才会执行。postHandle是进行处理器拦截用的，它的执行时间是在处理器进行处理之 
     * 后，也就是在Controller的方法调用之后执行，但是它会在DispatcherServlet进行视图的渲染之前执行，也就是说在这个方法中你可以对ModelAndView进行操 
     * 作。这个方法的链式结构跟正常访问的方向是相反的，也就是说先声明的Interceptor拦截器该方法反而会后调用，这跟Struts2里面的拦截器的执行过程有点像， 
     * 只是Struts2里面的intercept方法中要手动的调用ActionInvocation的invoke方法，Struts2中调用ActionInvocation的invoke方法就是调用下一个Interceptor 
     * 或者是调用action，然后要在Interceptor之前调用的内容都写在调用invoke之前，要在Interceptor之后调用的内容都写在调用invoke方法之后。 
     */  
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
	
	
	
	  /** 
     * 该方法也是需要当前对应的Interceptor的preHandle方法的返回值为true时才会执行。该方法将在整个请求完成之后，也就是DispatcherServlet渲染了视图执行， 
     * 这个方法的主要作用是用于清理资源的，当然这个方法也只能在当前这个Interceptor的preHandle方法的返回值为true时才会执行。 
     */  
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
	
	
	/**
	 * 判断ajax请求
	 * @param request
	 * @return
	 */
	boolean isAjax(HttpServletRequest request){
	    return  (request.getHeader("X-Requested-With") != null  && "XMLHttpRequest".equals( request.getHeader("X-Requested-With").toString())   ) ;
	}
	
	
	
	
	
//	
//	if(session.getAttribute(Common.USER_SESSION)!=null){
//		String requestUrl=url.substring(url.indexOf("/", 2)+1,url.length());
//		String roleId="";
//		//通过requesturl获取请求的url是否有权限访问
//		List<UserAuthority> ua=this.userAuthorityService.findByUrl(requestUrl);
//		for(UserAuthority ulist:ua){
//			for(UserAuthority ulist2:ulist.getUserAuthorityList()){
//				System.out.println(ulist2.getAuthorUrl());
//				System.out.println(ulist2.getAuthorUrl()==requestUrl);
//					System.out.println(ulist2.getAuthorUrl());
//					if(ulist2.getAuthorUrl().equals(requestUrl)){
//						roleId=ulist2.getParentId();
//				}
//				
//			}
//		}
//		Log.info("当前url的id"+roleId);
//		String nroleId=roleId.substring(roleId.indexOf("_")+1,roleId.length());
//		User usersession=(User) session.getAttribute(Common.USER_SESSION);
//		UserRole role=usersession.getUserRole();
//		for(UserAuthority s:role.getUserRoleAuthority()){
//			for(UserAuthority s2:s.getUserAuthorityList()){
//				System.out.println(s2.getParentId());
//				if(s2.getParentId().equals(nroleId)){
//					System.out.println(nroleId);
//					return true;
//				}
//				Log.info("查询到id"+nroleId);
//			}
//		
//		}
//	}

	

}
