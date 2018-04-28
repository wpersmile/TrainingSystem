package com.wper.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Files implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String name;
    private String url;
    private String type;
    private Timestamp addTime;

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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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


    public Files(int id, String name, String url, String type, Timestamp addTime) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.type = type;
        this.addTime = addTime;
    }

    public Files(String name, String url, String type, Timestamp addTime) {
        this.name = name;
        this.url = url;
        this.type = type;
        this.addTime = addTime;
    }

    public Files(String name, String url, String type) {
        this.name = name;
        this.url = url;
        this.type = type;

    }
}
