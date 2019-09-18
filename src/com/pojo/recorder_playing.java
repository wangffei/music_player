package com.pojo;

public class recorder_playing {
	private Integer id;
	private String _name;
	private String _desc;
	private String img;
	private Integer username;
	private String filename;
	private String user_realname;
	
	public String getUser_realname() {
		return user_realname;
	}
	public void setUser_realname(String user_realname) {
		this.user_realname = user_realname;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String get_name() {
		return _name;
	}
	public void set_name(String _name) {
		this._name = _name;
	}
	public String get_desc() {
		return _desc;
	}
	public void set_desc(String _desc) {
		this._desc = _desc;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Integer getUsername() {
		return username;
	}
	public void setUsername(Integer username) {
		this.username = username;
	}
}
