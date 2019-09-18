package com.pojo;

import java.util.Date;

public class Zhuanji_info {
	private Integer zhuanji_id;
	private Integer singer_id;
	private String zhuanji_name;
	private Date zhuanji_date;
	private String zhuanji_img;
	private String visitis;
	private String singer_name;
	private String location ;
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
	public Integer getZhuanji_id() {
		return zhuanji_id;
	}
	public void setZhuanji_id(Integer zhuanji_id) {
		this.zhuanji_id = zhuanji_id;
	}
	public Integer getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(Integer singer_id) {
		this.singer_id = singer_id;
	}
	public String getZhuanji_name() {
		return zhuanji_name;
	}
	public void setZhuanji_name(String zhuanji_name) {
		this.zhuanji_name = zhuanji_name;
	}
	public Date getZhuanji_date() {
		return zhuanji_date;
	}
	public void setZhuanji_date(Date zhuanji_date) {
		this.zhuanji_date = zhuanji_date;
	}
	public String getZhuanji_img() {
		return zhuanji_img;
	}
	public void setZhuanji_img(String zhuanji_img) {
		this.zhuanji_img = zhuanji_img;
	}
	public String getVisitis() {
		return visitis;
	}
	public void setVisitis(String visitis) {
		this.visitis = visitis;
	}
}
