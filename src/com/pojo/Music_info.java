package com.pojo;


public class Music_info {
	private Integer music_id;
	private Integer singer_id;
	private String music_name;
	private String music_visits;
	private String music_lrc;
	private String music_isworking;
	private String music_usevip;
	private Integer zhuanji_id;
	private String singer_name;
	private String zhuanji_name;
	private String singer_img ;
	private String time ;
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSinger_img() {
		return singer_img;
	}
	public void setSinger_img(String singer_img) {
		this.singer_img = singer_img;
	}
	public String getZhuanji_name() {
		return zhuanji_name;
	}
	public void setZhuanji_name(String zhuanji_name) {
		this.zhuanji_name = zhuanji_name;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
	public Integer getMusic_id() {
		return music_id;
	}
	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}
	public Integer getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(Integer singer_id) {
		this.singer_id = singer_id;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getMusic_visits() {
		return music_visits;
	}
	public void setMusic_visits(String music_visits) {
		this.music_visits = music_visits;
	}
	public String getMusic_lrc() {
		return music_lrc;
	}
	public void setMusic_lrc(String music_lrc) {
		this.music_lrc = music_lrc;
	}
	public String getMusic_isworking() {
		return music_isworking;
	}
	public void setMusic_isworking(String music_isworking) {
		this.music_isworking = music_isworking;
	}
	public String getMusic_usevip() {
		return music_usevip;
	}
	public void setMusic_usevip(String music_usevip) {
		this.music_usevip = music_usevip;
	}
	public Integer getZhuanji_id() {
		return zhuanji_id;
	}
	public void setZhuanji_id(Integer zhuanji_id) {
		this.zhuanji_id = zhuanji_id;
	}
	
	@Override
	public int hashCode() {
		return this.music_id;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj == null){
			return false;
		}
		if(obj instanceof Music_info){
			if(((Music_info)obj).getMusic_id().intValue() == this.music_id.intValue()){
				return true;
			}
		}
		return false;
	}
}
