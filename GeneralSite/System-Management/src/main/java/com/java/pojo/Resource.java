package com.java.pojo;


import org.mongodb.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Resource extends GeneralBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3346573514451738597L;
	private String name; // 资源名称
	private String parentId; // 父目录id 没有父目录则为0
	private String resKey; // 资源key
	private int type; // 资源类型 0 表示目录 1表示菜单链接 2表示操作功能（添加删除修改）
	private String resUrl; // 资源链接
	private String icon; // 资源图标
	private boolean ishiden; // 是否隐藏
	private String description; // 资源描述


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getResKey() {
		return resKey;
	}

	public void setResKey(String resKey) {
		this.resKey = resKey;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getResUrl() {
		return resUrl;
	}

	public void setResUrl(String resUrl) {
		this.resUrl = resUrl;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public boolean isIshiden() {
		return ishiden;
	}

	public void setIshiden(boolean ishiden) {
		this.ishiden = ishiden;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
