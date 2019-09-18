package com.pojo;

public class Music_list {
	//歌曲id
	private Integer music_id = null;
	//歌曲名字
	private String music_name = null;
	//歌曲分组
	private String group_name = null;
	//分组id
	private Integer group_id = null;
	//歌手海报
	private String singer_img = null;
	//歌手id
	private Integer singer_id = null;
	//歌手姓名
	private String singer_name = null;
	//保存歌词地址
	private String music_lrc = null;
	
	public String getMusic_lrc() {
		return music_lrc;
	}
	public void setMusic_lrc(String music_lrc) {
		this.music_lrc = music_lrc;
	}
	public Integer getMusic_id() {
		return music_id;
	}
	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public String getSinger_img() {
		return singer_img;
	}
	public void setSinger_img(String singer_img) {
		this.singer_img = singer_img;
	}
	public Integer getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(Integer singer_id) {
		this.singer_id = singer_id;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
}
