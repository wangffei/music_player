package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.sampled.LineUnavailableException;

import com.dao.MusicDao;
import com.util.Base64Util;

/**
 * 
 * @author Administrator
 *
 */
public class MusicServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		if("getmusicword".equals(method)){
			doGetMusicWord(request , response);
		}
		if("musicplay".equals(method)){
			try {
				doGetMusicSource(request , response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if("getmylist".equals(method)){//获取自定义歌单
			getMyList(request , response);
		}
		if("collection".equals(method)){//加入自定义
			doCollectionAdd(request , response);
		}
		if("deletecollection".equals(method)){//删除自定义歌单中的歌曲
			deleteCollection(request , response);
		}
	}
	
	private void deleteCollection(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String music_url = request.getParameter("music_url");
		if(MusicDao.deleteCollection((String)request.getSession().getAttribute("username") , music_url)){
			response.getWriter().print("200");
		}else{
			response.getWriter().print("ERROR");
		}
	}

	private void doCollectionAdd(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//&music_name="+n+"&music_url="+u+"&zhuanji_name="+z+"&singer_name="+s+"&singer_img="+i+"&time="+t
		String music_url = request.getParameter("music_url")+"&id="+request.getParameter("id");
		String music_name = request.getParameter("music_name");
		String zhuanji_name = request.getParameter("zhuanji_name");
		String singer_name = request.getParameter("singer_name");
		String singer_img = request.getParameter("singer_img");
		String time = request.getParameter("time");
		//处理乱码
		if(music_name != null){
			music_name = new String(music_name.getBytes("iso-8859-1") , "utf-8");
		}
		if(singer_name != null){
			singer_name = new String(singer_name.getBytes("iso-8859-1") , "utf-8");
		}
		if(zhuanji_name != null){
			zhuanji_name = new String(zhuanji_name.getBytes("iso-8859-1") , "utf-8");
		}
		
		if(MusicDao.addCollection((String)request.getSession().getAttribute("username") , music_url , music_name , singer_img , singer_name , time ,zhuanji_name)){
			response.getWriter().print("200");
		}else{
			response.getWriter().print("ERROR");
		}
	}

	private void getMyList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String data = MusicDao.getMyCollectionList((String)request.getSession().getAttribute("username"));
		if(data != null){
			response.getWriter().print(data);
		}else{
			response.getWriter().print("ERROR");
		}
	}

	private void doGetMusicSource(HttpServletRequest request,
			HttpServletResponse response) throws IOException, LineUnavailableException {
		String singer_id = request.getParameter("singer_id");
		String music_id = request.getParameter("music_id");
		String username = (String)request.getSession().getAttribute("username");
		if(username == null || music_id == null || singer_id == null){
			response.getWriter().print("<script>alert('怎么回事小老弟')</script>");
			return;
		}
		//System.out.println("laile");
		singer_id = Base64Util.decode(singer_id);
		music_id = Base64Util.decode(music_id);
		if(MusicDao.isExists(singer_id , music_id)){
			response.setContentType("mp3");
			String filePath = request.getServletContext().getRealPath("music/"+music_id+".mp3");
			File file = new File(filePath);
			if(file.exists()){
				byte[] data = new byte[1024*30];
				int len = 0;
				FileInputStream in = new FileInputStream(file);
				OutputStream out = response.getOutputStream();
				while((len = in.read(data)) != -1){
					out.write(data , 0 , len);
				}
				out.close();
				in.close();
			}else{
				response.setContentType("text/html");
				response.getWriter().print("<script>alert('怎么回事小老弟');</script>");
			}
		}
	}

	private void doGetMusicWord(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String music_id = request.getParameter("music_id");
		response.getWriter().write(MusicDao.getLrc(music_id));
	}
}
