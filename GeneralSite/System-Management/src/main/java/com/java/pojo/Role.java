package com.java.pojo;


import java.util.List;

import org.mongodb.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 用户角色
 * 
 * @author fliay
 *
 */
@Document
public class Role extends GeneralBean {
	/**
	 * 
	 */
	private static final long serialVersionUID = -9180507092289373603L;
	private String roleName; // 角色名称
	private String roleKey; // 角色key
	private String description; // 角色描述
	@DBRef
	private List<Resource> resource;
	private boolean ishiden; // 是否禁用


	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleKey() {
		return roleKey;
	}

	public void setRoleKey(String roleKey) {
		this.roleKey = roleKey;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isIshiden() {
		return ishiden;
	}

	public void setIshiden(boolean ishiden) {
		this.ishiden = ishiden;
	}

	public List<Resource> getResource() {
		return resource;
	}

	public void setResource(List<Resource> resource) {
		this.resource = resource;
	}
	
	

}
