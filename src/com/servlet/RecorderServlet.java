package com.servlet;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RecorderDao;
import com.util.DoFileUtil;

public class RecorderServlet extends HttpServlet {
	private static Map<String, Map<Long, byte[]>> map_data = new HashMap<String, Map<Long, byte[]>>();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("play".equals(method)){
			doPlay(request , response);
		}else if("play_recorder".equals(method)){
			doPlay_recorder(request , response);
		}else if("isalive".equals(method)){
			String recorder_id = request.getParameter("recorder_id");
			if(map_data.get(recorder_id) == null){
				response.getWriter().print("OVER");
			}
		}else if("recorder_list".equals(method)){
			getRecorderlist(request , response);
		}else if("playing_list".equals(method)){
			playing_list(request , response);
		}else if("stop".equals(method)){
			map_data.remove(request.getSession().getAttribute("recorder"));
			stop_recorder(request , response);
		}else{
			getWav(request, response);
		}
	}
	
	private void playing_list(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String data = RecorderDao.playing_list();
		response.getWriter().print(data);
	}

	private void stop_recorder(HttpServletRequest request,
			HttpServletResponse response) throws FileNotFoundException {
		String time = request.getParameter("time");
		RecorderDao.stop_recorder(request.getSession().getAttribute("recorder")+"" , request.getSession().getAttribute("key")+"" , time);
	}

	private void getRecorderlist(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String data = RecorderDao.getRecorderlist();
		//System.out.println(data);
		response.getWriter().print(data);
	}

	private void doPlay_recorder(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String recorder_id = request.getParameter("recorder_id");
		//System.out.println(recorder_id);
		if(map_data.get(recorder_id) == null){
			return;
		}
		OutputStream out = response.getOutputStream();
		out.write((byte[])map_data.get(recorder_id).values().toArray()[0]);
		//System.out.println(map_data.get(recorder_id).values().toArray()[0]);
		out.close();
		//System.out.println(recorder_id+"over");
	}

	private void doPlay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String time = request.getParameter("time");
		String recorder_id = request.getParameter("recorder_id");
		
		if(time == null || time.trim().length() == 0){
			response.getWriter().print(map_data.keySet().toArray()[0]);
		}else{
			Long t = Long.parseLong(time);
			//System.out.println((Long)map_data.get(recorder_id).keySet().toArray()[0]);
			if(map_data.get(recorder_id) == null){
				return;
			}
			if(t - (Long)map_data.get(recorder_id).keySet().toArray()[0] > 10000){
				response.getWriter().print("OK");
			}else{
				response.getWriter().print("NO");
			}
		}
	}

	public void getWav(HttpServletRequest request , HttpServletResponse response) throws MalformedURLException{
		DoFileUtil file = new DoFileUtil();
		Map<String, String> map = file.doFiles(request, 1024*1024*10 , this.getServletContext().getResource("recorder/wav").getFile()+request.getSession().getAttribute("recorder")+".wav",response);
		byte[] data = file.getData();
		Map<Long, byte[]> mbyte = map_data.get(request.getSession().getAttribute("recorder")+"");
		if(mbyte == null){
			mbyte = new HashMap<Long, byte[]>();
			map_data.put(request.getSession().getAttribute("recorder")+"", mbyte);
		}
		mbyte.clear();
		mbyte.put(new Date().getTime(), data);
		//System.out.println(map_data.toString());
	}
}
