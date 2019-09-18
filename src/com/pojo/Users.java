package com.pojo;

/**
 * @function 保存用户账号密码 主要用于登录
 * @author 王飞
 * @date 2018-11-27
 */
public class Users {
	private Integer username ;
	private String password="";
	
	public Integer getUsername() {
		return username;
	}
	public void setUsername(Integer username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	
}
