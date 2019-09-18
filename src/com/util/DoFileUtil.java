package com.util;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.SequenceInputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

public class DoFileUtil {
	private byte[] data = null;
	private ByteArrayOutputStream out = new ByteArrayOutputStream();
	public Map<String , String > doFiles(HttpServletRequest request , Integer maxSize ,String path , HttpServletResponse response){
		
		Map<String, String> map = new HashMap<String, String>();
		try {
			MultipartParser mr = new MultipartParser(request , maxSize);	
			mr.setEncoding("utf-8");	
			Part part = null;
			
			while((part = mr.readNextPart()) != null){
				if(part.isFile()){
					FilePart filePart = (FilePart)part;	
					String fileName = filePart.getFileName();
					filePart.writeTo(out);
					data = out.toByteArray();
					out.close();
					//System.out.println(path);
					if(new File(path).exists()){
					//	System.out.println(path);
						ByteArrayInputStream in = new ByteArrayInputStream(data);
						BufferedInputStream bi = new BufferedInputStream(new FileInputStream(path));
						AudioInputStream audio1 = AudioSystem.getAudioInputStream(bi);
						AudioInputStream audio2 = AudioSystem.getAudioInputStream(in);
						AudioInputStream audioBuild = new AudioInputStream(
							 new SequenceInputStream(audio1, audio2),
					         audio1.getFormat(),
					         audio1.getFrameLength() +
					               audio2.getFrameLength()
					    );	
						AudioSystem.write(audioBuild, AudioFileFormat.Type.WAVE, new File(path+"soft"));
						audioBuild.close();
						audio2.close();
						audio1.close();
						bi.close();
						in.close();
						byte[] dd = new byte[1024];
						int len = 0;
						FileInputStream fi = new FileInputStream(path+"soft");
						FileOutputStream fo = new FileOutputStream(path);
						while((len = fi.read(dd)) != -1){
							fo.write(dd , 0 , len);
						}
						fi.close();
						fo.close();
						new File(path+"soft").delete();
						if(request.getParameter("flag") != null && request.getParameter("flag").equals("0")){
							response.getWriter().print("[{\"status\":\"200\"}]");
						}
					}else{
						FileOutputStream fp = new FileOutputStream(path);
						fp.write(data);
						fp.close();
					}
					map.put(filePart.getName(), fileName);
				}else if(part.isParam()){
					ParamPart paramPart = (ParamPart)part;
					String key = paramPart.getName();
					String value = paramPart.getStringValue();
					map.put(key, value);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return map;
	}
	public byte[] getData() {
		return data;
	}
}
