package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PageDao;

public class PageServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request , HttpServletResponse response )
			throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("zhuanji".equals(method)){
			doGetYear(request ,response);
		}
		if("singer".equals(method)){
			doGetSinger(request , response);
		}
		if("music".equals(method)){
			doGetMusic(request , response);
		}
	}

	private void doGetMusic(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String page = request.getParameter("page");
		char[] pages = page.toCharArray();
		for (char c : pages) {
			if(!Character.isDigit(c)){
				response.getWriter().print("ERROR");
				return;
			}
		}
		response.setContentType("text/html;charset=utf-8;");
		
		response.getWriter().print(PageDao.getMusic(Integer.parseInt(page)));
	}

	private void doGetSinger(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String page = request.getParameter("page");
		char[] pages = page.toCharArray();
		for (char c : pages) {
			if(!Character.isDigit(c)){
				response.getWriter().print("ERROR");
				return;
			}
		}
		response.setContentType("text/html;charset=utf-8;");
		
		response.getWriter().print(PageDao.getSinger(Integer.parseInt(page)));
	}

	private void doGetYear(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/javascript;charset=utf-8");
		
		String data = PageDao.getYearPage(request.getParameter("year"));
		
		response.getWriter().print(data);
	}
}
