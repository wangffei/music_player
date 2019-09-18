package com.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.dao.SearchDao;

public class SearchServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("search".equals(method)){
			doSearch(request , response);
		}
		if("entry".equals(method)){
			getOtherserviceData(request , response);
		}
		if("jump".equals(method)){
			doJump(request , response);
		}
		if("music".equals(method)){
			getMusic(request , response);
		}
		if("page".equals(method)){
			doPage(request , response);
		}
//		if("singer_jump".equals(method)){
//			singer_jump(request , response);
//		}
//		if("zhuanji_jump".equals(method)){
//			zhuanji_jump(request , response);
//		}
		if("zhuanji".equals(method)){
			getZhaunji(request , response);
		}
//		if("singer".equals(method)){
//			getSinger(request , response);
//		}
		if("recorder".equals(method)){
			recorder_music(request , response);
		}
	}

	private void recorder_music(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String key = request.getParameter("value");
		if(key != null){
			key = new String(key.getBytes("iso-8859-1"),"utf-8");
		}
		String data = SearchDao.getMusic_list(key);
		//System.out.println(data);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(data);
	}

//	private void getSinger(HttpServletRequest request,
//			HttpServletResponse response) throws IOException {
//		String key  =request.getParameter("key");
//		String page = request.getParameter("page");	
//		if(key != null){
//			key = new String(key.getBytes("iso-8859-1"),"utf-8");
//		}
//		String data = SearchDao.getSinger(key , page);
//		response.setContentType("text/html;charset=utf-8");
//		if(data == null){
//			response.getWriter().print("ERROR");
//			return;
//		}
//		//System.out.println(data.replaceAll("'", "\""));
//		response.getWriter().print(data);
//	}

	private void getZhaunji(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String key = request.getParameter("key");
		String page = request.getParameter("page");
		if(key != null){
			key = new String(key.getBytes("iso-8859-1"),"utf-8");
		}
		String data = SearchDao.getZhuanji(key,page);
		response.setContentType("text/html;charset=utf-8");
		if(data == null){
			response.getWriter().print("ERROR");
			return;
		}
	//	System.out.println(data);
		response.getWriter().print(data);
	}

//	private void zhuanji_jump(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		String zhuanji_url = request.getParameter("zhuanji_url");
//		String zhuanji_name = request.getParameter("zhuanji_name");
//		if(zhuanji_name != null){
//			zhuanji_name = new String(zhuanji_name.getBytes("iso-8859-1"),"utf-8");
//		}
//		request.setAttribute("zhuanji_url", zhuanji_url);
//		request.setAttribute("zhuanji_name", zhuanji_name);
//		request.getRequestDispatcher("zhuanji_detail_yy.jsp").forward(request, response);
//	}

//	private void singer_jump(HttpServletRequest request,
//			HttpServletResponse response) throws IOException, ServletException {
//		String singer_img = request.getParameter("singer_img");
//		String singer_url = request.getParameter("singer_url");
//		request.setAttribute("singer_img", singer_img);
//		request.setAttribute("singer_url", singer_url);
//		request.getRequestDispatcher("singer_detail_yy.jsp").forward(request, response);
//	}

	private void doPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String keyword = request.getParameter("key");
		String tp = request.getParameter("tp");
		if(keyword != null){
			keyword = new String(keyword.getBytes("iso-8859-1"),"utf-8");
		}
		response.setContentType("text/html;charset=utf-8");
		if("1".equals(tp)){
			JSONObject object = SearchDao.getPages(keyword,tp);
			response.getWriter().print(object.toString());
			return;
		}	
		if("2".equals(tp)){
			String data = SearchDao.getZhuanji_pages(keyword);
			response.getWriter().print(data);
			return;
		}
		if("3".equals(tp)){
			String data = SearchDao.getSinger_pages(keyword);
			response.getWriter().print(data);
			return;
		}
	}

	private void getMusic(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("key");
		String pages = request.getParameter("pages");
		String flag = request.getParameter("flag");
		if(keyword != null){
			keyword = new String(keyword.getBytes("iso-8859-1"),"utf-8");
		}
		//System.out.println(keyword);
		String json = SearchDao.getMusic(keyword,pages,flag);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(json);
	}

	private void doJump(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		if(keyword != null && !keyword.trim().equals("")){
			keyword = new String(keyword.getBytes("iso-8859-1"),"utf-8");
		}else{
			keyword = "ERROR";
		}
		request.setAttribute("key", keyword);
		request.getRequestDispatcher("search.jsp").forward(request, response);
	}

	private void getOtherserviceData(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String keyword = request.getParameter("key");
		String page = request.getParameter("page");
		String tp = request.getParameter("tp");
		if(keyword != null){
			keyword = new String(keyword.getBytes("iso-8859-1"),"utf-8");
		}
		String path = this.getServletContext().getRealPath("process");
		//System.out.println("python "+path+"/getMusic.py "+keyword+" "+tp+" "+page+"");
		Process process = Runtime.getRuntime().exec("python "+path+"\\getMusic.py "+keyword+" "+tp+" "+page+"", null, new File(path));
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer("[");
		while((line = br.readLine()) != null){
			buf.append(line);
		}
		//System.out.println(buf.replace(buf.length()-1, buf.length(), "]"));
		response.setContentType("text/html;charset=utf-8;");
		response.getWriter().print("<script>console.log(eval("+buf.replace(buf.length()-1, buf.length(), "]")+"))</script>");
	}

	private void doSearch(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String key = request.getParameter("key");
		if(key != null && key.trim().length() != 0){
			key = new String(key.getBytes("iso-8859-1"),"utf-8");
		}
		String data = SearchDao.doSearch(key);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(data);
	}
}
