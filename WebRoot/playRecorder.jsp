<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'playRecorder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		*{margin:0px;padding:0px;}
		li{list-style:none;}
		a{color:black;text-decoration: none;}
		
		#audio{
			display:none;
		}
		#container{
			width:80%;
			margin:0px auto;
		}
		#container .left-top{
			width:70%;
			border-right:1px solid black;
			border-left:1px solid black;
			height:160px;
			float:left;
		}
		#container .right{
			height:100%;
			width:29%;
			float:right;
			border-right:1px solid black;
		}
		#container .left-bottom{
			width:70%;
			border-right:1px solid black;
			border-top:1px solid black;
			border-left:1px solid black;
			float:left;
		}
		.left-top ul li{
			float:left;
		}
		.left-top ul li:nth-child(1){
			width:136px;
			height:136px;
			margin:12px 30px 0px 50px;
			background:gray;
		}
		.left-top ul li:nth-child(2){
			margin-top:14px;
			font-size:26px;
			width:380px;
		}
		.left-top ul li:nth-child(3){
			margin-top:30px;
		}
		.right ul{
			width:80%;
			margin:14px auto;
		}
		.right ul li:nth-child(1){
			margin:0px 0px 40px 0px;
		}
	</style>
  </head>
  <script>var data = ${data};</script>
  <body>
  	<audio id="audio1" src=""></audio>
  	<audio id="audio2" src=""></audio><!-- controls="controls" -->
  	<audio id="audio3" src=""></audio>
    <div id="container">
		<div class="left-top">
			<ul>
				<li><img style="width:130px;height:130px;display:block;margin:3px;"></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<div class="right">
			<ul>
				<img src="img/recorder_right.png">
			</ul>
		</div>
		<div class="left-bottom">
			<p style="width:80%;margin:30px auto;font-size:14px;color:gray;"></p>
		</div>
	</div>
  </body>
  <script src="js/jquery.min.js"></script>
  <script>
  	$(function(){
  		var websocket = null;
  		if("WebSocket" in window){
  			websocket = new WebSocket("ws://localhost:8080/music_player/recorder");
  			//alert("连接成功")
  		}else{
  			alert("您的浏览器不支持websocket")
  		}
  		//alert(websocket)
  		websocket.onopen = function(event){
  			websocket.send("MESSAGE_RECORDER_PERSON"+data[0].filename)
  		}
  		//接入电台时
  		websocket.onmessage = function(event){
  			var message = event.data
  			console.log(message)
  			if(message.indexOf("MESSAGE_RECORDER_MUSIC") == 0){
  				message = "["+message.replace("MESSAGE_RECORDER_MUSIC","")+"]"
  				message = eval(message)
  				$("#audio3").attr("src",message[0].music_url)
  				$("#audio3")[0].currentTime = message[0].currentTime
  				$("#audio3")[0].volume = message[0].volume
  				$("#audio3")[0].play()
  			}
  			if(message.indexOf("MESSAGE_RECORDER_VOLUME") == 0){
  				message = "["+message.replace("MESSAGE_RECORDER_VOLUME","")+"]"
  				message = eval(message)
  				$("#audio3")[0].volume = message[0].volume
  			}
  			if(message.indexOf("MESSAGE_RECORDER_CURRENTTIME") == 0){
  				message = "["+message.replace("MESSAGE_RECORDER_CURRENTTIME","")+"]"
  				message = eval(message)
  				$("#audio3")[0].currentTime = message[0].currentTime
  			}
  			if(message.indexOf("MESSAGE_RECORDER_NEWPERSON_JOIN") == 0){
  				message = "["+message.replace("MESSAGE_RECORDER_NEWPERSON_JOIN","")+"]"
  				message = eval(message)
  				$("#audio3").attr("src",message[0].music_url)
  				$("#audio3")[0].currentTime = message[0].currentTime
  				$("#audio3")[0].volume = message[0].volume
  				$("#audio3")[0].play()
  			}
  		}
  		window.onbeforeunload = function () {
			websocket.send("MESSAGE_RECORDER_CLOSE_PER"+data[0].filename);
			websocket.close();
	    }
  	})
  </script>
  <script>
   $(function(){
		$(".left-bottom").css("height",$(document).height()-161)
	   
		$(".left-top ul li:eq(1)").html('<img src="img/recorder_png.png">'+(data[0]._name.length > 15 ? data[0]._name.substring(0,15) : data[0]._name))
		$(".left-top ul li:eq(0) img").attr("src","recorder/image/"+data[0].img)
		$(".left-top ul li:eq(2)").html("作者:"+data[0].user_realname)
		
		$(".left-bottom p").html(data[0]._desc)
	})
  	$(function(){
  		var recorder_id = data[0].filename
  		console.log(data[0].filename)
  	  	function get_status(){
  	  		$.ajax({
  	  	  		type:"GET",
  	  	  		url:"recorder.do?method=play&recorder_id="+recorder_id+"&time="+new Date().getTime(),
  	  	  		success:function(data){
  	  	  			console.log(data)
  	  	  			if(data == "OK"){
  	  	  				$("#audio1").attr("src","recorder.do?method=play_recorder&recorder_id="+recorder_id+"&rand="+new Date().getTime())
  	  	  				$("#audio1")[0].play()
  	  	  				window.setTimeout(audio2, 15000)
  	  	  				//window.setTimeout(play2,20000)
  	  	  			}else{
  	  	  				window.setTimeout(get_status, 1000)
  	  	  			}
  	  	  		},error:function(){
  	  	  			console.log("网络异常")
  	  	  		}
  	  	  	})
  	  	}
  		window.setTimeout(get_status, 1000)
  		
  		$("#audio1")[0].addEventListener("ended",function(){
  			window.setTimeout(audio1, 15000)
  			$("#audio2")[0].play()
  			$.ajax({
  				type:"GET",
  				url:"recorder.do?method=isalive&recorder_id="+recorder_id,
  				success:function(data){
  					if(data == "OVER"){
  						alert("结束")
  					}
  				}
  			})
  		})
  		$("#audio2")[0].addEventListener("ended",function(){		
  			window.setTimeout(audio2, 15000)
  			$("#audio1")[0].play()
  			$.ajax({
  				type:"GET",
  				url:"recorder.do?method=isalive&recorder_id="+recorder_id,
  				success:function(data){
  					if(data == "OVER"){
  						alert("结束")
  					}
  				}
  			})
  		})
  		//$("#audio1")[0].ontimeupdate = function(){
  		//	console.log($("#audio1")[0].currentTime)
  		//	if($("#audio1")[0].currentTime >= 20){
  		//		$("#audio2")[0].play()
  		//		$("#audio1")[0].pause()
  		//		window.setTimeout(audio1, 15000)
  		//	}
  		//}
  		//$("#audio2")[0].ontimeupdate = function(){
  		//	console.log($("#audio2")[0].currentTime)
  		//	if($("#audio2")[0].currentTime >= 20){
  		//		$("#audio1")[0].play()
  		//		$("#audio2")[0].pause()
  		//		window.setTimeout(audio2, 15000)
  		//	}
  		//}
  		function audio1(){
  			$("#audio1").attr("src","recorder.do?method=play_recorder&recorder_id="+recorder_id+"&rand="+new Date().getTime())
  		}
  		function audio2(){
  			$("#audio2").attr("src","recorder.do?method=play_recorder&recorder_id="+recorder_id+"&rand="+new Date().getTime())
  		}
  		function play1(){
  			$("#audio1")[0].play()
  			//window.setTimeout(play2,20000)
  		}
  		function play2(){
  			$("#audio2")[0].play()
  			//window.setTimeout(play1,20000)
  		}
  	})
  </script>
</html>
