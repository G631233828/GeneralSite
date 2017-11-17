package com.java.pojo;

import org.mongodb.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class School extends GeneralBean {
    /**
     * 
     */
    private static final long serialVersionUID = 9121431790233168966L;
    private String name; // 学校名称
    private String address; // 地址
    private String mobile; // 联系电话
    private String website; // 学校官网
    private String accountName; // 登录帐号
    private String password; // 登录密码
    private String webkey; // 学校关键字
    private boolean ishiden;//使用状态
    
    
    
    
    

    public String getName() {
	return this.name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getAddress() {
	return this.address;
    }

    public void setAddress(String address) {
	this.address = address;
    }

    public String getMobile() {
	return this.mobile;
    }

    public void setMobile(String mobile) {
	this.mobile = mobile;
    }

    public String getWebsite() {
	return this.website;
    }

    public void setWebsite(String website) {
	this.website = website;
    }

    public String getAccountName() {
	return this.accountName;
    }

    public void setAccountName(String accountName) {
	this.accountName = accountName;
    }

    public String getPassword() {
	return this.password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    public String getWebkey() {
	return this.webkey;
    }

    public void setWebkey(String webkey) {
	this.webkey = webkey;
    }

    public boolean isIshiden() {
        return this.ishiden;
    }

    public void setIshiden(boolean ishiden) {
        this.ishiden = ishiden;
    }

}
