package com.pojo;

public class Recorder_info {
	private Integer recorder_id ;
	private String recorder_name;
	private Integer singer_id;
	private Integer recorder_time;
	private String recorder_desc;
	private String recorder_img ;
	private String wav_url ;
	private String user_realname;
	
	public String getUser_realname() {
		return user_realname;
	}
	public void setUser_realname(String user_realname) {
		this.user_realname = user_realname;
	}
	public Integer getRecorder_id() {
		return recorder_id;
	}
	public void setRecorder_id(Integer recorder_id) {
		this.recorder_id = recorder_id;
	}
	public String getRecorder_name() {
		return recorder_name;
	}
	public void setRecorder_name(String recorder_name) {
		this.recorder_name = recorder_name;
	}
	public Integer getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(Integer singer_id) {
		this.singer_id = singer_id;
	}
	public Integer getRecorder_time() {
		return recorder_time;
	}
	public void setRecorder_time(Integer recorder_time) {
		this.recorder_time = recorder_time;
	}
	public String getRecorder_desc() {
		return recorder_desc;
	}
	public void setRecorder_desc(String recorder_desc) {
		this.recorder_desc = recorder_desc;
	}
	public String getRecorder_img() {
		return recorder_img;
	}
	public void setRecorder_img(String recorder_img) {
		this.recorder_img = recorder_img;
	}
	public String getWav_url() {
		return wav_url;
	}
	public void setWav_url(String wav_url) {
		this.wav_url = wav_url;
	}
}
