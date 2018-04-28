package com.wper.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Subject implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String name;
    private String type;
    private Timestamp addTime;
    private String info;
    private String imageUrl;

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Timestamp getAddTime() {
        return addTime;
    }

    public void setAddTime(Timestamp addTime) {
        this.addTime = addTime;
    }

    /*addSubject 构造函数*/
    public Subject(String name, String type, String info) {
        this.name = name;
        this.type = type;
        this.info = info;
    }

   /*getAllSub 构造函数*/

    public Subject(String name, String type, Timestamp addTime, String info, String imageUrl) {
        this.name = name;
        this.type = type;
        this.addTime = addTime;
        this.info = info;
        this.imageUrl = imageUrl;
    }

    public Subject(int id, String name, String type, Timestamp addTime, String info, String imageUrl) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.addTime = addTime;
        this.info = info;
        this.imageUrl = imageUrl;
    }
}
