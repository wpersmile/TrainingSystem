package com.wper.model;

import java.io.Serializable;

public class Video implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String vid;
    private String name;
    private String type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
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

    public Video(int id, String vid, String name, String type) {
        this.id = id;
        this.vid = vid;
        this.name = name;
        this.type = type;
    }

    public Video(String vid, String name, String type) {
        this.vid = vid;
        this.name = name;
        this.type = type;
    }
}
