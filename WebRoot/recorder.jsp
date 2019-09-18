<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
</head>
<style>
	*{margin:0px;padding:0px;}
	li{list-style:none;}
	a{color:black;text-decoration: none;}
	
	#container{
		width:83%;
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
		height:370px;
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
		font-size:30px;
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
	.left-bottom #start{
		width:30px;
		height:30px;
		margin:10px auto 0px;
		border:1px solid black;
		cursor:pointer;
		overflow:hidden;
	}
	.left-bottom #start .flag{
		width:30x;
		height:30px;
	}
	.left-bottom #start .flag img{
		width:24px;
		height:24px;
		display:block;
		margin:3px 3px;
	}
	.left-bottom #start{
		float:left;
		margin-left:30px;
	}
	#time{
		float:left;
		margin:15px 0px 0px 30px;
	}
	#music-bar{
		float:right;
		margin:10px 30px;
	}
	#search{
		width:100%;
		float:left;
		margin:30px auto;
	}
	#music_list{
		width:100%; 
		height:230px;
		background:#f3f3f3;
		float:left;
		margin:20px auto 0px;
		overflow:auto;
	}
	#music_list .content{
		width:600px;
		height:100%;
		background:white;
		margin:0px auto;
	}
	#music-bar .container-bar{
		width:500px;
		height:30px;
		background:#e9e9e9;
		overflow:hidden;
	}
	.container-bar .current{
		width:300px;
		height:6px;
		margin:11px 0px 0px 20px;
		background:black;
		cursor:pointer;
		float:left;
	}
	.container-bar .current .pro-bar{
		background:red;
	}
	.container-bar .voice{
		width:100px;
		height:6px;
		margin:11px 0px 0px 60px;
		background:black;
		float:left;
		cursor:pointer;
	}
