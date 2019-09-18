package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;

public class WavUtil {
	private int headlength1 = 0;
	private int headlength2 = 0;

	/*
	* 16进制字节数组转换成int
	*/
	public static int byteArrayToInt(byte[] b) {
		return b[3] & 0xFF | (b[2] & 0xFF) << 8 | (b[1] & 0xFF) << 16 | (b[0] & 0xFF) << 24;
	}
	
	/**
	* int转换成16进制字节数组
	*/
	public static byte[] intToByteArray(int a) {
		return new byte[] { (byte) ((a >> 24) & 0xFF), (byte) ((a >> 16) & 0xFF), (byte) ((a >> 8) & 0xFF),(byte) (a & 0xFF) };
	}
	
	/**
	* 字节数组的转换 0x00 00 27 56在内存中的位置是56 27 00 00 所以要反过来
	*/
	public static byte[] byteToByte(byte[] a) {
		if (a.length == 4) {
			byte[] b = new byte[4];
			b[0] = a[3];
			b[1] = a[2];
			b[2] = a[1];
			b[3] = a[0];
			return b;
		}
		return null;
	}
	
	/**
	* 将两个wav合成一个新的wav
	*/
	public void addWav(String filepath1, InputStream is2, String filepath3) throws IOException {
		File file1 = new File(filepath1);
		//System.out.println("1.wav:" + -file1.length());
		File file3 = new File(filepath3);
		if (!file3.exists()) {
			file3.createNewFile();
		}
		InputStream is1 = new FileInputStream(file1);
		OutputStream os = new FileOutputStream(file3);// 追加
		byte[] tempbuffer = new byte[1024];
		int nRed = 0;
		while ((nRed = is1.read(tempbuffer)) != -1)// 将1.wav全部内容复制到3.wav
		{
			os.write(tempbuffer, 0, nRed);
			os.flush();
		}

		is1.close();
		is2.skip(44);// 跳过2.wav的文件头
		while ((nRed = is2.read(tempbuffer)) != -1)// 将2.wav全部内容追加复制到3.wav结尾处
		{
			os.write(tempbuffer, 0, nRed);
			os.flush();
		}
		is2.close();
		os.close();
		// 到此完成了1.wav和2.wav合并成3.wav,但是此时播放3.wav,会发现大小虽然是1.wav和2.wav的和
		// 但是音频内容仍然只是第一个音频的内容，所以还要更改3.wav的文件头

	}
	
	/**
	* 更改addWav.wav.wav的文件头
	*/
	public void updateFileHead(String filepath3, boolean ifUpdate) throws IOException {
		RandomAccessFile raf = new RandomAccessFile(filepath3, "rw");
		long filelength = raf.length();
		System.out.println(filepath3 + filelength);
		// 打开一个文件通道
		FileChannel channel = raf.getChannel();
		// 映射文件中的某一部分数据以读写模式到内存中
		MappedByteBuffer buffer = channel.map(FileChannel.MapMode.READ_WRITE, 0, 44);// 文件头长度
		byte[] b = new byte[4];
		b[0] = buffer.get(4);
		b[1] = buffer.get(5);
		b[2] = buffer.get(6);
		b[3] = buffer.get(7);
		int length1 = WavUtil.byteArrayToInt(WavUtil.byteToByte(b));
		System.out.println(length1);// 显示data+44-8
		
		byte[] b1 = new byte[4];
		b1[0] = buffer.get(40);
		b1[1] = buffer.get(41);
		b1[2] = buffer.get(42);
		b1[3] = buffer.get(43);
		int length2 = WavUtil.byteArrayToInt(WavUtil.byteToByte(b1));
		System.out.println(length2);
		if (ifUpdate){// 修改头部文件
			byte[] head1 = this.byteToByte(this.intToByteArray(headlength1));
			byte[] head2 = this.byteToByte(this.intToByteArray(headlength2));
			// 进行修改操作
			buffer.put(4, head1[0]);
			buffer.put(5, head1[1]);
			buffer.put(6, head1[2]);
			buffer.put(7, head1[3]);
			buffer.put(40, head2[0]);
			buffer.put(41, head2[1]);
			buffer.put(42, head2[2]);
			buffer.put(43, head2[3]);
			
			buffer.force();// 强制输出，在buffer中的改动生效到文件
			System.out.println("文件头修改成功");
			/**************************************** 进行查询，看修改是否生效 ***************/
			
			b = new byte[4];
			b[0] = buffer.get(4);
			b[1] = buffer.get(5);
			b[2] = buffer.get(6);
			b[3] = buffer.get(7);
			length1 = WavUtil.byteArrayToInt(WavUtil.byteToByte(b));
			System.out.println(length1);// 显示data+44-8
			b1 = new byte[4];
			
			b1[0] = buffer.get(40);
			b1[1] = buffer.get(41);
			b1[2] = buffer.get(42);
			b1[3] = buffer.get(43);
			length2 = WavUtil.byteArrayToInt(WavUtil.byteToByte(b1));
			System.out.println(length2);
		
		} else {
			this.headlength1 = this.headlength1 + length1;
			this.headlength2 = this.headlength2 + length2;	
		}
		
		buffer.clear();
		channel.close();
		raf.close();
		
	}
}
