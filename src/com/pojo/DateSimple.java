package com.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateSimple {
	private Date zhuanji_date;

	public Date getZhuanji_date() {
		return zhuanji_date;
	}

	public void setZhuanji_date(Date zhuanji_date) {
		this.zhuanji_date = zhuanji_date;
	}
	
	public void update(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String date = sdf.format(zhuanji_date);
		try {
			zhuanji_date = sdf.parse(date);
			//System.out.println(zhuanji_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean equals(Object obj) {
		
		if(obj instanceof DateSimple){
			if(this.zhuanji_date.getTime() == ((DateSimple)obj).getZhuanji_date().getTime()){
				return true;
			}
		}
		return false;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.zhuanji_date.toString();
	}
}
