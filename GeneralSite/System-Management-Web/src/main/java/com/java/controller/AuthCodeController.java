package com.java.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.util.captcha.Captcha;
import com.java.util.captcha.GifCaptcha;


/***
 * 生成验证码的类
 * @author fliay
 *
 */
@Controller
@RequestMapping("/authCode")
public class AuthCodeController {
	private static final Logger log =LoggerFactory.getLogger(AuthCodeController.class);
	
	/***
	 * 获取验证码GIF
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/getGifCode",method=RequestMethod.GET)
	public void getGifCode(HttpServletRequest request, HttpServletResponse response){
		try{	
		response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("imge/gif");
			/**
			 * gif格式动画验证码
			 * 高，宽，位数
			 */
			Captcha captcha=new GifCaptcha(95,30,4);
			//输出
			captcha.out(response.getOutputStream());
			HttpSession session = request.getSession(true);
			//存入session
			session.setAttribute("_code", captcha.text().toLowerCase());
			System.out.println(captcha.text().toLowerCase());
		}catch(Exception e){
			e.printStackTrace();
			
		}
	
	
	
	
	
	
	
	}
	
	
}
