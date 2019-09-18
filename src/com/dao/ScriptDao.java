package com.dao;

import java.util.List;

import com.pojo.Lunbo;
import com.pojo.MainShow;
import com.pojo.Music_info;
import com.pojo.Singer_info;
import com.pojo.Zhuanji_info;
import com.util.DbUtil;

/**
 * @function 处理脚本请求
 * @author 王飞
 * @date 2018-11-28
 */
public class ScriptDao {
	//获取主页面的数据
	public static MainShow doMain() {
		
		String sql = "select singer_id , singer_img , singer_name from singer_info order by singer_visits limit 0,10";
		List<Singer_info> singer_infos = DbUtil.selectInfo(Singer_info.class, sql);
		
		sql = "select music_id , music_name ,zhuanji_name, music_info.singer_id , singer_info.singer_name from "
				+ " singer_info , music_info , zhuanji_info where singer_info.singer_id=music_info.singer_id "
				+ "and music_info.zhuanji_id = zhuanji_info.zhuanji_id order by music_visits limit 0,12";
		List<Music_info> music_infos = DbUtil.selectInfo(Music_info.class, sql);
		
		sql = "select zhuanji_id , zhuanji_img, zhuanji_name , singer_info.singer_name from zhuanji_info,singer_info "
				+ "where zhuanji_info.singer_id=singer_info.singer_id order by visitis limit 0,9";
		List<Zhuanji_info> zhuanji_infos = DbUtil.selectInfo(Zhuanji_info.class, sql);
		
		sql = "select pic from lunbo where isworking = 'yes'";
		List<Lunbo> lunbos = DbUtil.selectInfo(Lunbo.class, sql);
		
		MainShow main = new MainShow();
		main.setMusic_info(music_infos);
		main.setSinger_info(singer_infos);
		main.setZhuanji_info(zhuanji_infos);
		main.setLunbo(lunbos);
		
		return main;
	}
	
}
