package com.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/recorder")
public class WebSocket {
	//保存用户的连接
	private static Map<String, List<WebSocket>> connect = new HashMap<String, List<WebSocket>>();
	//新接入的临时集合
	private static Map<String, List<WebSocket>> temp = new HashMap<String, List<WebSocket>>();
	//保存主播的连接
	private static Map<String, WebSocket> recorder = new HashMap<String, WebSocket>();
	private Session session = null;
	
	@OnOpen
	public void onOpen(Session session){
//		System.out.println("laile");
		this.session = session;
//		System.out.println(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		System.out.println("temp"+temp);
		System.out.println("connect"+connect);
		System.out.println("recorder"+recorder);
		//直播者播放背景音乐时{'volume':'','music_url':'','currentTime':'','time':''}
		if(message.startsWith("MESSAGE_RECORDER_MUSIC")){
			String filename = message.substring(message.indexOf('|')+1);
			String value = message.substring(0,message.indexOf('|'));
//			System.out.println(filename);
			List<WebSocket> list = connect.get(filename);
			if(list == null){
				return;
			}
			for (WebSocket webSocket : list) {
//				System.out.println(webSocket.session);
				webSocket.session.getBasicRemote().sendText(value);
			}
		}
		//主播调节声音大小{'volume':''}
		if(message.startsWith("MESSAGE_RECORDER_VOLUME")){
			String filename = message.substring(message.indexOf('|')+1);
			String value = message.substring(0,message.indexOf('|'));
			List<WebSocket> list = connect.get(filename);
			if(list == null){
				return;
			}
			for (WebSocket webSocket : list) {
				webSocket.session.getBasicRemote().sendText(value);
			}
		}
		//给新加入用户刷新背景音乐
		if(message.startsWith("MESSAGE_RECORDER_NEWPERSON_JOIN")){
			String filename = message.substring(message.indexOf('|')+1);
			String value = message.substring(0,message.indexOf('|'));
			List<WebSocket> list = temp.get(filename);
			if(list == null){
				return;
			}
			for (WebSocket webSocket : list) {
				webSocket.session.getBasicRemote().sendText(value);
			}
			list.clear();
		}
		//主播跳转音乐时{'currentTime':''}
		if(message.startsWith("MESSAGE_RECORDER_CURRENTTIME")){
			String filename = message.substring(message.indexOf('|')+1);
			String value = message.substring(0,message.indexOf('|'));
			List<WebSocket> list = connect.get(filename);
			if(list == null){
				return;
			}
			for (WebSocket webSocket : list) {
				webSocket.session.getBasicRemote().sendText(value);
			}
		}
		//观众退出时
		if(message.startsWith("MESSAGE_RECORDER_CLOSE_PER")){
			message = message.replace("MESSAGE_RECORDER_CLOSE_PER", "");
			List<WebSocket> key = connect.get(message);
			if(key == null){
				return;
			}
			key.remove(this);
		}
		//主播接入时
		if(message.startsWith("MESSAGE_RECORDER_JOIN")){
			message = message.replace("MESSAGE_RECORDER_JOIN", "");
			recorder.put(message, this);
//			System.out.println("主播laile");
		}
		//观众接入时
		if(message.startsWith("MESSAGE_RECORDER_PERSON")){
			message = message.replace("MESSAGE_RECORDER_PERSON", "");
//			System.out.println("有观众加入");
			List<WebSocket> key = connect.get(message);
			if(key == null || key.size() == 0){
				key = new ArrayList<WebSocket>();
				connect.put(message, key);
			}
			key.add(this);
			List<WebSocket> tp = temp.get(message);
			if(tp == null || tp.size() == 0){
				tp = new ArrayList<WebSocket>();
				temp.put(message, tp);
			}
			tp.add(this);
			WebSocket webSocket = recorder.get(message);
			System.out.println(message);
			if(webSocket == null){
				return;
			}
			webSocket.session.getBasicRemote().sendText("MESSAGE_RECORDER_NEWPERSON_JOIN");
		}
		//主播停播时
		if(message.startsWith("MESSAGE_RECORDER_CLOSE")){
			message = message.replace("MESSAGE_RECORDER_CLOSE", "");
			connect.remove(message);
		}
	}
	
	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);
		//this.session.getAsyncRemote().sendText(message);
	}
}
