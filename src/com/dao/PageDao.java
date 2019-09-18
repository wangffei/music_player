package com.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.pojo.Music_info;
import com.pojo.Singer_info;
import com.pojo.Zhuanji_info;
import com.util.DbUtil;
import com.util.JSONDateProcessor;

public class PageDao {
	
	//根据时间将专辑分页
	public static String getYearPage(String year) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date date = null;
		try {
			date = sdf.parse(year);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String sql = "select zhuanji_id , zhuanji_date , singer_info.singer_name , zhuanji_img , zhuanji_name from zhuanji_info , singer_info "
				+ "where zhuanji_info.singer_id = singer_info.singer_id and zhuanji_date > ? order by visitis limit 0,10";
		
		List<Zhuanji_info> zhuanji = DbUtil.selectInfo(Zhuanji_info.class, sql, date);
		
		return JSONArray.fromObject(zhuanji).toString();
	}
	
	//处理歌手分页
	public static String getSinger(int page) {
		if(page <= 0){
			return "ERROR";
		}
		
		String sql = "select singer_id , singer_name , singer_borndate ,singer_img from singer_info order by singer_visits limit ?,10";
		
		List<Singer_info> list = DbUtil.selectInfo(Singer_info.class, sql, (page - 1)*10);
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new JSONDateProcessor());
		
		if(list.size() == 0){
			return "ERROR";
		}
		
		return JSONArray.fromObject(list, config).toString();
	}

	public static String getMusic(int page) {
		if(page <= 0){
			return "ERROR";
		}
		
		String sql = "select music_id , zhuanji_info.zhuanji_id , music_name ,zhuanji_name, music_info.singer_id , singer_info.singer_name from "
				+ " singer_info , music_info , zhuanji_info where singer_info.singer_id=music_info.singer_id "
				+ "and music_info.zhuanji_id = zhuanji_info.zhuanji_id order by music_visits limit ?,?";
		List<Music_info> music_infos = DbUtil.selectInfo(Music_info.class, sql , (page-1)*10 , 20);		
		
		if(music_infos.size() == 0){
			return "ERROR";
		}
		
		return JSONArray.fromObject(music_infos).toString();
	}

}
