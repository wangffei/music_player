package com.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.pojo.Collection;
import com.pojo.Music_info;
import com.util.DbUtil;
import com.util.UnicodeUtil;


public class MusicDao {
	
	//爬取歌词的dao层
	public static String getLrc(String music_id) {
		String url = "";
		String sql = "select music_lrc from music_info where music_id=?";
		List<Music_info> list = DbUtil.selectInfo(Music_info.class, sql, music_id);
		if(list.size() > 0){
			url = list.get(0).getMusic_lrc();
		}
		//保存网页源代码
		StringBuffer buf = new StringBuffer();
		//创建一个网页io流
		BufferedReader br = null;
		//System.out.println(music_id+"\t"+url);
		try{
			URL url2 = new URL(url);
			
			HttpURLConnection connection = (HttpURLConnection)url2.openConnection();
			
			 //设置模拟方式
            connection.setRequestMethod("GET");
            
            connection.setUseCaches(false);
            
            connection.setReadTimeout(8000);
            
            connection.setConnectTimeout(8000);
            
            connection.setInstanceFollowRedirects(false);
			
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36");
            
            connection.connect();
            
            br = new BufferedReader(new InputStreamReader(connection.getInputStream(),"iso-8859-1"));
            
            String line = "";
            
            int code = connection.getResponseCode();
            
	        if(code == 200){
	        	while((line=br.readLine())!=null){
	        		buf.append(line+"\n");
	            }
	        }  
		}catch(Exception e){
			System.out.println(e.toString());
		}finally{
			if(br != null){
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		//提取歌词的正则表达式
		String reg = "\\[\\d{2}:\\d{2}.*?\\].([^<]*)?";
		//保存utf-8的网页源码
		String data = null;
		try {
			//将数据从iso-8859-1转到utf-8
			data = new String(buf.toString().getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Pattern pattern = Pattern.compile(reg);
		
		Matcher matcher = pattern.matcher(data);
		
		buf.delete(0, buf.length());
		
		while(matcher.find()){
			String line = matcher.group(0) ;
			Pattern p = Pattern.compile("[\u4e00-\u9fa5]") ;
			Matcher m = p.matcher(line) ;
			while(m.find()){
				line = line.replace(m.group(0), UnicodeUtil.string2Unicode(m.group(0)));
			}
			buf.append(line);
		}
		
		return buf.toString();
	}
	
	public static String getLrc_yy(String lrc_url) {
		//保存网页源代码
		StringBuffer buf = new StringBuffer();
		//创建一个网页io流
		BufferedReader br = null;
		//System.out.println(music_id+"\t"+url);
		try{
			URL url2 = new URL(lrc_url);
			
			HttpURLConnection connection = (HttpURLConnection)url2.openConnection();
			
			 //设置模拟方式
            connection.setRequestMethod("GET");
            
            connection.setUseCaches(false);
            
            connection.setReadTimeout(8000);
            
            connection.setConnectTimeout(8000);
            
            connection.setInstanceFollowRedirects(false);
			
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36");
            
            connection.connect();
            
            br = new BufferedReader(new InputStreamReader(connection.getInputStream(),"iso-8859-1"));
            
            String line = "";
            
            int code = connection.getResponseCode();
            
	        if(code == 200){
	        	while((line=br.readLine())!=null){
	        		buf.append(line+"\n");
	            }
	        }          
		}catch(Exception e){
			System.out.println(e.toString());
		}finally{
			if(br != null){
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		//提取歌词的正则表达式
		String reg = "\\[\\d{2}:\\d{2}.*?\\].([^<]*)?";
		//保存utf-8的网页源码
		String data = null;
		try {
			//将数据从iso-8859-1转到utf-8
			data = new String(buf.toString().getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Pattern pattern = Pattern.compile(reg);
		
		Matcher matcher = pattern.matcher(data);
		
		buf.delete(0, buf.length());
		
		buf.append("[{\"music_lrc\":\"");
		
		while(matcher.find()){
			buf.append(matcher.group(0));
		}
		
		buf.replace(buf.length()-1 , buf.length() , "\"}]");
		
		if(buf.toString().equals("[{\"music_lrc\":\"}]")){
			buf = new StringBuffer("");
		}
		
		//System.out.println(buf);
		
		return buf.toString();
	}
	
	public static String getMusic_data(String url){
		StringBuffer buf = new StringBuffer();
		BufferedReader reader = null;
		try {
			HttpURLConnection connection = (HttpURLConnection)new URL(url).openConnection();
			//设置模拟方式
            connection.setRequestMethod("GET");
            connection.setUseCaches(false);
            connection.setReadTimeout(8000);
            connection.setConnectTimeout(8000);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36");
            connection.setRequestProperty("Host", "wwwapi.kugou.com");
            connection.setRequestProperty("Cookie", "kg_mid="+randMid());
            connection.connect();
            
            reader = new BufferedReader(new InputStreamReader(connection.getInputStream() , "iso-8859-1"));
            String line = "";
            
            while((line = reader.readLine()) != null){
            	buf.append(line);
            }
            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally{
			if(reader != null){
				try {
					reader.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return buf.toString();
	}
	
	private static String randMid(){
		char[] d = new char[]{'1' , '2' , '3' , '4' , '5' , '6' , '7' , '8' , '9' , 'a' , 'b' , 'c' , 'd' , 'e' , 'f'} ;
		StringBuffer buffer = new StringBuffer() ;
		for(int i=0 ; i<32 ; i++){
			buffer.append(d[(int)(Math.random()*15)]) ;
		}
		return buffer.toString() ;
	}

//	public static String getMusicList(String username) {
//		
//		StringBuffer buf = new StringBuffer("[");
//		
//		int randomNum = (int)(Math.random()*90000000+10000000);
//		
//		String sql = "select music_info.music_name , group_music.music_id , music_lrc ,"
//				+ "music_info.singer_id , singer_name, group_info.group_id , "
//				+ "group_info.group_name  from music_info , singer_info , group_info "
//				+ ", group_music where group_info.group_id = group_music.group_id and "
//				+ "group_info.username = ? and group_music.music_id = music_info.music_id "
//				+ "and music_info.music_id in (select group_music.music_id from group_info "
//				+ ", group_music where group_info.group_id = group_music.group_id and "
//				+ "username =?) and singer_info.singer_id = music_info.singer_id and "
//				+ "singer_info.singer_id in(select singer_id from music_info where music_id "
//				+ "in (select music_id from group_info , group_music  where "
//				+ "group_info.group_id = group_music.group_id and username = ? ))";
//		
//		List<Music_list> list1 = DbUtil.selectInfo(Music_list.class, sql , username , username ,username );
//		
//		
//		sql = "select group_id , group_name from group_info where username = ?";
//		
//		List<Music_list> list2 = DbUtil.selectInfo(Music_list.class, sql, username);
//		
//		//System.out.println(randomNum);
//		for(Music_list group : list2){
//			StringBuffer song = new StringBuffer("[");
//			for (Music_list music : list1) {
//				if(music.getGroup_id() == group.getGroup_id()){
//					song.append("{\"music_id\":\""+Base64Util.encode((music.getMusic_id() ^ randomNum)+"")+"\""
//							+ ",\"music_name\":\""+music.getMusic_name()+"\",\"singer_name"
//							+ "\":\""+music.getSinger_name()+"\",\"singer_id\":"
//							+ "\""+Base64Util.encode((music.getSinger_id() ^ randomNum)+"")+"\","
//							+ "\"music_lrc\":\""+music.getMusic_lrc()+"\"},");
//				}
//			}
//			if(song.toString().equals("[")){
//				song = new StringBuffer("[]");
//			}
//			song.replace(song.length() - 1, song.length(), "]");
//			buf.append("{\"group_id\":\""+Base64Util.encode((group.getGroup_id() ^ randomNum) +"")+"\",\"group_name\":\""+group.getGroup_name()+"\",\"song_info\":"+song+"},");
//		}
//		System.out.println(buf.replace(buf.length() - 1, buf.length(), "]"));;
//		
//		return buf.toString()+randomNum;
//	}

	public static boolean isExists(String singer_id, String music_id) {
		String sql = "select count(music_id) from music_info where music_id=? and singer_id=?";
		Integer count = DbUtil.unionQuery(sql, music_id , singer_id);
		if(count > 0){
			return true;
		}
		return false;
	}

	public static String singerDetail(String singer_url) throws IOException {
		//System.out.println(singer_url);
		String path = SearchDao.class.getClassLoader().getResource("../../process").getFile();
		//System.out.println(("python "+path+"getMusic.py "+keyword+" "+tp+" "+pages+"").replaceFirst("/", ""));
		Process process = Runtime.getRuntime().exec(("python "+path+"getSinger.py "+singer_url+"").replaceFirst("/", ""), null, new File(path));
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer();
		while((line = br.readLine()) != null){
			buf.append(line);
		}
		//System.out.println(buf);
		if(buf.toString().equals("[]")){
			return null;
		}
	//	System.out.println(buf);
		return buf.toString();
	}

	public static String zhuanjiDetal(String zhuanji_url) throws IOException {
		String path = SearchDao.class.getClassLoader().getResource("../../process").getFile();
		//System.out.println(("python "+path+"getMusic.py "+keyword+" "+tp+" "+pages+"").replaceFirst("/", ""));
		Process process = Runtime.getRuntime().exec(("python "+path+"getZhuanji.py "+zhuanji_url+"").replaceFirst("/", ""), null, new File(path));
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer();
		while((line = br.readLine()) != null){
			buf.append(line);
		}
		if(buf.equals("[]")){
			return null;
		}
		return buf.toString();
	}

	public static String getGedanDetail(String gedan_url) throws IOException {
		String path = SearchDao.class.getClassLoader().getResource("../../process").getFile();
		//System.out.println(("python "+path+"getMusic.py "+keyword+" "+tp+" "+pages+"").replaceFirst("/", ""));
		Process process = Runtime.getRuntime().exec(("python "+path+"getGedan.py "+gedan_url+"").replaceFirst("/", ""), null, new File(path));
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer();
		while((line = br.readLine()) != null){
			buf.append(line);
		}
		if(buf.equals("[]")){
			return null;
		}
		return buf.toString();
	}
	public static void main(String[] args) {
		String str = "//";
		System.out.println(str.replaceAll("/", "\\\\/"));
	}
	
	//网易云音乐网站拿歌词和歌曲地址
	public static String get163Music(String id) {
		StringBuffer buf = new StringBuffer();
		String data = "" ;
		JSONObject json = new JSONObject();
		//"https://music.laod.cn/api.php"
		data = doPost("https://music.laod.cn/api.php", "types=url&id="+id+"&source=netease");
		Pattern p = Pattern.compile("\\{\"url\":\"(.*?\\.mp3).*?");
		Matcher m = p.matcher(data);
		json.element("play_url", (m.find() ? m.group(1).replaceAll("\\\\", "").replace("m7c.music.", "m7.music.").replace("m8c.music.", "m8.music.") : "https://music.163.com/song/media/outer/url?id=" + id + ".mp3"));
		data = doPost("https://music.laod.cn/api.php", "types=lyric&id="+id+"&source=netease");
		p = Pattern.compile("\\{\"lyric\":\"(.*?)\",\"tlyric\":\"\"\\}");
		m = p.matcher(data);
		json.element("lyrics", (m.find() ? m.group(1).replaceAll("\\\\n", "") : ""));
		data = "[{\"status\":\"1\",\"data\":"+json.toString()+"}]";
		return data;
	}
	
	private static String doPost(String post_url , String data){
		//构造post请求参数
		//types: url id: 1305701760 source: netease
		StringBuffer buf = new StringBuffer();
		OutputStream out = null;
		BufferedReader in = null;
		try {
			URL url = new URL(post_url) ;
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("POST");
			connection.setUseCaches(false);// 忽略缓存 
			connection.setDoOutput(true);//使用 URL 连接进行输出 
			connection.setDoInput(true);
			connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36");
			connection.setRequestProperty("referer", "https://music.laod.cn/");
			out =connection.getOutputStream();
			out.write(data.getBytes());
			out.flush();
			out.close();
			in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			String line = "";
			while((line = in.readLine()) != null){
				buf.append(line);
			}
			return buf.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			if(out != null){
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(in != null){
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public static boolean addCollection(String username , String music_url, String music_name,
			String singer_img, String singer_name, String time,
			String zhuanji_name) {
		String sql = "insert into collection(username,music_url,music_name,singer_img,singer_name,time,zhuanji_name) values(?,?,?,?,?,?,?)";
		try{
			int count = DbUtil.updateInfo(sql, username,music_url,music_name,singer_img,singer_name,time,zhuanji_name);
			if(count > 0){
				return true;
			}
		}catch(Exception e){
			System.out.println(e);
			return false;
		}
		return false;
	}

	public static boolean deleteCollection(String username, String music_url) {
		String sql = "delete from  collection where username=? and music_url=?";
		try{
			int count = DbUtil.updateInfo(sql, username , music_url);
			if(count > 0){
				return true;
			}
		}catch(Exception e){
			System.out.println(e);
			return false;
		}
		return false;
	}

	public static String getMyCollectionList(String username) {
		String sql = "select music_name , music_url , singer_img , singer_name , zhuanji_name , time from collection where username = ?" ;
		try{
			List<Collection> list = DbUtil.selectInfo(Collection.class, sql, username);
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[]{"username"});
			JSONArray arr = JSONArray.fromObject(list , config);
			return arr.toString();
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
}
