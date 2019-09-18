package com.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MusicDao;
import com.dao.WriteHTML;

public class YYMusicServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method=request.getParameter("method");
		//System.out.println(method);
		if("music".equals(method)){
			musicPlay(request , response);
		}
//		if("getmusicword".equals(method)){
//			getLRC(request , response);
//		}
		if("singer".equals(method)){
			singer_detail(request , response);
		}
		if("zhuanji".equals(method)){
			zhuanji_detail(request , response);
		}
		if("singer_temp".equals(method)){
			singer_temp(request , response);
		}
		if("zhuanji_temp".equals(method)){
			zhuanji_temp(request , response);
		}
		if("gedan".equals(method)){
			gedan_detail(request , response);
		}
		if("gedan_temp".equals(method)){
			gedan_temp(request , response);
		}
		if("hotPlay".equals(method)){ //请求网易云音乐地址时
			hotPlay(request , response);
		}
	}
	
	private void hotPlay(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String data = MusicDao.get163Music(id);
		response.getWriter().print(data);
	}

	private void gedan_temp(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String gedan_url = request.getParameter("gedan_url");
		String[] parts = gedan_url.split("/");
		String fileName = request.getServletContext().getRealPath("gedan/"+parts[parts.length - 1]);
		String data = MusicDao.getGedanDetail(gedan_url);
		response.getWriter().print(data);
		WriteHTML.writeToFile_gedan(data, fileName);
	}

	//在搜索页面访问外网歌单时进行转发
	private void gedan_detail(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String gedan_url = request.getParameter("gedan_url");
		String[] parts = gedan_url.split("/");
		String fileName = request.getServletContext().getRealPath("gedan/"+parts[parts.length - 1]);
		if(new File(fileName).exists()){
			response.sendRedirect("gedan/"+parts[parts.length - 1]);
		}else{
			request.setAttribute("gedan_url", gedan_url);
			request.getRequestDispatcher("gedan_detail_yy.jsp").forward(request, response);
		}
	}

	//没有该专辑静态页面时临时利用爬虫抓取资源
	private void zhuanji_temp(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String zhuanji_url = request.getParameter("zhuanji_url");
		String data = MusicDao.zhuanjiDetal(zhuanji_url);
		response.getWriter().print(data);
		String[] parts = zhuanji_url.split("/");
		String fileName = request.getServletContext().getRealPath("zhuanji/"+parts[parts.length - 1]) ;
		WriteHTML.writeToFile_zhuanji(data, fileName);
	}
	
	//没有该歌手静态页面时临时利用爬虫抓取资源
	private void singer_temp(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String singer_url = request.getParameter("singer_url");
		String data = MusicDao.singerDetail(singer_url);
		response.getWriter().print(data);
		String[] files = singer_url.split("/");
		String filePath = request.getServletContext().getRealPath("singer/"+files[files.length - 1]);
		WriteHTML.writeToFile_singer(data, filePath);
	}
	
	//在搜索页面访问外网专辑时进行转发
	private void zhuanji_detail(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String zhuanji_url = request.getParameter("zhuanji_url");
		String[] parts = zhuanji_url.split("/");
		String filePath = request.getServletContext().getRealPath("zhuanji/"+parts[parts.length - 1]);
		response.setContentType("text/html;charset=utf-8");
		if(new File(filePath).exists()){
			response.sendRedirect("zhuanji/"+parts[parts.length - 1]);
		}else{
			request.setAttribute("zhuanji_url", zhuanji_url);
			request.getRequestDispatcher("zhuanji_detail_yy.jsp").forward(request, response);
		}
	}
	
	//在搜索页面访问外网时进行转发
	private void singer_detail(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String singer_url = request.getParameter("singer_url");
		String[] datas = singer_url.split("/");
		File path = new File(request.getServletContext().getRealPath("singer/"+datas[datas.length - 1]));
		response.setContentType("text/html;charset=utf-8");
		if(path.exists()){
			response.sendRedirect("singer/"+datas[datas.length - 1]);
		}else{
			request.setAttribute("singer_url", singer_url);
			request.getRequestDispatcher("singer_detail_yy.jsp").forward(request, response);
		}
	}
	
	//歌词获取
//	private void getLRC(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String lrc_url = request.getParameter("lrc_url");
//		//System.out.println(lrc_url);
//		response.setContentType("text/html;charset=utf-8");
//		response.getWriter().print(MusicDao.getLrc_yy(lrc_url));
//	}
	
	//搜索页面访问某一首歌曲
	/**
	 * ["status":"1","data":{"song_name":"","lyrics":"","author_name":"","play_url":"","img":""}]
	 */
	private void musicPlay(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String music_url = request.getParameter("music_url");
		String hash = request.getParameter("hash");
		String time = request.getParameter("time");
		String data = MusicDao.getMusic_data(music_url+"&hash="+hash);
		data = data.replaceAll("\\\\r\\\\n", "");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("["+data+"]");
	}
}
