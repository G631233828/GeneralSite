package com.java.pojo;

import java.util.List;

import org.mongodb.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Clazzes extends GeneralBean {

    /**
     * 
     */
    private static final long serialVersionUID = -1151165767494158740L;
    private String classRoom;
    private String classTeacher;
    @DBRef
    private List<Student> student;
    public String getClassRoom() {
        return this.classRoom;
    }
    public void setClassRoom(String classRoom) {
        this.classRoom = classRoom;
    }
    public String getClassTeacher() {
        return this.classTeacher;
    }
    public void setClassTeacher(String classTeacher) {
        this.classTeacher = classTeacher;
    }
    public List<Student> getStudent() {
        return this.student;
    }
    public void setStudent(List<Student> student) {
        this.student = student;
    }

    
}
