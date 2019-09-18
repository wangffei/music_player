package com.pojo;

import java.util.List;

/**
 * @function 用于保存专辑分类
 * @author 王飞
 * @date 20188-11-29
 */
public class Zhuanji_type {
	private List<Zhuanji_info> tuijian ;
	private List<Zhuanji_info> huayu ;
	private List<Zhuanji_info> oumei ;
	private List<Zhuanji_info> hanguo ;
	private List<Zhuanji_info> yinyueren ;
	
	public List<Zhuanji_info> getTuijian() {
		return tuijian;
	}
	public void setTuijian(List<Zhuanji_info> tuijian) {
		this.tuijian = tuijian;
	}
	public List<Zhuanji_info> getHuayu() {
		return huayu;
	}
	public void setHuayu(List<Zhuanji_info> huayu) {
		this.huayu = huayu;
	}
	public List<Zhuanji_info> getOumei() {
		return oumei;
	}
	public void setOumei(List<Zhuanji_info> oumei) {
		this.oumei = oumei;
	}
	public List<Zhuanji_info> getHanguo() {
		return hanguo;
	}
	public void setHanguo(List<Zhuanji_info> hanguo) {
		this.hanguo = hanguo;
	}
	public List<Zhuanji_info> getYinyueren() {
		return yinyueren;
	}
	public void setYinyueren(List<Zhuanji_info> yinyueren) {
		this.yinyueren = yinyueren;
	}
}
