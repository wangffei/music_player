package com.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MoreDao;


public class MoreServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request , HttpServletResponse response )
			throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("zhuanji".equals(method)){
			doResponse_zhuanji(request ,response);
		}
		if("getdate".equals(method)){
			doGetDate(request , response);
		}
		if("singer".equals(method)){
			doResponse_singer(request , response);
		}
		if("music".equals(method)){
			doResponse_music(request , response);
		}
		if("recorder".equals(method)){
			doResponse_recorder(request , response);
		}
	}

	private void doResponse_recorder(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.sendRedirect("recorder_more.jsp");
	}

	private void doResponse_music(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.sendRedirect("music_show.jsp");
	}

	private void doResponse_singer(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.sendRedirect("music_singer.jsp");
	}

	private void doGetDate(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String data = new String(request.getParameter("data").getBytes("iso-8859-1"),"utf-8");
		response.setContentType("text/javascript");
		//System.out.println(data);
		response.getWriter().print(MoreDao.doGetDate(data));
	}

	private void doResponse_zhuanji(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("music_zhuanji.jsp").forward(request, response);
	}
}