</style>
<script>var title="${title}";var desc="${desc}";var img="${img}";var singer_name = "${singer_name}";var filename="${filename}";</script>
<body>
	<div id="container">
		<div class="left-top">
			<ul>
				<li><img style="width:130px;height:130px;display:block;margin:3px;"></li>
				<li><img src="img/recorder_png.png">${title }</li>
				<li>作者:${singer_name }</li>
			</ul>
		</div>
		<div class="right">
			<ul>
				<li style="font-size:25px;">电台描述：</li>
				<li>${desc }</li>
			</ul>
		</div>
		<div class="left-bottom">
			<div style="height:40px;">
				<div id="start">
					<div flag="0" class="flag"><img src="img/play.png"></div>
				</div>
				<div id="time">00:00:00</div>
				<div id="music-bar">
					<div class="container-bar">
						<div class="current">
							<div class="pro-bar" style="height:6px;width:0%;border-radius:3px;"></div>
						</div>
						<div class="voice">
							<div class="voice-bar" style="background:red;width:100%;height:6px;"></div>
						</div>
					</div>
					<audio id="audio"></audio>
				</div>
			</div>
			<div id="search">
				<div style="margin:0px auto;width:550px;">
					<span style="display:block;float:left;">
						<input style="width:496px;height:30px;" type="text" id="input">
					</span>
					<span style="display:block;float:left;">
						<input style="width:50px;height:30px;" type="button" id="btn" value="搜索">
					</span>
				</div>
				<div id="music_list">
					<div class="content">
						<table border=0 cellpadding="0" cellspacing="0" id="show" style="width:100%;">
			    			<tr id="title" style="line-height:50px;">
			    				<th style="width:8%;padding:0px 9px;text-align:left;">#</th>
			    				<th style="width:23%;padding:0px 9px;text-align:left;">歌曲</th>
			    				<th style="width:23%;padding:0px 9px;text-align:left;">歌手</th>
			    				<th style="width:23%;padding:0px 9px;text-align:left;">专辑</th>
			    				<th style="width:23%;padding:0px 9px;text-align:right;">时长</th>
			    			</tr>
			    		</table>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script type="text/javascript" src="js/recorder.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/Base64.js"></script>
	<script>
		var time = null
		//websocket
		var websocket = null
		//判断当前浏览器是否支持websocket
		if("WebSocket" in window){
			websocket = new WebSocket("ws://localhost:8080/music_player/recorder")
		}else {
	        alert('当前浏览器 Not support websocket')
	    }
		$(function(){
			websocket.onopen = function(event){
				websocket.send("MESSAGE_RECORDER_JOIN"+filename)
			}
			//发送消息
			function send(message){
				websocket.send(message)
			}
			//当窗口关闭时关闭websocket
			window.onbeforeunload = function () {
			//	websocket.send("MESSAGE_RECORDER_CLOSE_PER");
				websocket.close();
		    }
			websocket.onmessage = function(event){
				var message = event.data
				console.log(message)
				if(message.indexOf("MESSAGE_RECORDER_NEWPERSON_JOIN") == 0){
					websocket.send("MESSAGE_RECORDER_NEWPERSON_JOIN{'volume':'"+$("#audio")[0].volume+"','music_url':'"+$("#audio").attr("src")+"','currentTime':'"+$("#audio")[0].currentTime+"','time':'"+time+"'}|"+filename)
				}
			}
			$("#btn").click(function(){
				$.ajax({
					type:"GET",
					url:"search.do?method=recorder&value="+$("#input").val(),
					success:function(data){
						data = eval(data)
						$("#show").find("tr").each(function(){
							if($(this).attr("id") != "title"){
								$(this).remove()
							}
						})
						for(var i=0;i<data.length;i++){
							var tr = "";
							if(i%2){
								tr = $("<tr class='music' style='background:white;display:table-row;' singer_id="+data[i].singer_id+" music_id="+data[i].music_id+" time="+data[i].time+"></tr>");
							}else{	
								tr = $("<tr class='music' style='background:#f7f7f7;display:table-row;' singer_id="+data[i].singer_id+" music_id="+data[i].music_id+" time="+data[i].time+"></tr>");
							}
							var music_name = data[i].music_name
							music_name = music_name.split("--")[1]
							var td_num = $("<td style='width:8%;padding:0px 9px;text-align:left;'><div style='height:50px;'><span style='line-height:50px;'>"+i+"</span></div></td>")
							var td_name = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div title='"+music_name+"'><span>"+(music_name.length>6 ? music_name.substring(0,6) : music_name)+"</span></div></td>")
							var td_singer = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div style='height=50px;'><span>"+data[i].singer_name+"</span></div></td>")
							var td_zhuanji = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div style='height=50px;'><span>"+data[i].zhuanji_name+"</span></div></td>")
							var td_time = $("<td style='width:23%;padding:0px 9px;text-align:right;'><div style='height=50px;'><span>"+data[i].time+"</span></div></td>")
							tr.append(td_num).append(td_name).append(td_singer).append(td_zhuanji).append(td_time)
							$("#show").append(tr)
						}
						clicks()
					}
				})
			})
			function clicks(){
				$(".music").each(function(){
					$(this).unbind()
				})
				$(".music").each(function(){
					$(this).click(function(){
						$("#audio").attr("src","music.do?method=musicplay&singer_id="+new Base64().encode($(this).attr("singer_id"))+"=&music_id="+new Base64().encode($(this).attr("music_id")))
						$("#audio")[0].play()
						send("MESSAGE_RECORDER_MUSIC{'volume':'"+$("#audio")[0].volume+"','music_url':'"+$("#audio").attr("src")+"','currentTime':'"+$("#audio")[0].currentTime+"','time':'"+$(this).attr("time")+"'}|"+filename)
						alert("请带上耳机，以免影响直播效果")
						time = $(this).attr("time")*1
					})
				})
			}
			$(".current").click(function(event){
				var x = event.pageX
				var div_x = $(this)[0].offsetLeft
				var per = (x-div_x)/3
				$(this).find(".pro-bar").css("width",per+"%")
				$("#audio")[0].currentTime = time*per/100
				send("MESSAGE_RECORDER_CURRENTTIME{'currentTime':'"+time*per/100+"'}|"+filename)
			})
			$(".voice").click(function(event){
				var x = event.pageX
				var div_x = $(this)[0].offsetLeft
				var per = x-div_x
				$(this).find(".voice-bar").css("width",per+"%")
				$("#audio")[0].volume = per/100
				send("MESSAGE_RECORDER_VOLUME{'volume':'"+per/100+"'}|"+filename)
			})
			$("#audio")[0].ontimeupdate = function(){
				var per = $("#audio")[0].currentTime / time
				$(".pro-bar").css("width",per*100+"%")
			}
		})
	</script>
	<script>
		$(function(){
			var hour = 0;
			var min = 0;
			var sec = 0;
			
			var recorder;
			
			$("#container").css("height",$(document).height())
			
			$(".left-top ul li:eq(0) img").attr("src","recorder/image/"+img)
			
			$(".flag").click(function(){
				if($(this).attr("flag")*1 == 0){
					$(this).attr("flag","1").css("margin","0px 0px")
					$(this).find("img").attr("src","img/stop.png")
					t = window.setInterval(clock, 1000)
					HZRecorder.get(function (rec) {
		                recorder = rec;
		                recorder.start();
		            });
					m = window.setTimeout(play, 20000)
				}else{
					$(this).attr("flag","0").css("margin","3px 3px")
					$(this).find("img").attr("src","img/play.png")
					$("#time").html("00:00:00")
					clearInterval(t)
					clearTimeout(m)
					recorder.upload("recorder.do?flag=0", function (state, e) {
		                switch (state) {
		                    case 'uploading':
		                        //var percentComplete = Math.round(e.loaded * 100 / e.total) + '%';
		                        //alert("上传中")
		                        break;
		                    case 'ok':
		                        console.log(e.target.responseText);
		                        var data = eval(e.target.responseText)
		                        if(data[0]["status"] == "200"){
		                        	$.ajax({
		        		            	type:"GET",
		        		            	url:"recorder.do?method=stop&time="+(sec+min*60+hour*60*60),
		        		            	success:function(){
		        		            		alert("上传成功,您可以在全部电台中找到您的节目哦")
		        		            	}
		        		            })
		                        }
		                        break;
		                    case 'error':
		                        alert("网络不给力，请检查网络");
		                        break;
		                    case 'cancel':
		                        alert("取消");
		                        break;
		                }
		            });
					recorder.stop();
		            //recorder.clear();
		            hour = 0
					sec = 0
					min = 0
					websocket.send("MESSAGE_RECORDER_CLOSE"+filename)
				}
			})
			
			function clock(){
				sec += 1;
				if(sec >= 60){
					sec = 0;
					min += 1;
					if(min >= 60){
						min = 0
						hour += 1;
					}
				}
				$("#time").html((hour<10 ? "0"+hour : hour)+":"+(min<10 ? "0"+min : min)+":"+(sec<10 ? "0"+sec : sec))
			}
			
			function play(){
				m = window.setTimeout(play, 20000)
				recorder.upload("recorder.do", function (state, e) {
	                switch (state) {
	                    case 'uploading':
	                        //var percentComplete = Math.round(e.loaded * 100 / e.total) + '%';
	                        //alert("上传中")
	                        break;
	                    case 'ok':
	                        //alert(e.target.responseText);
	                        //alert("成功")
	                        break;
	                    case 'error':
	                        alert("网络不给力，请检查网络");
	                        break;
	                    case 'cancel':
	                        alert("取消");
	                        break;
	                }
	            });
				//recorder.clear();
			}
			window.onbeforeunload = function(){
				if($(this).attr("flag")*1 == 0){
					alert("您还未结束直播")
					return false
				}
			}
		})
	</script>
</body>
</html>