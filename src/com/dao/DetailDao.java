package com.dao;

import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.pojo.MainShow;
import com.pojo.Music_info;
import com.pojo.Recorder_info;
import com.pojo.Singer_info;
import com.pojo.Zhuanji_info;
import com.pojo.recorder_playing;
import com.util.DbUtil;
import com.util.JSONDateProcessor;
import com.util.QrcodeMadeUtil;

/**
 * @function 查询各种详情
 * @author 王飞
 * @date 2018-11-29
 */
public class DetailDao {

	public static String getZhuanji(String zhuanji_id) {
		MainShow main = new MainShow();
		
		String sql = "select zhuanji_name , location , zhuanji_date , zhuanji_id , zhuanji_info.singer_id , singer_name , zhuanji_img from "
				+ "zhuanji_info , singer_info where zhuanji_id = ? and zhuanji_info.singer_id = singer_info.singer_id ";	
		List<Zhuanji_info> zhuanji_infos = DbUtil.selectInfo(Zhuanji_info.class, sql, zhuanji_id);
		
		sql = "select music_name , music_id , singer_info.singer_name ,music_info.singer_id from singer_info , "
				+ "music_info where music_info.zhuanji_id = ? "
				+ "and music_info.singer_id = singer_info.singer_id";
		List<Music_info> music_infos = DbUtil.selectInfo(Music_info.class, sql, zhuanji_id);
		
		main.setMusic_info(music_infos);
		main.setZhuanji_info(zhuanji_infos);
		
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"lunbo","singer_info"});
		config.registerJsonValueProcessor(Date.class, new JSONDateProcessor());
		
		return JSONArray.fromObject(main , config).toString();
	}

	public static String getSinger(String singer_id) {
		MainShow main = new MainShow();
		
		String sql = "select singer_name ,singer_id, singer_borndate , singer_location , singer_desc , singer_img from singer_info where singer_id = ?";
		List<Singer_info> singer_infos = DbUtil.selectInfo(Singer_info.class, sql, singer_id);
		
		sql = "select zhuanji_name , zhuanji_id , zhuanji_img , zhuanji_date , location from zhuanji_info where singer_id = ?";
		List<Zhuanji_info> zhuanji_infos = DbUtil.selectInfo(Zhuanji_info.class, sql, singer_id);
		
		sql = "select music_id , music_name , zhuanji_name , music_info.zhuanji_id from zhuanji_info , music_info where "
				+ "music_info.singer_id = ? and zhuanji_info.zhuanji_id = music_info.zhuanji_id order by music_visits limit 0,10" ;
		List<Music_info> music_infos = DbUtil.selectInfo(Music_info.class, sql, singer_id);
		
		main.setMusic_info(music_infos);
		main.setSinger_info(singer_infos);
		main.setZhuanji_info(zhuanji_infos);
		
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"lunbo"});
		config.registerJsonValueProcessor(Date.class, new JSONDateProcessor());
		
		return JSONArray.fromObject(main , config).toString();
	}

	public static BufferedImage getQrcode(String id, String data , Integer status) throws FileNotFoundException, IOException {
		String sql = null;
		List list = null;
		if(status == 2){
			sql = "select zhuanji_img from zhuanji_info where zhuanji_id=?";
			list = DbUtil.selectInfo(Zhuanji_info.class, sql, id);
		}else if(status == 1){
			sql = "select singer_img from singer_info where singer_id=?";
			list = DbUtil.selectInfo(Singer_info.class, sql, id);
		}
		//System.out.println(((Singer_info)list.get(0)).getSinger_img());
		if(list.size() > 0){
			String filePath = null;
			//通过本地图片获取二维码
			if(status == 2){
				filePath = DetailDao.class.getClassLoader().getResource("../../singer_image/"+((Zhuanji_info)list.get(0)).getZhuanji_img()+".jpg").getPath();
				return QrcodeMadeUtil.getCode(filePath, data);
			//从网上获取图片获取二维码
			}else if(status == 1){
				filePath = ((Singer_info)list.get(0)).getSinger_img();
				return QrcodeMadeUtil.getCode(new URL(filePath), data);
			}
		}
		
		return null;
	}

	public static BufferedImage getQrcode(String data, String pic_url) throws FileNotFoundException, MalformedURLException, IOException {
		return QrcodeMadeUtil.getCode(new URL(pic_url), data);
	}

	public static Music_info getMusicinfo(String music_id) {
		String sql = "select singer_img ,time, singer_info.singer_id, singer_name , music_name from music_info , singer_info where music_info.singer_id = singer_info.singer_id and music_id=?";
		
		List<Music_info> list = DbUtil.selectInfo(Music_info.class, sql, music_id);
		
		if(list.size() > 0){
			return list.get(0);
		}
		
		return null;
	}

	public static String getRecorder(String recorder_id) {
		String sql = "select recorder_name,userinfo.user_realname,recorder_time,recorder_desc,recorder_img,wav_url from recorder_info,userinfo "
				+ "where recorder_id=? and recorder_info.singer_id = userinfo.username";
		
		List<Recorder_info> list = DbUtil.selectInfo(Recorder_info.class, sql, recorder_id);
		
		return JSONArray.fromObject(list).toString();
	}

	public static String getPlaying_data(String id) {
		String sql = "select id , _name , _desc , img , user_realname , filename from recorder_playing,userinfo where id=? and recorder_playing.username = userinfo.username";
		List<recorder_playing> list = DbUtil.selectInfo(recorder_playing.class, sql,id);
		return JSONArray.fromObject(list).toString();
	}
	
}
