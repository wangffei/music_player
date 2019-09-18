package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JSONDateProcessor implements JsonValueProcessor{

	@Override
	public Object processArrayValue(Object arg0, JsonConfig arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object processObjectValue(String arg0, Object value, JsonConfig arg2) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(value instanceof Date){
			return sdf.format(value);
		}
		
		return null;
	}
	
}
