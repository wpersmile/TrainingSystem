package com.wper.model;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 用户
 */
public class User implements Serializable {

   private static final long serialVersionUID = 1L;
    /**
    /**
     * id
     */
    private  int id;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 密码
     */
    private String password;
    /**
     * 姓名
     */
    private String name;
    /**
     * 性别
     */
    private String sex;
    /**
     * 个人介绍
     */
    private String introduce;
    /**
     * 注册时间
     */
    private Timestamp regTime;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 用户类型 0-管理  1-用户
     */
    private int type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Timestamp getRegTime() {
        return regTime;
    }

    public void setRegTime(Timestamp regTime) {
        this.regTime = regTime;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User(String phone, String password) {
        this.phone = phone;
        this.password = password;
    }

    public User(String phone, String password, String email) {
        this.phone = phone;
        this.password = password;
        this.email = email;
    }

    public User(String name, String sex, String introduce,String phone) {
        this.name = name;
        this.sex = sex;
        this.introduce = introduce;
        this.phone = phone;
    }

    public User(String name, String sex, String phone, String email, String introduce) {
        this.phone = phone;
        this.name = name;
        this.sex = sex;
        this.introduce = introduce;
        this.email = email;
    }

    public User(String phone, String password, String name, String sex, String introduce, Timestamp regTime, String email) {
        this.phone = phone;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.introduce = introduce;
        this.regTime = regTime;
        this.email = email;
    }

    public User(int id, String phone, String password, String name, String sex, String introduce, Timestamp regTime, String email) {
        this.id = id;
        this.phone = phone;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.introduce = introduce;
        this.regTime = regTime;
        this.email = email;
    }


    /* getAllUser构造函数 */
    public User(int id, String phone, String name, String sex, String email, int type, Timestamp regTime) {
        this.id = id;
        this.phone = phone;
        this.name = name;
        this.sex = sex;
        this.regTime = regTime;
        this.email = email;
        this.type = type;
    }
}
