package com.pojo;

import java.util.Date;

public class Singer_info {
	private Integer singer_id;
	private String singer_name;
	private Date singer_borndate;
	private String singer_location;
	private String singer_desc;
	private String singer_img;
	private Integer singer_visits;
	
	public Integer getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(Integer singer_id) {
		this.singer_id = singer_id;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
	public Date getSinger_borndate() {
		return singer_borndate;
	}
	public void setSinger_borndate(Date singer_borndate) {
		this.singer_borndate = singer_borndate;
	}
	public String getSinger_location() {
		return singer_location;
	}
	public void setSinger_location(String singer_location) {
		this.singer_location = singer_location;
	}
	public String getSinger_desc() {
		return singer_desc;
	}
	public void setSinger_desc(String singer_desc) {
		this.singer_desc = singer_desc;
	}
	public String getSinger_img() {
		return singer_img;
	}
	public void setSinger_img(String singer_img) {
		this.singer_img = singer_img;
	}
	public Integer getSinger_visits() {
		return singer_visits;
	}
	public void setSinger_visits(Integer singer_visits) {
		this.singer_visits = singer_visits;
	}
	
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.singer_id;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Singer_info){
			if(((Singer_info)obj).getSinger_id().intValue() == this.singer_id.intValue()){
				return true;
			}
		}
		return false;
	}
}
