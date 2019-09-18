package com.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.pojo.Music_info;
import com.pojo.Singer_info;
import com.util.DbUtil;
import com.util.PinyinUtil;

public class SearchDao {
	public static String doSearch(String key){
		key = key.trim();
		Set<Singer_info> singer_set = new HashSet<Singer_info>();
		Set<Music_info> music_set = new HashSet<Music_info>();
		List<Set> list = null;
		String sql = "select singer_id,singer_name from singer_info where singer_name like ?";
		List<Singer_info> singer_list = DbUtil.selectInfo(Singer_info.class, sql, "%"+key+"%");
		singer_set.addAll(singer_list);
		sql = "select singer_id,singer_name from singer_info where pinyin_head = ?";
		List<Singer_info> singersByPinyinHead = DbUtil.selectInfo(Singer_info.class, sql, PinyinUtil.toHead(key));
		singer_set.addAll(singersByPinyinHead);
		sql = "select singer_id,singer_name from singer_info where pinyin_all = ?";
		List<Singer_info> singersByPinyinAll = DbUtil.selectInfo(Singer_info.class, sql, PinyinUtil.toAll(key));
		singer_set.addAll(singersByPinyinAll);
		if(singer_set.size() >= 10){
			list = new ArrayList<Set>();
			list.add(singer_set);
			return JSONArray.fromObject(list).toString();
		}
		sql = "select music_id,music_name from music_info where music_name like ?";
		List<Music_info> music_list = DbUtil.selectInfo(Music_info.class, sql, "%"+key+"%");
		music_set.addAll(music_list);
		if(singer_set.size() + music_set.size() >= 10){
			list = new ArrayList<Set>();
			list.add(singer_set);
			list.add(music_set);
			return JSONArray.fromObject(list).toString();
		}
		sql = "select music_id,music_name from music_info where pinyin_all = ?";
		List<Music_info> musicByPinyinAll = DbUtil.selectInfo(Music_info.class, sql, PinyinUtil.toAll(key));
		music_set.addAll(musicByPinyinAll);
		if(singer_set.size() + music_set.size() >= 10){
			list = new ArrayList<Set>();
			list.add(singer_set);
			list.add(music_set);
			return JSONArray.fromObject(list).toString();
		}
		sql = "select music_id,music_name from music_info where pinyin_head = ?";
		List<Music_info> musicByPinyinHead = DbUtil.selectInfo(Music_info.class, sql, PinyinUtil.toHead(key));
		music_set.addAll(musicByPinyinHead);
		
		list = new ArrayList<Set>();
		list.add(singer_set);
		list.add(music_set);
		return JSONArray.fromObject(list).toString();
	}

