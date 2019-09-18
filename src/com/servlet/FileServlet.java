package com.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pojo.UserInfo;
import com.util.DbUtil;
import com.util.Upload;

public class FileServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String,String> map = Upload.upload(request, 1024*1024*10, this.getServletContext().getResource("recorder/image").getFile());
		
		String img = map.get("img");
		String title = map.get("title");
		String desc = map.get("desc");
		Long time = new Date().getTime();
		
		String sql = "insert into recorder_playing(_name,username,_desc,img,filename) values(?,?,?,?,?)";
		
		Integer key = DbUtil.updateInfo_key(sql, title,request.getSession().getAttribute("username"),desc,img,request.getSession().getAttribute("username")+""+time);
		sql = "select user_realname from userinfo where username=?";
		List<UserInfo> user = DbUtil.selectInfo(UserInfo.class, sql, request.getSession().getAttribute("username"));
		
		request.getSession().setAttribute("recorder", request.getSession().getAttribute("username")+""+time);
		request.getSession().setAttribute("key", key);
		request.setAttribute("title", title);
		request.setAttribute("desc", desc);
		request.setAttribute("img", img);
		request.setAttribute("filename", request.getSession().getAttribute("username")+""+time);
		request.setAttribute("singer_name", user.get(0).getUser_realname());
		request.getRequestDispatcher("recorder.jsp").forward(request, response);
	}
}
