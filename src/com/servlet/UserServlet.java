package com.servlet;

import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.validator.constraints.Length;

import com.dao.MusicDao;
import com.dao.UserDao;
import com.util.Base64Util;

/**
 * @function 处理用户登录注册和获取歌曲列表
 * @author 王飞
 * @date 2018-11-27
 */
public class UserServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		//处理获取歌曲列表方法
//		if("getmusic_list".equals(method)){
//			doGetMusicList(request , response);
//		}
		//处理登录方法
		if("login".equals(method)){
			doLogin(request , response);
		}
		//处理注册方法
		if("regist".equals(method)){
			doRegist(request , response);
		}
		//处理获取头像方法
		if("getpic".equals(method)){
			getPic(request , response);
		}
		//处理注销登录方法
		if("close".equals(method)){
			doClose(request	, response);
		}
	}
	
	private void doClose(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.getSession().setAttribute("username", null);
		response.sendRedirect("login.html");
	}

	//获取头像的方法
	private void getPic(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = (String)request.getSession().getAttribute("username");
		response.setContentType("png");
		
		byte[] data = new byte[1024];
		
		String filePath = request.getServletContext().getRealPath("./img/"+UserDao.getPic(username));
		
		FileInputStream inputStream = new FileInputStream(filePath);
		
		int len = 0;
		while((len = inputStream.read(data)) != -1){
			response.getOutputStream().write(data, 0, len);
		}
	}
	
	//注册
	private void doRegist(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String password = Base64Util.decode(request.getParameter("password"));
		String birthday = Base64Util.decode(request.getParameter("birthday"));
		String local = request.getParameter("local");
		String gexing = request.getParameter("gexing");
		String code = Base64Util.decode(request.getParameter("code"));
		
		if(name == null || name.trim().length() ==0 ){
			response.getWriter().print("[{\"status\":\"184\",\"error\":\"ERROR_NAME_EMPTY\"}]");
			return;
		}else if(password == null || password.trim().length() ==0){
			response.getWriter().print("[{\"status\":\"185\",\"error\":\"ERROR_PASSWORD_EMPTY\"}]");
			return;
		}else if(birthday == null || birthday.trim().length()==0){
			response.getWriter().print("[{\"status\":\"186\",\"error\":\"ERROR_BIRTHDAY_EMPTY\"}]");
			return;
		}else if(!request.getSession().getAttribute("code").toString().equalsIgnoreCase(code.trim())){
			response.getWriter().print("[{\"status\":\"187\",\"error\":\"ERROR_CODE\"}]");
			return;
		}
		
		String username = UserDao.doRegist(name , password , birthday , local , gexing , code);
		
		if(username == null){
			response.getWriter().print("[{\"status\":\"188\",\"error\":\"ERROR_FAILD\"}]");
			return;
		}else{
			response.getWriter().print("[{\"status\":\"200\",\"username\":\""+username+"\"}]");
			return;
		}
	}
	
	//登录
	private void doLogin(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String username = Base64Util.decode(request.getParameter("username"));
		String password = Base64Util.decode(request.getParameter("password"));
		String code = Base64Util.decode(request.getParameter("code"));
		
		//System.out.println(request.getSession().getAttribute("code"));
		if(!request.getSession().getAttribute("code").toString().equalsIgnoreCase(code)){
			response.getWriter().print("[{\"status\":\"180\",\"error\":\"CODE_ERROR\"}]");
			return;
		}else if(password == null || password.length() ==0){
			response.getWriter().print("[{\"status\":\"183\",\"error\":\"ERROR_PASSWORD_EMPTY\"}]");
			return;
		}else if(username == null || username.length() ==0){
			response.getWriter().print("[{\"status\":\"182\",\"error\":\"ERROR_USERNAME_EMPTY\"}]");
			return;
		}
		
		if(UserDao.doLogin(username , password)){
			response.getWriter().print("[{\"status\":\"200\"}]");
			request.getSession().setAttribute("username", username);
			return;
		}else{
			response.getWriter().print("[{\"status\":\"181\",\"error\":\"ERROR_PASSWORD\"}]");
			return;
		}
	}
	
	//获取歌单
//	private void doGetMusicList(HttpServletRequest request,
//			HttpServletResponse response) throws IOException {
//		String username = request.getParameter("username");
//		
//		username = new String(username.getBytes("iso-8859-1"), "utf-8");
//		
//		response.getWriter().print(MusicDao.getMusicList(username));
//	}
}
