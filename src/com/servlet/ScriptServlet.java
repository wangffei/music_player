package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.dao.ScriptDao;
import com.pojo.MainShow;
/**
 * @function 处理script请求
 * @author 王飞
 * @date 2018-11-28
 */
public class ScriptServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		
		//处理主页面数据请求
		if("main".equals(method)){
			doMain(request , response);
		}
	}

	private void doMain(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MainShow main = ScriptDao.doMain();
		
		String json = JSONArray.fromObject(main).toString();
		String script = "var main_data="+json;
		
		response.setContentType("text/javascript;charset=utf-8");
		response.getWriter().print(script);
	}
}
