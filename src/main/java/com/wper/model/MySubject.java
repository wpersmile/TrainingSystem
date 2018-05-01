package com.wper.model;

import java.io.Serializable;

public class MySubject implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String userPhone;
    private String subName;
    private String addTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public MySubject(int id, String userPhone, String subName, String addTime) {
        this.id = id;
        this.userPhone = userPhone;
        this.subName = subName;
        this.addTime = addTime;
    }

    public MySubject(String userPhone, String subName) {
        this.userPhone = userPhone;
        this.subName = subName;
    }
}
