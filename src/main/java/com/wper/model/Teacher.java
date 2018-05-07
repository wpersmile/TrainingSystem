package com.wper.model;

import java.io.Serializable;

public class Teacher implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String name;
    private String introduce;
    private String pic;

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

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Teacher(int id, String name, String introduce, String pic) {
        this.id = id;
        this.name = name;
        this.introduce = introduce;
        this.pic = pic;
    }

    public Teacher(String name, String introduce, String pic) {
        this.name = name;
        this.introduce = introduce;
        this.pic = pic;
    }
}
