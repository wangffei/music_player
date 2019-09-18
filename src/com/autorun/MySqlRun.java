package com.autorun;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.dao.SearchDao;

public class MySqlRun implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		BufferedReader reader = null;
		BufferedWriter writer = null;
		try {
			String path = Thread.currentThread().getContextClassLoader().getResource("../../db.properties").getFile() ;
			System.out.println(path);
			reader = new BufferedReader(new FileReader(path));
			//System.out.println(MySqlRun.class.getClassLoader().getResource("").getFile()+"db.properties");
			writer = new BufferedWriter(new FileWriter(MySqlRun.class.getClassLoader().getResource("").getFile()+"db.properties"));
			String line = "";
			while((line = reader.readLine()) != null){
				writer.write(line+"\n");
			}
			System.out.println(new Date()+"\t"+"配置文件加载完成");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(reader != null){
					reader.close();
				}
				if(writer != null){
					writer.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//System.out.println(singer_url);
		String path = Thread.currentThread().getContextClassLoader().getResource("../../process").getFile().replaceFirst("/", "");
		String root = Thread.currentThread().getContextClassLoader().getResource("../../").getFile().replaceFirst("/", "") ;
		System.out.println("python "+path+"hotMusic.py "+root) ;
		try {
			Process p = Runtime.getRuntime().exec("python "+path+"hotMusic.py "+root);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
