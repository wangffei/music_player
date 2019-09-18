package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndexFilter implements Filter{
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filter) throws IOException, ServletException {
		response.setCharacterEncoding("utf-8");
		
		HttpServletRequest req = (HttpServletRequest) request;
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("username") == null){
			((HttpServletResponse)response).sendRedirect("login.html");
		}
		
		filter.doFilter(request, response);		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
