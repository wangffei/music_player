package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DetailDao;
import com.dao.MusicDao;
import com.pojo.Music_info;
import com.util.Base64Util;

public class DetailServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("zhuanji".equals(method)){
			doResponse_zhuanji(request , response);
		}
		if("singer".equals(method)){
			doResponse_singer(request , response);
		}
		if("music".equals(method)){
			try {
				doResponse_music(request , response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if("recorder".equals(method)){
			doResponse_recorder(request , response);
		}
		if("recorder_playing".equals(method)){
			playing(request , response);
		}
	}

	private void playing(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String data = DetailDao.getPlaying_data(id);
		request.setAttribute("data", data);
		request.getRequestDispatcher("playRecorder.jsp").forward(request, response);
	}

	private void doResponse_recorder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String recorder_id  = request.getParameter("recorder_id");
		String data = DetailDao.getRecorder(recorder_id);
		request.setAttribute("data", data);
		request.getRequestDispatcher("recorder_detail.jsp").forward(request, response);
	}

	private void doResponse_music(HttpServletRequest request,
			HttpServletResponse response) throws IOException,Exception {
		String music_id = request.getParameter("music_id");
		String base64id = music_id;
		
		response.setContentType("text/html;charset=utf-8");
		
		if(music_id != null){
			music_id = Base64Util.decode(music_id);
			Music_info music = DetailDao.getMusicinfo(music_id);
			//System.out.println(music.getSinger_name() + "\t" +music.getSinger_img());
			
			/**
			 * {"status":"1","data":{"song_name":"","lyrics":"","author_name":"","play_url":"","img":"","album_name":""}}
			 */
			String prop = "{\"status\":1,\"data\":{\"author_name\":\""+music.getSinger_name()+"\",\"img\":"
					+ "\""+music.getSinger_img()+"\",\"album_name\":\"待定\",\"song_name\":\""+music.getMusic_name()+"\",\"play_url"
					+ "\":\"music.do?method=musicplay&singer_id="+Base64Util.encode(music.getSinger_id()+"")+""
					+ "&music_id="+base64id+"\",\"lyrics\":\""+MusicDao.getLrc(music_id)+"\",\"timelength\":\""+music.getTime()+"000"+"\"}}";
            
			response.getWriter().print("["+prop+"]");
			
			return;
		}
	}

	private void doResponse_singer(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String singer_id = Base64Util.decode(request.getParameter("singer_id"));
		
		String data = DetailDao.getSinger(singer_id);
		request.setAttribute("data", data);
		
		request.getRequestDispatcher("singer_detail.jsp").forward(request, response);
	}

	private void doResponse_zhuanji(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String zhuanji_id = Base64Util.decode(request.getParameter("zhuanji_id"));
		
		String data = DetailDao.getZhuanji(zhuanji_id);
		
		request.setAttribute("data", data);
		request.getRequestDispatcher("zhuanji_detail.jsp").forward(request, response);
	}
}
