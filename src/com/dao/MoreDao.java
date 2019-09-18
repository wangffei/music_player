package com.dao;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.pojo.DateSimple;
import com.pojo.Music_info;
import com.pojo.Singer_info;
import com.pojo.Zhuanji_info;
import com.pojo.Zhuanji_type;
import com.util.DbUtil;
import com.util.JSONDateProcessor;

//用于处理更多功能 的dao
public class MoreDao {
	
	//处理专辑
	public static String getZhuanji_type() {
		Zhuanji_type type = new Zhuanji_type();
		
		String sql = "select zhuanji_id , zhuanji_date , singer_info.singer_name , zhuanji_img , zhuanji_name from zhuanji_info , singer_info "
				+ "where zhuanji_info.singer_id = singer_info.singer_id order by visitis limit 0,10";
		type.setTuijian(DbUtil.selectInfo(Zhuanji_info.class, sql));
		
		sql = "select zhuanji_id , zhuanji_img , zhuanji_date , singer_info.singer_name , zhuanji_name from zhuanji_info, singer_info where location='华语' "
				+ "and zhuanji_info.singer_id = singer_info.singer_id order by visitis limit 0,10";
		type.setHuayu(DbUtil.selectInfo(Zhuanji_info.class, sql));
		
		sql = "select zhuanji_id , zhuanji_img , zhuanji_date , singer_info.singer_name , zhuanji_name from zhuanji_info, singer_info where location='欧美' "
				+ "and zhuanji_info.singer_id = singer_info.singer_id order by visitis limit 0,10";
		type.setOumei(DbUtil.selectInfo(Zhuanji_info.class, sql));
		
		sql = "select zhuanji_id , zhuanji_img , zhuanji_date , singer_info.singer_name , zhuanji_name from zhuanji_info, singer_info where location='韩国' "
				+ "and zhuanji_info.singer_id = singer_info.singer_id order by visitis limit 0,10";
		type.setHanguo(DbUtil.selectInfo(Zhuanji_info.class, sql));
		
		sql = "select zhuanji_id , zhuanji_img , zhuanji_date , singer_info.singer_name , zhuanji_name from zhuanji_info, singer_info where location='音乐人' "
				+ "and zhuanji_info.singer_id = singer_info.singer_id order by visitis limit 0,10";
		type.setYinyueren(DbUtil.selectInfo(Zhuanji_info.class, sql));
		
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new JSONDateProcessor());
		return JSONArray.fromObject(type , config).toString();
	}
	//获取歌手信息
	public static String getSinger_info(){
		String sql = "select singer_id , singer_name , singer_borndate ,singer_img from singer_info order by singer_visits limit 0,10";	
		List<Singer_info> list = DbUtil.selectInfo(Singer_info.class, sql);
		
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new JSONDateProcessor());
		
		return JSONArray.fromObject(list, config).toString();
	}
	//获取专辑分类信息
	public static String doGetDate(String data) {
		Set<DateSimple> set = null;
		if("推荐".equals(data)){
			String sql = "select zhuanji_date from zhuanji_info group by zhuanji_date order by visitis";
			List<DateSimple> list = DbUtil.selectInfo(DateSimple.class, sql);
			for (DateSimple dateSimple : list) {
				dateSimple.update();
			}
			set = new HashSet<DateSimple>(list);		
		}else{
			String sql = "select zhuanji_date from zhuanji_info where location=? group by zhuanji_date ";
			List<DateSimple> list = DbUtil.selectInfo(DateSimple.class, sql , data);
			for (DateSimple dateSimple : list) {
				dateSimple.update();
			}
			set = new HashSet<DateSimple>(list);	
		}
		//System.out.println(set.toString());
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new JSONDateProcessor());
		
		return JSONArray.fromObject(set , config).toString();
	}
	//获取歌手分页信息
	public static Integer getPageCount(){
		String sql = "select count(*) from singer_info";
		
		Integer count = DbUtil.unionQuery(sql);
		
		return count % 10 ==0 ?count/10 : count / 10 +1; 
	}
	//获取歌曲信息
	public static String getMusicinfo(){
		String sql = "select music_id , zhuanji_info.zhuanji_id , music_name ,zhuanji_name, music_info.singer_id , singer_info.singer_name from "
				+ " singer_info , music_info , zhuanji_info where singer_info.singer_id=music_info.singer_id "
				+ "and music_info.zhuanji_id = zhuanji_info.zhuanji_id order by music_visits limit 0,20";
		List<Music_info> music_infos = DbUtil.selectInfo(Music_info.class, sql);
		
		return JSONArray.fromObject(music_infos).toString();
	}
	//获取歌曲分页信息
	public static Integer getMusicPageCount(){
		String sql="select count(*) from music_info" ;
		Integer count = DbUtil.unionQuery(sql);
		
		return count % 20 ==0 ?count/20 : count / 20 +1; 
	}
}
