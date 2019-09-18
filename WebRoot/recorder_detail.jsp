<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'recorder_detail.jsp' starting page</title>
    
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
  <body>
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
  <script src="js/jquery.function.js"></script>
  <script>var data = ${data};</script>
  <script>
  	$(function(){
  		var prop = {}
  		prop["time"] = data[0].recorder_time
  		prop["singer_name"] = data[0].user_realname
  		prop["singer_img"] = "recorder/image/"+data[0].recorder_img
  		prop["music_href"] = data[0].wav_url
  		console.log(prop)
  		new music_play().recorder(prop)
  		
  		$(".left-top ul li:eq(1)").html('<img src="img/recorder_png.png">'+(data[0].recorder_name.length > 15 ? data[0].recorder_name.substring(0,15) : data[0].recorder_name))
  		$(".left-top ul li:eq(0) img").attr("src","recorder/image/"+data[0].recorder_img)
  		$(".left-top ul li:eq(2)").html("作者:"+data[0].user_realname)
  		
  		$(".left-bottom p").html(data[0].recorder_desc)
  		
  		$(".left-bottom").css("height",$(document).height()-161)
  	})
  </script>
</html>
