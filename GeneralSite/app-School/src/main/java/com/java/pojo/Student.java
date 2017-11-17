package com.java.pojo;

import org.mongodb.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class Student  extends GeneralBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6257530812107249085L;
	
	
	
	//普通查询
	private String schoolName;//校区
	private String enrollmentYear;//入学年份
	private String classes;//班级
	private String studentName;//学生姓名
	private String studentsex;//学生性别
	private String studentBirthday;//学生生日
	private String permanentAddress;//户籍地址
	private String accountoftheStreet;//户口所属街道
	private String accountCategory;//户口类别
	private String accountProperties;//户口性质
	private String residenceAddress;//居住地址
	private String postcode;//邮政编码
	private String contactPhone;//联系电话
	//高级查询
	private String fatherName;//父亲姓名
	private String fatherEducation;//父亲学历
	private String fatherWorkUnit;//父亲工作单位
	private String fatherPost;//父亲职务
	private String fatherContactPhone;//父亲联系电话
	private String matherName;//母亲姓名
	private String matherEducation;//母亲学历
	private String matherWorkUnit;//母亲工作单位
	private String matherPost;//母亲职务
	private String matherContactPhone;//母亲联系电话
	private String jiedou;//借读
	private String studentIdCard;//学生身份证号码
	private String otherCertificates;//其他证件
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getEnrollmentYear() {
		return enrollmentYear;
	}
	public void setEnrollmentYear(String enrollmentYear) {
		this.enrollmentYear = enrollmentYear;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentsex() {
		return studentsex;
	}
	public void setStudentsex(String studentsex) {
		this.studentsex = studentsex;
	}
	public String getStudentBirthday() {
		return studentBirthday;
	}
	public void setStudentBirthday(String studentBirthday) {
		this.studentBirthday = studentBirthday;
	}
	public String getPermanentAddress() {
		return permanentAddress;
	}
	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}
	public String getAccountoftheStreet() {
		return accountoftheStreet;
	}
	public void setAccountoftheStreet(String accountoftheStreet) {
		this.accountoftheStreet = accountoftheStreet;
	}
	public String getAccountCategory() {
		return accountCategory;
	}
	public void setAccountCategory(String accountCategory) {
		this.accountCategory = accountCategory;
	}
	public String getAccountProperties() {
		return accountProperties;
	}
	public void setAccountProperties(String accountProperties) {
		this.accountProperties = accountProperties;
	}
	public String getResidenceAddress() {
		return residenceAddress;
	}
	public void setResidenceAddress(String residenceAddress) {
		this.residenceAddress = residenceAddress;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getFatherEducation() {
		return fatherEducation;
	}
	public void setFatherEducation(String fatherEducation) {
		this.fatherEducation = fatherEducation;
	}
	public String getFatherWorkUnit() {
		return fatherWorkUnit;
	}
	public void setFatherWorkUnit(String fatherWorkUnit) {
		this.fatherWorkUnit = fatherWorkUnit;
	}
	public String getFatherPost() {
		return fatherPost;
	}
	public void setFatherPost(String fatherPost) {
		this.fatherPost = fatherPost;
	}
	public String getFatherContactPhone() {
		return fatherContactPhone;
	}
	public void setFatherContactPhone(String fatherContactPhone) {
		this.fatherContactPhone = fatherContactPhone;
	}
	public String getMatherName() {
		return matherName;
	}
	public void setMatherName(String matherName) {
		this.matherName = matherName;
	}
	public String getMatherEducation() {
		return matherEducation;
	}
	public void setMatherEducation(String matherEducation) {
		this.matherEducation = matherEducation;
	}
	public String getMatherWorkUnit() {
		return matherWorkUnit;
	}
	public void setMatherWorkUnit(String matherWorkUnit) {
		this.matherWorkUnit = matherWorkUnit;
	}
	public String getMatherPost() {
		return matherPost;
	}
	public void setMatherPost(String matherPost) {
		this.matherPost = matherPost;
	}
	public String getMatherContactPhone() {
		return matherContactPhone;
	}
	public void setMatherContactPhone(String matherContactPhone) {
		this.matherContactPhone = matherContactPhone;
	}
	public String getJiedou() {
		return jiedou;
	}
	public void setJiedou(String jiedou) {
		this.jiedou = jiedou;
	}
	public String getStudentIdCard() {
		return studentIdCard;
	}
	public void setStudentIdCard(String studentIdCard) {
		this.studentIdCard = studentIdCard;
	}
	public String getOtherCertificates() {
		return otherCertificates;
	}
	public void setOtherCertificates(String otherCertificates) {
		this.otherCertificates = otherCertificates;
	}
	
	
	

}