	public static String getMusic(String keyword, String pages,
			String flag) throws IOException {
		Integer size = 30;
		JSONArray json = null;
		if(flag.trim().equals("0")){
			Set<Music_info> set = new HashSet<Music_info>();
			String sql = "select time,music_name,music_id,singer_name,singer_info.singer_id,zhuanji_name,zhuanji_info.zhuanji_id "
					+ "from music_info,zhuanji_info,singer_info where music_info.singer_id=singer_info.singer_id and "
					+ "music_info.zhuanji_id=zhuanji_info.zhuanji_id and music_info.music_name like ?";
			List<Music_info> list = DbUtil.selectInfo(Music_info.class, sql, "%"+keyword+"%");
			set.addAll(list);
			sql = "select time,music_name,music_id,singer_name,singer_info.singer_id,zhuanji_name,zhuanji_info.zhuanji_id "
					+ "from music_info,zhuanji_info,singer_info where music_info.singer_id=singer_info.singer_id and "
					+ "music_info.zhuanji_id=zhuanji_info.zhuanji_id and music_info.pinyin_head = ?";
			list = DbUtil.selectInfo(Music_info.class, sql, PinyinUtil.toHead(keyword));
			set.addAll(list);
			sql = "select time,music_name,music_id,singer_name,singer_info.singer_id,zhuanji_name,zhuanji_info.zhuanji_id "
					+ "from music_info,zhuanji_info,singer_info where music_info.singer_id=singer_info.singer_id and "
					+ "music_info.zhuanji_id=zhuanji_info.zhuanji_id and music_info.pinyin_all like ?";
			list = DbUtil.selectInfo(Music_info.class, sql, "%"+PinyinUtil.toAll(keyword)+"%");
			set.addAll(list);
			list = new ArrayList<Music_info>();
			for (Music_info music_info : set) {
				list.add(music_info);
			}
			//System.out.println(pages);
			list = list.subList((Integer.parseInt(pages)-1)*30, Integer.parseInt(pages)*30 < list.size() ? Integer.parseInt(pages)*30 : list.size());
			json=JSONArray.fromObject(list);
		}else{
			String path = SearchDao.class.getClassLoader().getResource("../../process").getFile();
			//System.out.println(("python "+path+"getMusic.py "+keyword+" "+tp+" "+pages+"").replaceFirst("/", ""));
			Process process = Runtime.getRuntime().exec(("python "+path+"getMusic.py "+keyword+" 1 "+pages+"").replaceFirst("/", ""), null, new File(path));
			BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line = "";
			StringBuffer buf = new StringBuffer();
			while((line = br.readLine()) != null){
				buf.append(line);
			}
			//System.out.println(buf);
			if(buf.toString().trim().equals("[]")){
				return null;
			}
			return buf.toString();
		}
		return json.toString().replaceAll("/", "\\\\/");
	}

	public static JSONObject getPages(String keyword,String tp) throws IOException {
		Set<Music_info> set = new HashSet<Music_info>();
		String sql = "select time,music_name,music_id,singer_name,singer_info.singer_id,zhuanji_name,zhuanji_info.zhuanji_id "
				+ "from music_info,zhuanji_info,singer_info where music_info.singer_id=singer_info.singer_id and "
				+ "music_info.zhuanji_id=zhuanji_info.zhuanji_id and music_info.music_name like ?";
		List<Music_info> list = DbUtil.selectInfo(Music_info.class, sql, "%"+keyword+"%");
		set.addAll(list);
		sql = "select time,music_name,music_id,singer_name,singer_info.singer_id,zhuanji_name,zhuanji_info.zhuanji_id "
				+ "from music_info,zhuanji_info,singer_info where music_info.singer_id=singer_info.singer_id and "
				+ "music_info.zhuanji_id=zhuanji_info.zhuanji_id and music_info.pinyin_head = ?";
		list = DbUtil.selectInfo(Music_info.class, sql, PinyinUtil.toHead(keyword));
		set.addAll(list);
		sql = "select time,music_name,music_id,singer_name,singer_info.singer_id,zhuanji_name,zhuanji_info.zhuanji_id "
				+ "from music_info,zhuanji_info,singer_info where music_info.singer_id=singer_info.singer_id and "
				+ "music_info.zhuanji_id=zhuanji_info.zhuanji_id and music_info.pinyin_all like ?";
		list = DbUtil.selectInfo(Music_info.class, sql, "%"+PinyinUtil.toAll(keyword)+"%");
		set.addAll(list);
		JSONObject object = new JSONObject();
		object.put("page", (set.size()%30 == 0 ? set.size()/30 : set.size()/30+1)+"");
		String path = SearchDao.class.getClassLoader().getResource("../../process").getFile();
		//System.out.println(("python "+path+"getPages.py "+keyword+" "+tp+"").replaceFirst("/", ""));
		Process process = Runtime.getRuntime().exec(("python "+path+"getPages.py "+keyword+" "+tp+"").replaceFirst("/", ""), null, new File(path));
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer();
		while((line = br.readLine()) != null){
			buf.append(line);
		}
		if(buf.toString().trim().equals("ERROR")){
			object.put("page_other", 0);
			return object;
		}
		object.put("page_other", buf.toString());
		return object;
	}

