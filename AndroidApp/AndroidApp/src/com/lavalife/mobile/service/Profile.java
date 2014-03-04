package com.lavalife.mobile.service;
/**
 * Model to represent lavalife Profile 
 * 
 * @author Jeff Yang
 *
 */
public class Profile {
    String nickname;
    String state;
    int jurisdictionId;
    String openingline;
    int yearsOld;
    String imow;
    boolean online;
    String bodyType;
    String picture; //"2014/02/20/11/13929146378215189.jpeg",
    int height; //65 inch
    int userId;
    String location;

    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public int getJurisdictionId() {
        return jurisdictionId;
    }
    public void setJurisdictionId(int jurisdictionId) {
        this.jurisdictionId = jurisdictionId;
    }
    public String getOpeningline() {
        return openingline;
    }
    public void setOpeningline(String openingline) {
        this.openingline = openingline;
    }
    public int getYearsOld() {
        return yearsOld;
    }
    public void setYearsOld(int yearsOld) {
        this.yearsOld = yearsOld;
    }
    public String getImow() {
        return imow;
    }
    public void setImow(String imow) {
        this.imow = imow;
    }
  
    public boolean isOnline() {
        return online;
    }
    public void setOnline(boolean online) {
        this.online = online;
    }
    public String getBodyType() {
        return bodyType;
    }
    public void setBodyType(String bodyType) {
        this.bodyType = bodyType;
    }
    public String getPicture() {
        return picture;
    }
    public void setPicture(String picture) {
        this.picture = picture;
    }
    public int getHeight() {
        return height;
    }
    public void setHeight(int height) {
        this.height = height;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    } 

    public String getPictureUrl() {
        String largePicture = picture.replaceAll("\\.jpeg", "l\\.jpeg");
        //return "http://www.lavalife.com/pictures/thumb/" + picture + "l.jpeg"; 
        return "http://www.lavalife.com/pictures/thumb/" + largePicture; 
    }

    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
   
    

    
    
}
