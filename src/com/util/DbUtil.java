package com.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class DbUtil {
	private static Vector<Connection> dataPool = new Vector<Connection>();
	private static String driver = null;
	private static String url = null;
	private static String username = null;
	private static String password = null;
	private static BufferedReader br = null;
	
	static{
		try {
			String filename = DbUtil.class.getClassLoader().getResource("/db.properties").getFile();
			
			br = new BufferedReader(new FileReader(filename));
			
			String line = null;
			
			while((line = br.readLine()) != null){
				String[] str = line.split("=",2);
				if(str[0].equals("driver")){
					driver = str[1];
				}else if(str[0].equals("url")){
					url = str[1];
				}else if(str[0].equals("username")){
					username = str[1];
				}else if(str[0].equals("password")){
					password = str[1];
				}
			}
			
			Class.forName(driver);
			
			for(int i=0;i<3;i++){
				Connection connection = DriverManager.getConnection(url,username,password);
				dataPool.add(connection);
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				throw new Exception("数据库操作异常");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally{
			if(br != null){
				try {
					br.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	public static Connection getConnection(){
		
		Connection connection = dataPool.get(0);
		
		dataPool.remove(0);	
				
		return connection;
	}
	
	public static void release(Connection connection){
		dataPool.add(connection);
	}
	
	public static List selectInfo(Class c , String sql , Object...p){
		ArrayList<Object> list = new ArrayList<Object>();
		
		Connection connection = DbUtil.getConnection();
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			
			for(int i=0;i<p.length;i++){
				ps.setObject(i+1, p[i]);
			}
			
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			
			while(rs.next()){
				Object obj = c.newInstance();
					
				for(int i=1;i<=count;i++){
					
					Field field = c.getDeclaredField(rsmd.getColumnLabel(i));
					
					field.setAccessible(true);
					
					field.set(obj, rs.getObject(i));
				}
				
				list.add(obj);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				throw new Exception("数据库操作异常");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally{
			release(connection);
		}
		
		return null;
	}
	
	public static int unionQuery(String sql , Object...p){
		int num = 0;
		Connection connection = DbUtil.getConnection();
		try {			
			PreparedStatement ps = connection.prepareStatement(sql);
			
			for (int i=0;i<p.length;i++) {
				ps.setObject(i+1, p[i]);
			}
			
			ResultSet rs = ps.executeQuery(); 
			
			rs.next();	
			
			num = rs.getInt(1);
			
			return num;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				throw new Exception("数据库操作异常");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally{
			release(connection);
		}
		return 0;
	}
	
	public static int updateInfo(String sql,Object...p){
		
		Connection connection = DbUtil.getConnection();
		
		int count = 0;
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			
			for(int i=0;i<p.length;i++){
				ps.setObject(i+1, p[i]);
			}
			
			count = ps.executeUpdate();
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				throw new Exception("数据库操作异常");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally{
			release(connection);
		}
		
		return 0;
	}
	//一个添加完数据返回主键的方法
	public static int updateInfo_key(String sql,Object...p){
		
		Connection connection = DbUtil.getConnection();
		
		int count = 0;
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			
			for(int i=0;i<p.length;i++){
				ps.setObject(i+1, p[i]);
			}
			
			count = ps.executeUpdate();
			
			String sqlString = "select LAST_INSERT_ID()";
			
			Statement statement = connection.createStatement();
			
			ResultSet rs = statement.executeQuery(sqlString);
			
			rs.next();		
			
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				throw new Exception("数据库操作异常");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally{
			release(connection);
		}
		
		return 0;
	}
}


