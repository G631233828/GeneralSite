package com.java.pojo;


import java.util.List;

import org.mongodb.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class User extends GeneralBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3206695308667912314L;
	
	private String userName;		//用户姓名
	private String cardType;		//用户证件类型
	private String cardId;			//证件号码
	private String accountName; 	//登录账户
	private String passWord;		//登录密码
	private boolean ishiden;      	//是否禁用
	private String lastLoginTime;       //登录时间
	private String lastLoginIp;		//上次登录Ip
	private String photograph;		//用户头像
	
	@DBRef
	private List<Resource> resource;
	@DBRef
	private Role role;
	
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public boolean isIshiden() {
		return ishiden;
	}
	public void setIshiden(boolean ishiden) {
		this.ishiden = ishiden;
	}
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	public String getPhotograph() {
		return photograph;
	}
	public void setPhotograph(String photograph) {
		this.photograph = photograph;
	}
	public List<Resource> getResource() {
	    return this.resource;
	}
	public void setResource(List<Resource> resource) {
	    this.resource = resource;
	}
	public Role getRole() {
	    return this.role;
	}
	public void setRole(Role role) {
	    this.role = role;
	}
	
	
	
}
