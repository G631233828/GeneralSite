package com.java.FileSystem.pojo;

import org.mongodb.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 
 * @ClassName: FileType
 * @Description: TODO(文件类型类)
 * @author fliay
 * @date 2017年10月26日 上午9:52:05
 *
 */
@Document
public class FileType extends GeneralBean {

	private static final long serialVersionUID = -5185807671424870851L;

	private String suffixName; // 文件后缀名
	@DBRef
	private FileTypeName fileTypeName; // 文件类型1.图片 2.压缩文件 3.音乐文件 4.视频资源 5.文档
	private String imgName; // 文件图标
	private String imgPath; // 图片路径
	private boolean disable; // 是否禁用
	private String description; // 描述
	public String getSuffixName() {
		return suffixName;
	}
	public void setSuffixName(String suffixName) {
		this.suffixName = suffixName;
	}
	public FileTypeName getFileTypeName() {
		return fileTypeName;
	}
	public void setFileTypeName(FileTypeName fileTypeName) {
		this.fileTypeName = fileTypeName;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public boolean isDisable() {
		return disable;
	}
	public void setDisable(boolean disable) {
		this.disable = disable;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}



}
