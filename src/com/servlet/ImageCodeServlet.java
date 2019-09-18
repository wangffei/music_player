package com.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DetailDao;
import com.util.Base64Util;
import com.util.QrcodeMadeUtil;

/**
 * @function 生成验证码
 * @author 王飞
 * @date 2018-11-26
 */
public class ImageCodeServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		
		//获取验证码
		if("getCode".equals(method)){
			doSendCode(request , response);
		}
		//获取二维码
		if("qrcode".equals(method)){
			doResponse_qrcode(request , response);
		}
	}

	private void doResponse_qrcode(HttpServletRequest request,
			HttpServletResponse response) throws FileNotFoundException, IOException {
		String zhuanji_id = request.getParameter("zhuanji_id");
		zhuanji_id = zhuanji_id == null ? null : Base64Util.decode(zhuanji_id);
		String singer_id = request.getParameter("singer_id");
		String pic_url = request.getParameter("pic_url");
		singer_id = singer_id == null ? null : Base64Util.decode(singer_id);
		String useimg = request.getParameter("useimg");
		String data = request.getParameter("data");
		if(data == null){
			response.getWriter().print("ERROR");
			return;
		}
		data = new String(data.getBytes("iso-8859-1"),"utf-8");
		String name = data.substring(data.indexOf("wd")+3);
		data = data.substring(0,data.indexOf("=")+1)+URLEncoder.encode(name);
		//System.out.println(data);
		Integer status = 0;
		
		if(useimg != null && "true".equals(useimg.trim())){
			BufferedImage img = null;
			if(zhuanji_id == null && singer_id != null){
				status = 1;
				img = DetailDao.getQrcode(singer_id , data , status);
			}else if(zhuanji_id != null && singer_id == null){
				status = 2;
				img = DetailDao.getQrcode(zhuanji_id , data , status);
			}
			if(pic_url != null){
				String path = request.getServletContext().getRealPath(pic_url);
				//System.out.println(path);
				img = QrcodeMadeUtil.getCode(path, data);
			}
			if(img == null){
				response.getWriter().print("ERROR");
				return;
			}
			ImageIO.write(img, "png", response.getOutputStream());
			return;
		}else{
			BufferedImage img = DetailDao.getQrcode(data,pic_url);
			ImageIO.write(img, "png", response.getOutputStream());
		}
	}

	private void doSendCode(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("png");
		//字符集
		String codeString = "1234567890abcdefghijklmnopqrstuvwxyz";
		//保存生成的验证码
		StringBuffer buf = new StringBuffer();
		for (int i=0 ; i<4;i++){
			buf.append(codeString.charAt((int)(Math.random()*36)));
		}
		//将验证码保存到用户的session中
		HttpSession session = request.getSession();
		session.setAttribute("code", buf.toString());
		//创建一个画板
		BufferedImage image = new BufferedImage(80, 30, BufferedImage.TYPE_INT_RGB);
		//拿到画笔
		Graphics g = image.getGraphics();
		//设置画板背景
		g.setColor(Color.yellow);
		g.fillRect(0, 0, 80, 30);
		//设置画笔样式
		g.setFont(new Font("微软雅黑" ,Font.BOLD , 18));
		g.setColor(Color.red);
		//将buf中的字符画到画板上
		g.drawString(buf.charAt(0)+"", 5, 16);
		g.drawString(buf.charAt(1)+"", 25, 20);
		g.drawString(buf.charAt(2)+"", 45, 15);
		g.drawString(buf.charAt(3)+"", 60, 13);
		
		ImageIO.write(image, "png", response.getOutputStream());		
	}
}
