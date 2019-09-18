<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="keywords" content="爱疯  播放器  MP3">
		<meta name="description" content="一个专注于做音乐的网站">
		<title>爱疯</title>
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<link rel="icon" href="img/logo.png" type="image/x-icon"/>
		<style type="text/css">
			*{margin:0px;padding:0px;}
			
			#foot{
				width:100%;
				height:50px;
				background:#2b2b2b;
				position:fixed;
				bottom: 0px;
			}
			#music_back{
				width:36px;
				height:36px;
				border-radius:19px;
				border:1px solid #bab5b5;
				float:left;
				background:url(img/btn.png) 263px 156px;
				margin:7.5px 0px 5px 30px;
				cursor:pointer;
			}
			#music_play{
				width:50px;
				height:50px;
				border:1px solid #bab5b5;
				float:left;
				background:url(img/btn.png) 234px 294px;
				border-radius:50%;
				transform:scale(0.9);
				margin:1px 0px 5px 20px;
				cursor:pointer;
			}
			#music_next{
				width:36px;
				height:36px;
				border:1px solid #bab5b5;
				float:left;
				background:url(img/btn.png) 419px 156px;
				cursor:pointer;
				margin:7.5px 0px 5px 20px;
				border-radius:19px;
			}
			#music_proc{
				height:50px;
				float:left;
				margin-left:80px;
			}
			#singer_pic{
				width:40px;
				height:40px;
				float:left;
				margin:5px 0px 0px 0px;
				cursor:pointer;
			}
			#music_proc .progress{
				height:6px;
				width:500px;
				margin-top:6px;
				cursor:pointer;
				overflow: visible;
				background:#494646;
			}
			#music_proc .progress .progress-bar{
				background:white;
				height:6px;
				border-radius:6px;
				min-width: 0px;
				transition: width 0.1s ease;
			}
			/*#foot #music_proc .music_now{
				width:12px;
				height:12px;
				border-radius:50px;
				float:left;
				background:white;
				margin:-2.5px 0px 0px -12px;
			}
			#foot #music_proc .music_now div{
				background:red;
				width:7px;
				height:7px;
				border-radius:50px;
				margin:3.5px 0px 0px 3.5px;
			}*/
			#music_proc .proc_top{
				height:20px;
				color:white;
			}
			#music_voice{
				width:30px;
				height:30px;
				background:url(img/voice.jpg) -5px;
				border-radius:19px;
				border:1px solid #bab5b5;
				float:left;
				transform:scale(0.75);
				margin:10px 0px 0px 40px;
				cursor:pointer;
			}
			#play_model{
				width:30px;
				height:21px;
				background:url(img/player.png) 793px 927px;
				float:left;
				transform:scale(0.8);
				cursor:pointer;
				margin:14px 0px 0px 15px;
			}
			#foot .voice_proc{
				width:80px;
				height:6px;
				background:#494646;
				float:left;
				margin:24px 5px 0px 2px;
				border-radius:5px;
				cursor:pointer;
			}
			#foot .voice_proc .voice_bar{
				width:60%;
				background:white;
				height:6px;
				border-radius:5px;
			}
			#music_list_pic{
				float:left;
				width:23px;
				height:22px;
				background:url(img/player.png) 793px 740px;
				transform: scale(0.9);
				cursor:pointer;
				margin:13px 0px 0px 30px;
			}
			#foot .music_list_wall{
				float:left;
				color:white;
				margin-top:14px;
			}
			#foot .foot_panel{
				width:1138px;
				height:50px;
				margin:0px auto;
			}
			
			.lrc_panel_top{
				width:955px;
				height:70px;
				margin:0px auto;
			}
			#music_word{
				width:100%;
				background:#f5f5f5;
				overflow: hidden;
				display:none;
				position:absolute;
				top:0px;
			}
			#music_word .word_content{
				width:955px;
				background:white;
				margin:0px auto;
				overflow: auto;
				border-left:1px solid #a49999;
				border-right:1px solid #a49999;
			}
			.word_top p{
				float:left;
			}
			.word_top{
				height:70px;
				width:100%;
				background:#292828;
				overflow: hidden;
			}
			.word_top .logo img{
				width:50px;
				height:50px;
				border-radius:50px;
			}
			.word_top .logo{
				margin:9px 0px 0px 0px;
			}
			.word_top .music_player_title{
				font-size:18px;
				color:white;
				font-family: "宋体";
				margin:19px 0px 0px 18px;
			}
			.music_search{
				float:left;
			}
			.word_top .music_search{
				width:200px;
				height:30px;
				background:white;
				margin-left:214px;
				border-radius:50px;
				margin-top:15px;
			}
			.word_top .music_search .span{
				display:block;
				width:150px;
				height:25px;
				margin:4px 0px 0px 13px;
			}
			.word_top .music_search span input{
				border:0px;
				outline:none;
			}
			.word_top .user_info{
				width:50px;
				height:50px;
				margin:10px 0px 0px 34px;
				border-radius:50%;
				overflow:hidden;
			}
			.word_top .closed{
				margin-top:23px;
			}
			.word_top .closed a{
				color:white;
			}
			
			
			.word_content .word_left{
				width:200px;
				height:90%;
				float:left;
				border-right:1px solid #e7e3e3;
				margin-top:25px;
			}
			.word_left .music_singer_pic{
				width:80px;
				height:80px;
				border-radius:50px;
				overflow: hidden;
				margin:30px 0px 10px 50px; 
			}
			.word_left .music_singer_pic img{
				width:80px;
				height:80px;
			} 
			.word_left .music_singer_name{
				text-align:center;
			}
			.word_content .word_lrc{
				width:550px;
				height:100%;
				background:#ff00000d;
				float:left;
			}
			.word_lrc #lrc_show{
				height:80%;
				width:100%;
				margin-top:100px;
				overflow: hidden;
			}
			#lrc_show #lrc_show_bar{
				width:100%;
				height:100%;
				position:relative;
				top:0px;
				z-index:1;
			}
			#top{
				width:100%;
				height:70px;
				background:red;
				z-index:0;
			}
			
			/*中间iframe部分*/
			.container #content{
				width:100%;
				overflow:auto;
			}
			
			.container_my #content #center_iframe{
				width:100%;
				border:0px;
			}
			
			/*搜索框*/
			.item:hover{
				cursor:pointer;
				background:red;
			}
		</style>
	</head>
	<body>
		<input type="hidden" id="hidden_list" value="">
		<audio id="music_player" src="javascript:void(0)" time="">
		</audio>
		<div class="word_top">
			<div class="lrc_panel_top">			
				<p class="logo"><img src="img/logo.png"></p>
				<p class="music_player_title">爱疯音乐播放器 一个专注于做音乐的平台</p>
				<div class="music_search">
					<span class="span">
						<input class="search" type="text" placeholder="音乐/作者/电台"/>
					</span>
					<div class="search-show" style="width:200px;height:auto;position:absolute;border:1px solid black;">
							
					</div>
				</div>
				<p class="user_info"><img style="width:50px;height:50px;" src="user.do?method=getpic"></p>
				<p class="closed"><a href="user.do?method=close">退出登录</a></p>
			</div>
		</div>
		<div class="container_my">
			<div id="content">
				<iframe id="center_iframe" name="iframe" data_src="music_list.jsp" src="music_list.jsp"></iframe>
			</div>
		</div>
		<div id="foot">
			<div class="foot_panel">
				<img id="singer_pic" src="img/logo.png">
				<p id="music_back" ></p>
				<p value="1" id="music_play" ></p>
				<p id="music_next" ></p>
				<div id="music_proc">
					<div class="proc_top"><div></div></div>
					<div class="progress procbar">
						<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0px;"></div>
						<!-- <div class="music_now"><div></div></div> -->
					</div>
				</div>
				<p value="1" id="music_voice"></p>
				<div class="voice_proc">
					<div voice_volume="60" class="voice_bar"></div>
				</div>
				<p value="1" id="play_model"></p>
				<p id="music_list_pic"></p>
				<div class="music_list_wall">音乐列表</div>
			</div>
			<div id="tishi" style="width:100%;height:100%;position:fixed;top:0px;display:none;">
				<div class="con" style="margin:300px auto;width:200px;height:100px;background:white;text-align:center;font-size:20px;line-height:100px;">
					
				</div>
			</div>	
		</div>
	</body>
	<script src="js/Base64.js"></script>
	<script src="js/jquery.function.js"></script>
	<script src="163Hot/3778678.js"></script>
	<script>
		//求解json键值对个数
		var json_do = {
			json_size:function(d){
		  		var l = 0
		  		for(var i in d){
		  			if(d.hasOwnProperty(i)){
		  				l++
		  			}
		  		}
		  		return l
		  	},
			isEmpty:function(d) {
				for(var i in d){
					if(d[i] !== undefined){
						return false
					}
				}
				return true
			}
		}
	</script>
	<script>
		//保存歌曲列表
	  	var music_list = {} ;
		//保存当前播放的歌曲索引
	  	var music_index = 0 ;
		//歌曲数目
		var music_count = 0
	    //当前音乐歌词
		var lrc = null ;
		//记录用户是否登录
		var isLogin = true
		//保存播放模式
		/**
		* tp = 1 列表循环
		* tp = 2单曲循环
		* tp = 3随机播放
		*/
		var tp = "3"
		//设置默认播放列表
		music_list = auto_list["data"]
		music_index = 1
		music_count = json_do.json_size(music_list)
		$("#singer_pic").attr("src",music_list[music_index].singer_img)
	</script>
	<script type="text/javascript">
		$(function(){
			$(".logo").click(function(){
				$("#center_iframe").attr("src","main.jsp")
			})
		 //   window.onbeforeunload = function(){
		//		cookie.set("page",$("#center_iframe").attr("src"),1)
		//	}
		//	if(typeof(cookie.get("page")) != "undefined"){
		//		$("#center_iframe").attr("src",cookie.get("page"))
		//	}
		})
		//封装套供自定义歌单增删改查的函数
		var mylist = {
			/**
			* n : music_name
			* u : music_url
			* z : zhuanji_name
			* s : singer_name
			* i : singer_img
			* t : time
			*/
			add:function(n , u , z , s , i , t , callback){
				$.ajax({
					url:"music.do?method=collection&music_name="+n+"&music_url="+u+"&zhuanji_name="+z+"&singer_name="+s+"&singer_img="+i+"&time="+t,
					type:"GET",
					success:function(data){
						callback(data)
					}
				})
			},
			remove:function(u , callback){
				$.ajax({
					url:"music.do?method=deletecollection&music_url="+u,
					type:"GET",
					success:function(data){
						callback(data)
					}
				})
			},
			select:function(callback){
				var list = {}
				$.ajax({
					url:"music.do?method=getmylist",
					type:"GET",
					success:function(data){
						if(data == "ERROR"){
							return {}
						}else{
							data = eval(data)
							for(var i=0 ; i<data.length ;i++){
								list[i+1] = data[i]
							}
						}
						callback(data)
					}
				})
			}
		}
		$(function(){
			//拖动进度条控制变量
			var flag_music_proc = false;
			//保存服务器传过来的音乐列表
			var music_list = null;
			//当前播放歌曲下标
			var music_index = 0;
			//初始化歌曲时间
			$(".proc_top").find("div").html("00:00/--:--");
			//根据用户浏览器高度确定面板的高度
			$("#content").css("height",$(document).height()-119+"px")
			$("#center_iframe").css("height",$(document).height()-119+"px")
			//请求网页的ajax的封装
			function ajax(url , method , susses , faild , async){
				$.ajax({
					type:method,
					url:url,
					async:async,
					success:susses,
					error:faild
				});
			}
			
			//关闭音乐列表
			$(".music_list_top_close").click(function(){
				$("#music_list").css("display","none")
			})
			//控制音乐列表的显示隐藏
			$("#music_list_pic").click(function(){
				//var old = $("#center_iframe").attr("src")
				$("#center_iframe").attr("src",$("#center_iframe").attr("data_src"))
				//$("#center_iframe").attr("data_src",old)
			})		
			//通过空格键控制音乐播放暂停
			//$(document).keyup(function(e){
			//	e = e || e.window.event;
			//	if(e.keyCode == 32){
			//		if($("#music_play").attr("value")*1){
			//			$("#music_play").css("background","url(img/icon.jpg) 205px 227px").attr("value","0");
			//			var player = $("#music_player")[0];
			//			player.play()
			//		}else{
			//			$("#music_play").css("background","url(img/icon.jpg) 261px 227px").attr("value","1");
			//			var player = $("#music_player")[0];
			//			player.pause()
			//		}
			//	}
			//})
			//静音按钮
			$("#music_voice").click(function(){
				if($("#music_voice").attr("value")*1){
					$("#music_player")[0].volume = 0;
					$("#music_voice").attr("value","0")
					$(".voice_proc").find(".voice_bar").css("width",0+"%").attr("voice_volume",0+"")
				}else{
					$("#music_player")[0].volume = 0.60;
					$(".voice_proc").find(".voice_bar").css("width",60+"%").attr("voice_volume",60+"")
					$("#music_voice").attr("value","1")
				}
			})
			//控制音量进度条
			$(".voice_proc").click(function(e){
				e = e || window.event;
				var x = e.pageX || e.clientX + document.body.scroolLeft
				var bar_x = $(".voice_bar")[0].offsetLeft;
				var bar_all = $(".voice_proc").css("width").replace("px","")
				var per = (x - bar_x)/bar_all
				if(per*100 > 0 && per*100 < 8){
					$(this).find(".voice_bar").css("width",0+"%").attr("voice_volume",0+"")
					$("#music_player")[0].volume = 0;
				}else if(per*100 >= 8 && per*100 < 20){
					$(this).find(".voice_bar").css("width",20+"%").attr("voice_volume",20+"")
					$("#music_player")[0].volume = 0.20;
				}else if(per*100 >= 20 && per*100 < 35){
					$(this).find(".voice_bar").css("width",35+"%").attr("voice_volume",35+"")
					$("#music_player")[0].volume = 0.35;
				}else if(per*100 >= 35 && per*100 < 50){
					$(this).find(".voice_bar").css("width",50+"%").attr("voice_volume",50+"")
					$("#music_player")[0].volume = 0.50;
				}else if(per*100 >= 50 && per*100 < 75){
					$(this).find(".voice_bar").css("width",75+"%").attr("voice_volume",75+"")
					$("#music_player")[0].volume = 0.75;
				}else if(per*100 >= 75 && per*100 < 90){
					$(this).find(".voice_bar").css("width",90+"%").attr("voice_volume",90+"")
					$("#music_player")[0].volume = 0.90;
				}else if(per*100 >= 90 && per*100 <= 100){
					$(this).find(".voice_bar").css("width",100+"%").attr("voice_volume",100+"")
					$("#music_player")[0].volume = 1.00;
				}
			})
			/**
			 * 控制音乐进度条拖放的鼠标事件 ***已弃用
			 */
			//$(".music_now").mousedown(function(){
			//	flag_music_proc = true;
			//})
			//$(document).mousemove(function(e){
			//	if(flag_music_proc){
			//		do_proc(e)
			//	}
			//})
			//$(document).mouseup(function(){
			//	flag_music_proc = false;
			//})
			//end
			function show_tishi(){
				$("#tishi").css("display","none")
			}
			//选取播放模式
			$("#play_model").click(function(){
				if($(this).attr("value")*1==1){
					$(this).css("background","url(img/player.png) 794px 794px").attr("value","2")
					//列表循环
					tp = "1"
					$("#tishi .con").html("列表循环")
					$("#tishi").css("display","block")
					window.setTimeout(show_tishi, 500)
				}else if($(this).attr("value")*1==2){
					$(this).css("background","url(img/player.png) 794px 767px").attr("value","3")
					//单曲循环
					tp = "2"
					$("#tishi .con").html("单曲循环")
					$("#tishi").css("display","block")
					window.setTimeout(show_tishi, 500)
				}else if($(this).attr("value")*1==3){
					$(this).css("background","url(img/player.png) 793px 927px").attr("value","1")
					//随机播放
					tp = "3"
					$("#tishi .con").html("随机播放")
					$("#tishi").css("display","block")
					window.setTimeout(show_tishi, 500)
				}
			})
			//搜索 
			$(function(){
				$(".search").each(function(){
					$(this).keyup(function(event){
						//console.log(event.keyCode)
						if(event.keyCode == 13){
							var text = $(this).val()
							text = encodeURI(text.replace(" ","%2B"))
							$("iframe").attr("src","search.do?method=jump&keyword="+text)
							$(this).val("")
							$(".search-show").children().each(function(){
								$(this).remove()
							})
						}else{
							getResult($(this))
						}
					})
				})
				$(".search").each(function(){
					$(this).mousedown(function(){
						getResult($(this))
					})
				})
				$(window).blur(function(){
					if(!$(this).is($(".music_search")) && !$(this).is($(".search-show")) && !$(this).is(".search")){
						$(".search-show").children().each(function(){
							$(this).remove()
						})
					}
				})
				function getResult(a){
					var _this = a
					_this.parents(".music_search").find(".search-show").children().each(function(){
						$(this).remove()
					})
					if(_this.val().trim() == ""){
						return
					}
					ajax("search.do?method=search&key="+_this.val(),"GET",function(data){
						data = eval(data)
						for(var i=0;i<8;i++){
							if(i < data[0].length){
								var singer = data[0]
								_this.parents(".music_search").find(".search-show").append($("<div class='item' title='"+singer[i].singer_name+"' style='width:198px;height:30px;background:white;'><p style='padding-left:15px;color:gray;float:left;width:99px;font-size:12px;line-height:20px;'><span>歌手</span></p><p style='color:gray;width:99px;float:left;'><span>"+singer[i].singer_name+"</span></p></div>"))
							}else if(i<data[0].length + data[1].length){
								var music = data[1]
								var music_name = music[i].music_name.length >= 6 ? music[i].music_name.substring(0,6)+"..." : music[i].music_name
								_this.parents(".music_search").find(".search-show").append($("<div data='detail.do?method=music&music_id="+new Base64().encode(music[i].music_id+"")+"' class='item' title='"+music[i].music_name+"' style='width:198px;height:30px;background:white;'><p style='padding-left:15px;color:gray;float:left;width:99px;font-size:12px;line-height:20px;'><span>歌曲</span></p><p style='color:gray;width:99px;float:left;'><span>"+music_name+"</span></p></div>"))
							}
						}
						clicks()
					},function(){
						console.log("网络不佳，请检查网络连接")
					},true)
				}
				function clicks(){
					$(".item").each(function(){
						$(this).unbind()
					})
					$(".item").each(function(){
						$(this).click(function(){
							$("iframe").attr("src",$(this).attr("data"))
							$(".search-show").children().each(function(){
								$(this).remove()
							})
							$(".search").each(function(){
								$(this).val("")
							})
						})
					})
				}
				clicks()
			})
			//音乐跳转
			function do_proc(e){
				e = e || window.event;
				var music = document.getElementById("music_player")
				var time = $(music).attr("time")
				var c_x = document.querySelector(".procbar").offsetLeft
				var per_x = e.pageX || e.clientX + document.body.scroolLeft
				var bar = $(music_proc).css("width")
				var per = (per_x*1 - c_x*1)/(bar.replace("px",""))*1
				$("#music_proc").find(".progress-bar").css("width",per*100+"%")
				$("#music_proc").find(".progress-bar").attr("aria-valuenow",per*100+"")
				//alert($("#music_player")[0].duration)
				if($("#music_play").attr("value")){
					$("#music_player")[0].play();
				//	$("#music_play").css("background","url(img/icon.jpg) 205px 227px").attr("value","0")
				}
				var page = $("#center_iframe").contents()
				//歌曲跳转
				music.currentTime = per*time*1
				//歌词快速对位
				var temp = lrc
				var tempArr = []
				var tempTime = 0
				var tempIndex = 0
				for(var i in lrc){
					tempArr.push(i)
				}
				tempArr.sort(function(a,b){
					return a-b
				})
				for(var i=0;i<tempArr.length;i++){
					if(tempArr[i] < per*time*1){
						tempTime = tempArr[i]
						if(i == tempArr.length-1){
							tempIndex = i - 5
						}
					}else{
						tempIndex = i - 1
						tempIndex = tempIndex-4 <0 ? tempIndex = 0 : tempIndex-4
						break
					}
				}
				page.find(".panel").find("li").each(function(){
					$(this).remove()
				})
				for(var i=tempIndex ; i<tempArr.length ; i++){
					page.find(".panel").append($("<li id="+Math.round(tempArr[i])+" style='text-align:center;font-size:14px;line-height:31px;'>"+temp[tempArr[i]]+"</li>"))
				}
				page.find("#"+Math.round(tempTime)).css("color","lightgreen")
			}
			//播放按钮点击事件
			$("#music_play").click(function(){
				if($(this).attr("value")*1){
				//	$(this).css("background","url(img/icon.jpg) 205px 227px").attr("value","0");
					var player = $("#music_player");
					if(player.attr("src") == "javascript:void(0)"){
						alert("请选中歌曲")
					}else{
						player[0].play()
					}
				}else{
				//	$(this).css("background","url(img/icon.jpg) 261px 227px").attr("value","1");
					var player = $("#music_player")[0];
					player.pause()
				}
			});
			//音乐跳转（通过天读条）
			$(".procbar").click(function(e){
				do_proc(e)
			})
			//$(".music_now").hover(function(){
			//	$(this).css("background","black")
			//	$(this).find("div").css("background","white")
			//},function(){
			//	$(this).css("background","white")
			//	$(this).find("div").css("background","red")
			//})		
		})
		
		//init_top = $("#lrc_show_bar").css("top").replace("px","")*1
		$("#music_player")[0].addEventListener("timeupdate",function(){
			var page = $("#center_iframe").contents()
			var time = $("#music_player").attr("time")
			var now = $("#music_player")[0].currentTime
			var per = now/time *100
			$(".progress-bar").css("width",per+"%").attr("aria-valuenow",per)
			var min = parseInt(now/60) <10 ? "0"+parseInt(now/60) : parseInt(now/60)
			var sec = parseInt(now%60) <10 ? "0"+parseInt(now%60) : parseInt(now%60)
			$(".proc_top").find("div").html(min+":"+sec+"/"+parseInt(time/60)+":"+parseInt(time%60));
			$(page).find("#"+Math.round(now)).parent("ul").find("li").css("color","white")
			$(page).find("#"+Math.round(now)).css("color","lightgreen")
			if($("#"+Math.round(now) , page)[0]){
				var top = $("#"+Math.round(now) , page)[0].offsetTop
				var height = page.find(".lrc_panel").height() ;
				if(top> height/2 - 10){
					page.find(".panel li:eq(0)").remove()
				}
			}
		})
		
		$("#music_player")[0].addEventListener("ended",function(){
			$("#music_play").css("background","url(img/btn.png) 234px 294px").attr("value","1");
			$("#music_proc").find(".progress-bar").css("width",0+"%")
			$("#music_proc").find(".progress-bar").attr("aria-valuenow",0+"")
			
			music_next()
		})
		//对切歌进行封装
		function music_next(){
			//列表循环
	  		if(tp == "1"){
	  			music_index = music_index*1 
				while(!json_do.isEmpty(music_list) && typeof(music_list[++music_index]) == "undefined"){
					if(music_index > json_do.json_size(music_list)){
						music_index = 0
					}
				}
				music_change(music_index)
	  		}else if(tp == "2"){//单曲循环
	  			$("#music_player")[0].play()
	  			$("#center_iframe")[0].contentWindow.lrc_show(lrc)
	  			//$("#music_play").css("background","url(img/icon.jpg) 205px 227px").attr("value","0");
	  		}else if(tp == "3"){//随机播放
	  			music_index = parseInt(Math.random()*(json_do.json_size(music_list)-1)+1)
				while(!json_do.isEmpty(music_list) && typeof(music_list[music_index]) == "undefined"){
					music_index = parseInt(Math.random()*(json_do.json_size(music_list)-1)+1)
				}
	  			music_change(music_index)
	  		}
		}
		
		//下一曲
		$("#music_next").click(function(){
			music_index = music_index*1 
			while(!json_do.isEmpty(music_list) && typeof(music_list[++music_index]) == "undefined"){
				if(music_index > json_do.json_size(music_list)){
					music_index = 1
				}
			}
			music_change(music_index)
		})
		//上一曲
		$("#music_back").click(function(){
			music_index = music_index*1
			while(!json_do.isEmpty(music_list) && typeof(music_list[--music_index]) == "undefined"){
				if(music_index < 0){
					music_index = json_do.json_size(music_list)
				}
			}
			music_change(music_index)
		})
		
		function music_change(i){
			$("#music_player",parent.document)[0].pause()
			var page = $("#center_iframe").contents()
			if($("#center_iframe").attr("src") != "music_list.jsp"){
				page = null
			}
			
			if(page != null){
				page.find(".index_icon i").each(function(){
	  				var t = $(this).parent(".index_icon")
	  				$(this).remove()
	  				t.html(t.attr("index"))	
	  			})
			}
  			if(page != null){
  				page.find(".music_name a").each(function(){
  	  				if($(this).attr("index")*1 == i*1){
  	  					var html = $(this).parents(".item").find(".index_icon").html()
  	  		  	  		$(this).parents(".item").find(".index_icon").html($("<i style='width:10px;height:10px;display:block;background:url(\"img/wave.gif\");margin-top:13px;'></i>").attr("index",i))
  	  		  	  		$.ajax({type:"GET",url:music_list[i].music_url,async:true,success:function(data){
  	  		  	  			data = eval(data)[0].data
  	  		  	  			//console.log(data)
  	  		  	  			data.play_url = data.play_url//.replace(/m7c.music./g, "m7.music.").replace(/m8c.music./g, "m8.music.");
  	  		  	  			$("#music_player").attr("src",data.play_url)
  	  		  	  			lrc = lrc_decode(data.lyrics)
  	  		  	  			$("#center_iframe")[0].contentWindow.lrc_show(lrc)
  	  		  	  			$("#singer_pic").attr("src",music_list[i].singer_img)
  	  		  	  			page.find("#bk").attr("href",music_list[i].singer_img)
  	  		  	  			page.find(".singer_img img").attr("src",music_list[i].singer_img)
  	  		  	  			$("#music_player")[0].play()
  	  		  	  		},error:function(){}})
  	  		  	  		$("#music_player").attr("time",music_list[i].time/1000)
  	  		  	  		//$("#music_play").css("background","url(img/icon.jpg) 205px 227px").attr("value","0");
  	  				}
  	  			})
  			}else{
  				$.ajax({type:"GET",url:music_list[i].music_url,async:true,success:function(data){
	  	  			data = eval(data)[0].data
	  	  			data.play_url = data.play_url//.replace(/m7c.music./g, "m7.music.").replace(/m8c.music./g, "m8.music.");
	  	  			$("#music_player").attr("src",data.play_url)
	  	  			lrc = lrc_decode(data.lyrics)
	  	  			$("#singer_pic").attr("src",music_list[i].singer_img)
	  	  			$("#music_player")[0].play()
	  	  		},error:function(){}})
	  	  		$("#music_player").attr("time",music_list[i].time/1000)
  			}
		}
		
		//给音乐加上错误处理
		var count = 0
		$("#music_player")[0].onerror = function(){
			music_next()
		}
		
		//歌曲播放
		$("#music_player")[0].onplay = function(){
			//console.log("play")
		//	$("#music_play").css("background","url(img/icon.jpg) 261px 227px").attr("value","1");
			$("#music_play").css("background","url(img/btn.png) 234px 234px").attr("value","0");
		}
		//歌曲暂停
		$("#music_player")[0].onpause = function(){
		//	$("#music_play").css("background","url(img/icon.jpg) 205px 227px").attr("value","0");
			$("#music_play").css("background","url(img/btn.png) 234px 294px").attr("value","1");
		}
		//解析歌词
	    function lrc_decode(lrcdata){
			if(typeof(lrcdata) == "undefined" || lrcdata.trim() == ""){
				return null;
			}
			var json = null
			if(lrcdata != null && lrcdata != ""){
				var reg1 = /(\[\d{2}:\d{2}\..*?\])+(.[^\[]*)?/g  //匹配歌词时间及内容部分
				var reg2 = /\[.([^0-9\]]*)?\]/g                      //匹配歌词头部信息
				var lrc_body = lrcdata.match(reg1)
				var lrc_head = lrcdata.match(reg2)
				json = "[{";
				
				for(var i = 0; i < lrc_body.length ; i++){
					var str_time = lrc_body[i].match(/\[\d{2}:\d{2}.*?\]/g)
					var str_txt = lrc_body[i].replace(/\[\d{2}:\d{2}.*?\]/g,"")
					for(var j=0;j<str_time.length;j++){
						var min = str_time[j].substring(1,3)*1
						var sec = str_time[j].substring(4,6)*1
						var msec = str_time[j].substring(7,9)*1
						var time = min*60+sec+msec/100;
						//console.log(time)
						json = json + "\""+time+"\":\"" + str_txt +"\",";
					}
				}
				
				json = json.replace(/,$/ , "}]")		
				json = eval(json)
			}
			return json[0]
		}
	//下载音乐失败时打开一个新页面供用户自己手动下载
	function music_download(url){
		window.open(url)
	}
	</script>
</html>