	public static String getZhuanji(String key, String page) throws IOException {
		String path = SearchDao.class.getClassLoader().getResource("../../process").getFile();
		//System.out.println(("python "+path+"getMusic.py "+key+" 2 "+page+"").replaceFirst("/", ""));
		//System.out.println(key+"\t"+page);
		Process process = Runtime.getRuntime().exec(("python "+path+"getMusic.py "+key+" 2 "+page+"").replaceFirst("/", ""), null, new File(path));
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer();
		while((line = br.readLine()) != null){
			buf.append(line);
		}
		if(buf.toString().trim().equals("[]")){
			return null;
		}
		return buf.toString();
	}

	public static String getZhuanji_pages(String keyword) throws IOException {
		String path = SearchDao.class.getClassLoader().getResource("../../process").getFile().replaceFirst("/", "");
		Process process = Runtime.getRuntime().exec("python "+path+"getPages.py "+keyword+" 2");
		BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer();
		while((line = reader.readLine()) != null){
			buf.append(line);
		}
		return buf.toString().replaceAll("/", "\\\\/");
	}

	public static String getSinger(String key, String page) throws IOException {
		String path = SearchDao.class.getClassLoader().getResource("../../process").getFile();
		//System.out.println(("python "+path+"getMusic.py "+key+" 3 "+page+"").replaceFirst("/", ""));
		Process process = Runtime.getRuntime().exec(("python "+path+"getMusic.py "+key+" 3 "+page+"").replaceFirst("/", ""), null, new File(path));
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer("[");
		while((line = br.readLine()) != null){
			buf.append(line);
		}
		if(buf.length() == 1){
			return null;
		}
		buf = buf.replace(buf.length()-1, buf.length(), "]");
		return buf.toString().replace("/", "\\\\/");
	}

	public static String getSinger_pages(String keyword) throws IOException {
		String path = SearchDao.class.getClassLoader().getResource("../../process").getFile().replaceFirst("/", "");
		Process process = Runtime.getRuntime().exec("python "+path+"getPages.py "+keyword+" 3");
		BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line = "";
		StringBuffer buf = new StringBuffer();
		while((line = reader.readLine()) != null){
			buf.append(line);
		}
		return buf.toString().replace("/", "\\\\/");
	}

	public static String getMusic_list(String key) {
		key = key.trim();
		Set<Music_info> music_set = new HashSet<Music_info>();
		List<Set> list = null;
		
		String sql = "select music_id,music_name,singer_name,singer_info.singer_id,time,zhuanji_name from music_info,singer_info,zhuanji_info "
				+ "where music_name like ? and singer_info.singer_id = music_info.singer_id and zhuanji_info.zhuanji_id = music_info.zhuanji_id";
		List<Music_info> music_list = DbUtil.selectInfo(Music_info.class, sql, "%"+key+"%");
		music_set.addAll(music_list);
		
		sql = "select music_id,music_name,singer_name,singer_info.singer_id,time,zhuanji_name from music_info,singer_info,zhuanji_info "
				+ "where music_info.pinyin_all = ?  and singer_info.singer_id = music_info.singer_id and zhuanji_info.zhuanji_id = music_info.zhuanji_id";
		List<Music_info> musicByPinyinAll = DbUtil.selectInfo(Music_info.class, sql, PinyinUtil.toAll(key));
		music_set.addAll(musicByPinyinAll);
		
		sql = "select music_id,music_name,singer_name,singer_info.singer_id,time,zhuanji_name from music_info,singer_info,zhuanji_info"
				+ " where music_info.pinyin_head = ? and singer_info.singer_id = music_info.singer_id and zhuanji_info.zhuanji_id = music_info.zhuanji_id";
		List<Music_info> musicByPinyinHead = DbUtil.selectInfo(Music_info.class, sql, PinyinUtil.toHead(key));
		music_set.addAll(musicByPinyinHead);
		
		return JSONArray.fromObject(music_set).toString().replace("/", "\\\\/");
	}
}
