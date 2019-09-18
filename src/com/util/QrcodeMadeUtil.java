package com.util;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.imageio.ImageIO;

import com.swetake.util.Qrcode;

public class QrcodeMadeUtil {
	private static int flag = 0;
	//将图片读入内存
	private static BufferedImage setImg(Object filePath) throws FileNotFoundException, IOException{
		Image image = null;	
		//将图像加载到内存
		if(filePath instanceof String){
			image =  ImageIO.read(new FileInputStream((String)filePath));
		}else if(filePath instanceof URL){
			HttpURLConnection url = (HttpURLConnection)((URL)filePath).openConnection();
			//设置模拟方式
            url.setRequestMethod("GET"); 
            url.setUseCaches(false);
            url.setReadTimeout(8000); 
            url.setConnectTimeout(8000);
            url.setInstanceFollowRedirects(false);
			url.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36");
			url.connect();
			InputStream in = url.getInputStream();
			image = ImageIO.read(in);
			in.close();
		}
		
		//创建一个画板
		BufferedImage img = new BufferedImage(315, 315, BufferedImage.TYPE_INT_ARGB);
		//将图片画到画板上
		img.getGraphics().drawImage(image, 0, 0, 315, 315 ,null);
		//根据图片颜色分布情况自动设置透明度
		int count = 0;
		for(int width=0;width<img.getWidth();width++){
			for(int height=0;height<img.getHeight();height++){
				Color color = new Color(img.getRGB(width, height));
				int[] f = new int[]{0,0,0};
				if(color.getRed() < 80){
					f[0] = 1;
				}
				if(color.getGreen() < 80){
					f[1] = 1;
				}
				if(color.getBlue() < 80){
					f[2] = 1;
				}
				if(f[0] + f[1] + f[2] >= 2){
					count ++ ;
				}
			}
		}
		if(count > 45000){
			flag = 80;
		}else{
			flag = 150;
		}
		//System.out.println(count + "\t" +flag);
		//将图片设置成半透明状态
		for(int width=0;width<img.getWidth();width++){
			for(int height=0;height<img.getHeight();height++){
				Color oldColor = new Color(img.getRGB(width, height));
				Color newColor = new Color(oldColor.getRed() , oldColor.getGreen() , oldColor.getBlue() , flag);
				img.setRGB(width, height, newColor.getRGB());
			}
		}
		img.flush();
		return img;
	}
	//画二维码
	private static BufferedImage drawQrcode(String text , BufferedImage img) throws FileNotFoundException, IOException{
		if(img == null){
			img = new BufferedImage(315, 315, BufferedImage.TYPE_INT_RGB);
			Graphics g = img.getGraphics();
			g.setColor(Color.white);
			g.fillRect(0, 0, 315, 315);
		}
		//创建Qrcode的对象
		Qrcode qrcode = new Qrcode();
		//设置二维码的容错率 L(7%) M(15%) Q(25%) H(30%)
		qrcode.setQrcodeErrorCorrect('H');
		//设置编码方式
		qrcode.setQrcodeEncodeMode('B');
		//设置qrcode的版本号
		qrcode.setQrcodeVersion(11);
		//根据信息生成一个Boolean类型的二维数组
		boolean[][] data = qrcode.calQrcode(text.getBytes());
		//System.out.println(data[0].length);
		//开始画二维码
		Graphics g = img.getGraphics();
		g.setColor(Color.black);
		for(int width=0;width<data.length;width++){
			for(int height=0;height<data.length;height++){
				if(data[width][height]){	
					g.fill3DRect(5+width*5, 5+height*5, 5, 5 , true);
				}
			}
		}
		img.flush();
		return img;
	}
	//有背景图片
	public static BufferedImage getCode(Object filePath , String text) throws FileNotFoundException, IOException{
		BufferedImage img = null;
		if(filePath instanceof URL){
			img = setImg((URL)filePath);
			//System.out.println("url");
		}else if(filePath instanceof String){
			img = setImg((String)filePath);
			//System.out.println("string");
		}
		//System.out.println("laile");
		img = drawQrcode(text , img);
		return img;
	}
	//没有背景图片
	public static BufferedImage getCode(String text) throws FileNotFoundException, IOException{
		BufferedImage img = drawQrcode(text , null);
		return img;
	}
}
