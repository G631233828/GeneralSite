package com.java.controller;


import java.io.PrintWriter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fail")
public class NoPromissionController {

  	@RequestMapping("/nopromission")
	public String nopromission(PrintWriter writer){
		
		
		return "author";
		
	}
  	@RequestMapping("/error")
  	public String error(PrintWriter writer){
  		
  		
  		return "error";
  		
  	}
  	
	@RequestMapping("/nopage")
	public String nopage(PrintWriter writer){
		
		
		return "404";
		
	}
}
