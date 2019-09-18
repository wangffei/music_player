package com.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import net.sf.json.JSONArray;

import com.pojo.Recorder_info;
import com.pojo.recorder_playing;
import com.util.DbUtil;

public class RecorderDao {
	public static String getRecorderlist(){
		String sql = "select recorder_name,userinfo.user_realname,recorder_id,recorder_time,recorder_desc,recorder_img,wav_url from recorder_info,userinfo "
				+ "where recorder_info.singer_id = userinfo.username";
		
		List<Recorder_info> list = DbUtil.selectInfo(Recorder_info.class, sql);
		
		return JSONArray.fromObject(list).toString();
	}

	public static void stop_recorder(String filename , String key , String time) throws FileNotFoundException {
		System.out.println(key);
		String sql = "select _name,_desc,img,username from recorder_playing where id=?";
		List<recorder_playing> list_playing = DbUtil.selectInfo(recorder_playing.class, sql, key);
		if(list_playing.size() == 0){
			return;
		}
		sql = "delete from recorder_playing where id=?";
		DbUtil.updateInfo(sql, key);
		sql = "insert into recorder_info(recorder_name , singer_id , recorder_time , recorder_desc , recorder_img , wav_url) "
				+ "values(?,?,?,?,?,?)";
		Integer _key = DbUtil.updateInfo_key(sql, list_playing.get(0).get_name() , list_playing.get(0).getUsername() , time 
				,list_playing.get(0).get_desc() , list_playing.get(0).getImg() , "recorder/wav/"+filename);
		String path = RecorderDao.class.getClassLoader().getResource("../../recorder/wav").getFile();
		//System.out.println(_key);
		if(!new File(path+"/"+filename+".wav").renameTo(new File(path+"/"+_key+".wav"))){
			System.out.println("重命名失败 ， 尝试复制文件");
			//System.gc();
			FileInputStream in = new FileInputStream(path+"/"+filename+".wav");
			FileOutputStream out = new FileOutputStream(path+"/"+_key+".wav");
			byte[] buf = new byte[1024];
			int len = 0;
			try {
				while((len = in.read(buf)) != -1){
					out.write(buf,0,len);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			new File(path+"/"+filename+".wav").renameTo(new File(path+"/soft"));
		}
		sql = "update recorder_info set wav_url = ? where recorder_id = ?";
		DbUtil.updateInfo(sql, "recorder/wav/"+_key+".wav" , _key);
	}

	public static String playing_list() {
		String sql = "select id , _name , _desc , img , username , filename from recorder_playing";
		List<recorder_playing> list = DbUtil.selectInfo(recorder_playing.class, sql);
		//System.out.println(JSONArray.fromObject(list).toString());
		return JSONArray.fromObject(list).toString();
	}
}
