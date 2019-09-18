package com.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinyinUtil {
	/**
	 * 将中文转换成拼音首字母
	 */
	public static String toHead(String chinese){
		String pinyinName = "";
		char[] pinyins = chinese.toCharArray();
		HanyuPinyinOutputFormat hpf = new HanyuPinyinOutputFormat();
		hpf.setCaseType(HanyuPinyinCaseType.UPPERCASE);
		hpf.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		
		for (char c : pinyins) {
			try {
				pinyinName += PinyinHelper.toHanyuPinyinStringArray(c , hpf)[0].charAt(0);
			} catch (Exception e) {
				pinyinName += c;
			}
		}
		return pinyinName;
	}
	/**
	 * 将中文转换成全拼
	 */
	public static String toAll(String chinese){
		String pinyinName = "";
		char[] pinyins = chinese.toCharArray();
		HanyuPinyinOutputFormat hpf = new HanyuPinyinOutputFormat();
		hpf.setCaseType(HanyuPinyinCaseType.UPPERCASE);
		hpf.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		
		for (char c : pinyins) {
			try {
				pinyinName += PinyinHelper.toHanyuPinyinStringArray(c , hpf)[1];
			} catch (Exception e) {
				try{
					pinyinName += PinyinHelper.toHanyuPinyinStringArray(c , hpf)[0];
				}catch(Exception e1){
					pinyinName += c;
				}	
			}
		}
		return pinyinName;
	}
}
