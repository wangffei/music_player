package com.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.pojo.UserInfo;
import com.pojo.Users;
import com.util.DbUtil;

/**
 * @function 用于处理用户登录注册
 * @author 王飞
 * @date 2018-11-27
 */
public class UserDao {

	public static boolean doLogin(String username, String password) {
		String sql = "select username , password from users where username=? and password=?";
		
		List<Users> list = DbUtil.selectInfo(Users.class, sql, username , password);
		
		if(list.size() > 0){
			return true;
		}
		
		return false;
	}

	public static String doRegist(String name, String password,
			String birthday, String local, String gexing, String code) {
		String sql = "insert into users(password) values(?)";
		
		int count = DbUtil.updateInfo_key(sql, password);
		
		if(count != 0){
			String username = Integer.toString(count);
			
			//System.out.println(username);
			
			sql = "insert into userinfo(username , user_realname , user_born_date , user_location , user_qianming , user_level , user_date) values(?,?,?,?,?,?,?)";
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String dateString = sdf.format(date);
			
			count = DbUtil.updateInfo(sql, username , name , birthday , local , gexing , 1 , dateString);
			
			if(count != 0){
				return username;
			}else{
				sql = "delete from users where username = ?";
				DbUtil.updateInfo(sql, username);
			}
		}
		
		return null;
	}
	
	//获取头像
	public static String getPic(String username) {
		String sql = "select user_img from userinfo where username=?";
		
		List<UserInfo> list = DbUtil.selectInfo(UserInfo.class, sql, username);
		
		if(list.size() > 0){
			return list.get(0).getUser_img();
		}
		return null;
	}

}
