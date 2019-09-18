package com.pojo;

import java.util.List;

public class MainShow {
	private List<Lunbo> lunbo;
	private List<Music_info> music_info;
	private List<Singer_info> singer_info;
	private List<Zhuanji_info> zhuanji_info;
	
	public List<Lunbo> getLunbo() {
		return lunbo;
	}
	public void setLunbo(List<Lunbo> lunbo) {
		this.lunbo = lunbo;
	}
	public List<Music_info> getMusic_info() {
		return music_info;
	}
	public void setMusic_info(List<Music_info> music_info) {
		this.music_info = music_info;
	}
	public List<Singer_info> getSinger_info() {
		return singer_info;
	}
	public void setSinger_info(List<Singer_info> singer_info) {
		this.singer_info = singer_info;
	}
	public List<Zhuanji_info> getZhuanji_info() {
		return zhuanji_info;
	}
	public void setZhuanji_info(List<Zhuanji_info> zhuanji_info) {
		this.zhuanji_info = zhuanji_info;
	}
	@Override
	public String toString() {
		return lunbo.toString()+"\n"+music_info.toString()+"\n"+singer_info.toString()+"\n"+zhuanji_info.toString();
	}
}
