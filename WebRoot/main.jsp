<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<style>
		*{margin:0px;padding:0px;font-size:12px;}
		li{list-style:none;}
		p{margin:0px;}
		
		.carousel-indicators{
			z-index:-1;
		}
		.carousel-caption{
			z-index:-1;
		}
		
		#lunbo{
			width:100%;
			margin:0px auto;
		}
		/*专辑*/
		.contain_zhuanji{
			width:100%;
			margin-top:90px;
			overflow:hidden;
			display:block;
			top:0px;
			position: absolute;
			transition:height 1s;
			background:white;
			height:0px;
		}
		#zhuanji{
			width:1000px;
			margin:0px auto;
		}
		#zhuanji .zhuanji_child{
			float:left;
			text-align:center;
			width:130px;
			height:190px;
			margin-left:65px;
			background:white;
		}
		#zhuanji .zhuanji_child a p:nth-child(2){
			position: relative;
			top:-34px;
			text-align:center;
			background:#130f0fa3;
			color:white;
			width:150px;
		}
		#zhuanji .zhuanji_child a p:nth-child(3){
			position: relative;
			top:-34px;
			background:#130f0fa3;
			color:white;
			width:150px;
		}
		#zhuanji .zhuanji_child_first{
			margin-left:0px;
			float:left;
		}
		#zhuanji .zhuanji_child_first a p:nth-child(2){
			position: relative;
			top:-34px;
			background:#130f0fa3;
			color:white;
			width:200px;
			text-align:center;
		}
		#zhuanji .zhuanji_child_first a p:nth-child(3){
			position: relative;
			top:-34px;
			background:#130f0fa3;
			color:white;
			width:200px;
			text-align:center;
		}
		#zhuanji .zhuanji_child_first a img{
			width:200px;
			height:342px;
		}
		#zhuanji .zhuanji_child_first a{
			text-decoration: none;
			color:black;
		}
		#zhuanji .zhuanji_child a img{
			width:150px;
			height:150px;
		}
		#zhuanji .zhuanji_child a{
			text-decoration: none;
			color:black;
		}
		#zhuanji .title{
			height:40px;
		}
		
		/*歌手*/
		.contain_singer{
			width:100%;
			height:0px;
			overflow:hidden;
			margin-top:90px;
			display:block;
			position: absolute;
			background:white;
			top:0px;
			transition:height 1s;
		}
		#singer{
			width:1000px;
			margin:30px auto 0px;
		}
		#singer .title{
			height:40px;
		}
		#singer .singer_child{
			float:left;
			width:150px;
			height:170px;
			margin-left:55px;
			margin-top:6px;
		}
		#singer .singer_child img{
			width:150px;
			height:150px;
			border-radius:50%;
		}
		#singer .singer_child a{
			text-decoration:none;
		}
		
		.title .more{
			margin-left:870px;
			line-height:30px;
			cursor:pointer;
		}
		.title .more i{
			width:30px;
			height:30px;
			border-radius:50%;
			background:#bab4b47d;
			display:block;
			float:left;
			line-height:30px;
			font-size:20px;
			text-align:center;
			font-family:"宋体";
		}
		.title .more:hover{
			color:#eefa0094;
		}
		.title .more i:hover{
			background:#eefa0094;
			color:white;
		}
		
		/*歌曲*/
		.music_info #music{
			width:80%;
			border-radius:10px;
			overflow:hidden;
			margin:0px auto;
			z-index:999;
		}
		.music_info{
			height:0px;
			width:100%;
			margin-top:90px;
			position: absolute;
			top:0px;
			background:white;
			transition:height 1s;
			overflow:hidden;
		}
		.music_info .more{
			margin-left:900px;
		}
		.music_table ul{
			width:100%;
			height:7%;
			overflow:hidden;
			border-radius:10px;
			margin:0px;
		}
		.music_table ul:nth-child(2n-1){
			background:#fff1f1;/*#b1b1b1;*/
		}
		.music_table ul:nth-child(2n){
			background:#b1b1b1;
		}
		.music_table ul li{
			height:100%;
			float:left;
			font-size:13px;
			padding-top:0.5%;
		}
		
		/*电台*/
		.recorder{
			width:100%;
			height:0px;
			overflow:hidden;
			margin-top:90px;
			display:block;
			position: absolute;
			top:0px;
			background:white;
			transition:height 1s;
		}
		#recorder{
			width:1000px;
			margin:0px auto;
		}
		
		.recorder_one{
			float:left;
			margin-left:58px;
			margin-top:10px;
		}
		.recorder_one li:nth-child(1){
			width:148px;
			height:148px;
			background:gray;
			overflow:hidden;
		}
		.recorder_one li:nth-child(1) img{
			display:block;
			margin:4px;
		}
		
		/*导航栏*/
		#items{
			margin-top:40px;
			width:100%;
			height:50px;
			background:rgb(245,237,235,.8);
		}
		#items .content{
			width:1000px;
			margin:0px auto;
			height:50px;
		}
		#items .content ul li{
			float:left;
			padding:0px 30px;
			line-height:50px;
			font-size:18px;
			cursor:pointer;
		}
		#items .content ul li:nth-child(1){
			background:#1c93b3;
			color:white;
		}
		
		/*热门歌曲*/
		.Hotmusic {
			width:100%;
			margin-top:90px;
			position: absolute;
			top:0px;
			background:#d8d8d8;
			height:0px;
			overflow:hidden;
			transition:height 1s;
		}
		.Hotmusic #music_panel{
			width:1000px;
			height:100%;
			margin:0px auto;
		}
		#music_panel .music-left{
			float:left;
			height:100%;
			width:228px;
			background:#1c93b3;
		}
		#music_panel .music-right{
			float:left;
			height:100%;
			width:770px;
			background:#f7f1ef;
		}
		#music_panel .music-left ul li{
			width:100%;
			height:45px;
			cursor:pointer;
		}
		#music_panel .music-left ul li:nth-child(1){
			background:black;
			color:white;
		}
		#music_panel .music-left ul li span:nth-child(1){
			font-size:16px;
			line-height:45px;
			display:block;
			float:left;
			margin-left:10px;
			width:120px;
			overflow:hidden;
			height:45px;
		}
		#music_panel .music-left ul li span:nth-child(2){
			font-size:20px;
			line-height:45px;
			display:block;
			float:right;
			margin-right:10px;
		}
		.music-right .list-top{
			width:100%;
			height:40px;
			border-bottom:1px solid black;
			border-top:1px solid black;
		}
		.music-right .data-list{
			width:770px;
			overflow:hidden;
		}
		.music-right .data-list .data-area .data{
			width:764px;
			float:left;
			height:100%;
			position: relative;
			transition:top 1s;
		}
		.music-right .data-list .data-area .scroll{
			width:6px;
			float:right;
			height:100%;
			position:relative;
			background:#2b2b2b;
		}
		.music-right .data-list .data-area .scroll .scroll-bar{
			width:100%;
			height:100%;
			position: relative;
			background:#cec5c5;
			border-radius:4px;
			transition:top 1s;
		}
	</style>
  </head>
  <body>
  	<div id="lunbo">
  		<div id="items">
  			<div class="content">
  				<ul>
  					<li item="1">首页</li>
	  				<li item="0">热门榜单</li>
	  				<li item="0">热门歌曲</li>
	  				<li item="0">热门专辑</li>
	  				<li item="0">热门电台</li>
	  				<li item="0">热门歌手</li>
  				</ul>
  			</div>
  		</div>
	 	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		  </div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
  	<div class="music_info model">
	  	<div id="music">
	  		<div class="title">
	  			<p style="float:left;font-size:25px;"">热门歌曲：</p>
	  			<p class="more" style="float:left" method="music"><i>></i>更多</p>
	  		</div>
	  		<div class="music_table">
				<ul style="margin-top:35px;">
					<li style="width:40%;">歌名</li>
					<li style="width:25%;">歌手</li>
					<li style="width:25%;">专辑</li>
					<li style="width:10%;">操作</li>
				</ul>
			</div>
	  	</div>
	</div>
	<div class="recorder model">
		<div id="recorder">
	  		<div class="title" style="height:50px;">
	  			<p style="float:left;font-size:25px;"">电台：</p>
	  			<p class="more" style="float:left" method="recorder"><i>></i>更多</p>
	  		</div>
	  		<div class="recorder_content">
	  			<div class="recorder_one" style="margin-left:0px;">
	  			<a href="detail.do?method=recorder&recorder_id=8">
	  				<li><img src="img/109951163754360444.jpg"></li>
	  				<li>这十年，你的音乐品味...</li>
	  			</a>
	  			</div>
	  			<div class="recorder_one">
	  			<a href="detail.do?method=recorder&recorder_id=9">
	  				<li><img src="img/109951163752905752.jpg"></li>
	  				<li>第4期 |跨年特别...</li>
	  			</a>
	  			</div>
	  			<div class="recorder_one">
	  			<a href="detail.do?method=recorder&recorder_id=10">
	  				<li><img src="img/109951163754420348.jpg"></li>
	  				<li>90后创作精灵－白安</li>
	  			</a>
	  			</div>
	  			<div class="recorder_one">
	  			<a href="detail.do?method=recorder&recorder_id=11">
	  				<li><img src="img/109951163753401004.jpg"></li>
	  				<li>曹操（Cover:林俊杰）</li>
	  			</a>
	  			</div>
	  			<div style="float:right;width:180px;margin-top:10px;">
	  				<img style="width:180px;height:322px;" src="img/recorder.jpg">
	  			</div>
	  			<div class="recorder_one" style="margin-left:0px;">
	  			<a href="detail.do?method=recorder&recorder_id=12">
	  				<li><img src="img/109951163752968193.jpg"></li>
	  				<li>第203期：幸福ing</li>
	  			</a>
	  			</div>
	  			<div class="recorder_one">
	  			<a href="detail.do?method=recorder&recorder_id=13">
	  				<li><img src="img/109951163733801995.jpg"></li>
	  				<li>不染（cover毛不易）</li>
	  			</a>
	  			</div>
	  			<div class="recorder_one">
	  			<a href="detail.do?method=recorder&recorder_id=14">
	  				<li><img src="img/109951163753379901.jpg"></li>
	  				<li>《来电狂响》：要相信你...</li>
	  			</a>
	  			</div>
	  			<div class="recorder_one">
	  			<a href="detail.do?method=recorder&recorder_id=15">
	  				<li><img src="img/109951163757072718.jpg"></li>
	  				<li>LI - 抖音小助手 mix&sky</li>
	  			</a>
	  			</div>
	  		</div>
		</div>
	</div>
  	<div class="contain_zhuanji model">
	  	<div id="zhuanji">
	  		<div class="title">
	  			<p style="float:left;font-size:25px;">专辑：</p>
	  			<p class="more" style="float:left" method="zhuanji"><i>></i>更多</p>
	  		</div>
	  	</div>
	</div>
	<div class="contain_singer model">
	  	<div id="singer">
	  		<div class="title">
	  			<p style="float:left;font-size:25px;"">歌手：</p>
	  			<p class="more" style="float:left" method="singer"><i>></i>更多</p>
	  		</div>
	  	</div>
	</div>
	<div class="Hotmusic model">
		<div id="music_panel">
			<div class="music-left">
				<ul></ul>
			</div>
			<div class="music-right">
				<div class="list-top" item="0">
					<p style="margin-left:10px;float:left;font-size:15px;line-height:40px;">名字:<span style="font-size:15px;line-height:40px;">hahahhaha</span></p>
					<p id="play" style="cursor:pointer;border-radius:4px;background:#169af3;width:80px;float:right;height:30px;margin-top:5px;margin-right:10px;">
						<i style="margin-left:10px;margin-top:2px;width:25px;height:25px;transform:scale(0.6);display:block;float:left;background:url(img/player_icon.png) -2px -2px;"></i>
						<i style="line-height:30px;color:white;display:block;float:right;margin-right:15px;">播放</i>
					</p>
				</div>
				<div class="data-list">
					<div class="data-area">
						<div class="data">
						</div>
						<div class="scroll">
							<div class="scroll-bar"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
  <script src="script.do?method=main"></script>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.mousewheel.js"></script>
  <script src="js/Base64.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/play_list.js"></script>
  <script src="js/jquery.function.js"></script>
  <script>
  	//全局变量
  	var list = []
  	//保存当前显示列表歌曲数目
  	var list_count = 0
    //保存当前滚动条位置
	var scroll_index = 0
  	//添加script --->热门歌单
  	for(i in playList){
  		var s = "163Hot/"+i+".js"
  		document.writeln("<script src='"+s+"'><\/script>")
  	}
  	//设置窗口初始化
  	$(".data-list").css("height",$(document).height() - 131 + "px")
  	//console.log(main_data)
  	//给热门加特效
  	$("#items .content ul li:eq(2)").click(function(){
  		all_do.init_model()
  		$(".music_info").css("height",$(document).height() - 90 + "px")
  		all_do.reset_item($("#items .content ul li:eq(2)"))
  	})
  	$("#items .content ul li:eq(0)").click(function(){
  		all_do.init_model()
  		all_do.reset_item($("#items .content ul li:eq(0)"))
  	})
  	$("#items .content ul li:eq(1)").click(function(){
  		all_do.init_model()
  		$(".Hotmusic").css("height",$(document).height() - 90 + "px")
  		all_do.reset_item($("#items .content ul li:eq(1)"))
  	})
  	$("#items .content ul li:eq(3)").click(function(){
  		all_do.init_model()
  		$(".contain_zhuanji").css("height",$(document).height() - 90 + "px")
  		all_do.reset_item($("#items .content ul li:eq(3)"))
  	})
  	$("#items .content ul li:eq(4)").click(function(){
  		all_do.init_model()
  		$(".recorder").css("height",$(document).height() - 90 + "px")
  		all_do.reset_item($("#items .content ul li:eq(4)"))
  	})
  	$("#items .content ul li:eq(5)").click(function(){
  		all_do.init_model()
  		$(".contain_singer").css("height",$(document).height() - 90 + "px")
  		all_do.reset_item($("#items .content ul li:eq(5)"))
  	})
  	//给导航加上特效
  	$("#items .content ul li").hover(function(){
  		if($(this).attr("item") == "1") return
  		$(this).css("background","#1c93b3")
  		$(this).css("color","white")
  	},function(){
  		if($(this).attr("item") == "1") return
  		$(this).css("background","rgb(245,237,235,.8)")
  		$(this).css("color","black")
  	})
  	//给ge单选择加特效
  	//$("#music_panel .music-left ul li").hover(function(){
  	//	alert()
  	//	if($(this).attr("index")*1 == $(".list-top").attr("item")){
  	//		return
  	//	}
  	//	$(this).css("color","white").css("background","black")
  	//},function(){
  	//	if($(this).attr("index")*1 == $(".list-top").attr("item")){
  	//		return
  	//	}
  	//	$(this).css("color","rgb(51, 51, 51)").css("background","rgb(28, 147, 179)")
  	//})
  	var all_do = {
	  	//封装一个函数将所有的热门模块高度全部设置成0
		init_model:function(){
	  		$(".model").each(function(){
	  			$(this).css("height","0px")
	  		})
	  	},
	  	//封装一个方法将所有导航栏颜色充值的函数 并将当前对象颜色设置为选中颜色
	  	reset_item:function(now){
	  		$("#items .content ul li").each(function(){
	  			$(this).css("background","rgb(245,237,235,.8)")
	  			$(this).css("color","black")
	  			$(this).attr("item","0")
	  		})
	  		now.css("background","#1c93b3")
	  		now.css("color","white")
	  		now.attr("item","1")
	  	}
	}
  	//求json文件键值对数量
  	function json_size(d){
  		var count = 0
  		for(var i in d){
  			if(d.hasOwnProperty(i)){
  				count ++ 
  			}
  		}
  		return count
  	}
  	//歌曲俩表展示的封装
  	var list_do = {
  		add:function(d,j){
  			$(".list-top p:eq(0) span").html(d.name)
  			d = d.data
  			for(var i in d){
  				var item = $("<div class='item' style='color:#2f2e2e;line-height:40px;width:100%;height:40px;border-bottom:0.3px solid #949494;'></div>")
  				var div_index = $("<div style='float:left;width:4%;text-align:right;'>"+i+"</div>")
  				var div_music = $("<div style='padding-left:10px;float:left;width:56%;'>name:<a singer_name='"+d[i].singer_name+"' music_name='"+d[i].music_name+"' time='"+d[i].time+"' zhuanji_name='"+d[i].zhuanji_name+"' singer_img='"+d[i].singer_img+"' style='text-decoration:none;color:#2f2e2e;' href='javascript:void(0)' onclick='music_play(this)' src='"+d[i].music_url+"'>"+(d[i].music_name.length > 20 ? d[i].music_name.substring(0,20)+"..." : d[i].music_name)+"</a></div>")
  				var div_play = $("<div style='height:40px;float:left;width:10%;'></div>")
  				var div_singer = $("<div style='padding-right:10px;text-align:right;float:left;width:30%;'>singer:"+d[i].singer_name+"</div>")
  				item.append(div_index).append(div_music).append(div_play).append(div_singer)
  				$(".data-list .data-area .data").append(item)
  			}
  			list_count = json_size(d)
  			$(".scroll .scroll-bar").css("height",$(".data").height() / (json_size(d)*40)*$(".data").height())
  			$(".list-top").attr("item",j)
  		},
  		clear:function(){
  			$(".data-list .data-area .data div").each(function(){
  				$(this).remove()
  			})
  		},
  		init:function(){
  			for(var i = 0 ; i <= list.length ; i++){
  	  			var temp = null
  	  			var li = null  
  	  			if(i == list.length){
  	  				temp = "自定义歌单"
  	  			}else{
  	  				temp = list[i].name
  	  			}
  	  			li = $("<li onclick='chose_list(this)' index='"+i+"'><span>"+temp+"</span><span>></span></li>")
  	  			li.hover(function(){
  	  				if($(this).attr("index")*1 == $(".list-top").attr("item")){
  	  		  			return
  	  		  		}
  	  		  		$(this).css("color","white").css("background","black")
  	  			},function(){
  	  				if($(this).attr("index")*1 == $(".list-top").attr("item")){
  	  		  			return
  	  		  		}
  	  		  		$(this).css("color","rgb(51, 51, 51)").css("background","rgb(28, 147, 179)")
  	  			})
  	  			$("#music_panel .music-left ul").append(li)
  	  		}
  		}
  	}
  	//选择热门歌单的点击事件
  	function chose_list(obj){
  		$("#music_panel .music-left ul li").each(function(){
  			$(this).css("background","#1c93b3").css("color","#333")
  		})
  		$(obj).css("background","black").css("color","white")
  		
  		if($(obj).attr("index")*1 != list.length){
  			list_do.clear()
  			list_do.add(list[$(obj).attr("index")*1],$(obj).attr("index")*1)
  		}else{
  			var index = $(obj).attr("index")
  			$(".list-top").attr("item",index)
  		}
  	}
  	//播放歌曲
  	function music_play(obj){
  		$.ajax({url:$(obj).attr("src"),type:"GET",success:function(data){
  			data = eval(data)[0].data
  			var music = new music_my($(obj).attr("src"))
  			data["timelength"] = $(obj).attr("time")
  			data["img"] = $(obj).attr("singer_img")
  			data["author_name"] = $(obj).attr("singer_name")
  			data["album_name"] = $(obj).attr("zhuanji_name")
  			data["song_name"] = $(obj).attr("music_name")
  			music.add_music(data)
  		}})
  	}
  	//展示歌单
  	$(function(){
  		list_do.init()
  		list_do.add(list[0],0)
  	})
  	//滚动条js实现
  	$(function(){
  		//保存每次移动记录条数
  		var scroll_size = 40 * 2
  		$("body").mousewheel(function(event , delta){
  			var dir = delta > 0 ? 'Up' : 'Down';
  			//保存页面中未显示的高度
  			var release_height = list_count*40 - $(".data").height()
  			if(dir == "Up"){
  				if(scroll_index - 1 == 0){
  					scroll_index --
  					$(".data").css("top","0px")
  					$(".scroll .scroll-bar").css("top","0px")
  				}else if(scroll_index != 0){
  					$(".data").css("top",-(--scroll_index)*scroll_size)
  					$(".scroll .scroll-bar").css("top",scroll_index*scroll_size/release_height*$(".data").height())
  				}
  			}else if(dir == "Down"){
  				if((scroll_index+1) * scroll_size > release_height && (scroll_index+1) * scroll_size < release_height+scroll_size){
  					scroll_index ++
  					$(".data").css("top",-release_height)
  					$(".scroll .scroll-bar").css("top",release_height/(list_count*40) * $(".data").height())
  				}else if(scroll_index * scroll_size < release_height){
	  				$(".data").css("top",-(++scroll_index)*scroll_size)
	  				$(".scroll .scroll-bar").css("top",(scroll_index*scroll_size)/(list_count*40)*$(".data").height())
  				}
  			}
  		})
  	})
  	//播放整个歌单
  	$("#play").click(function(){
  		var item = $(this).parents(".list-top").attr("item")*1
  		parent.music_list = list[item].data
  		parent.music_index = 0
  		parent.music_count = json_size(list[item].data)
  		$("#music_player" , parent.document)[0].pause()
  		parent.music_next()
  	})
  	//处理轮播
  	$(function(){
  		var data = main_data[0].lunbo
  		for (var i=0;i<data.length;i++){
  			if(i == 0){
  				$("#carousel-example-generic .carousel-inner")
  	  			.append($("<div class='item active'></div>")
  	  					.append($("<img style='width:100%;height:"+($(document).height()-90)+"px;' src=img/"+data[i].pic+">"))
  	  					.append("<div class='carousel-caption'>...</div>"))
  			}else{
  				$("#carousel-example-generic .carousel-inner")
  	  			.append($("<div class='item'></div>")
  	  					.append($("<img style='width:100%;height:"+($(document).height()-90)+"px;' src=img/"+data[i].pic+">"))
  	  					.append("<div class='carousel-caption'>...</div>"))
  			}
  		}
  	})
  	//展示热门专辑
  	$(function(){
  		var data = main_data[0].zhuanji_info
  		for(var i=0;i<10;i++){
  			if(i < data.length){
  				if(i == 0){
  					var img = $("<img src='singer_image/"+data[i].zhuanji_img+".jpg'>")
  	  				var p = $("<p>专辑："+data[i].zhuanji_name+"</p><p>歌手："+data[i].singer_name+"</p>")
  	  				var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'></a>").append(img).append(p)
  	  				var div = $("<div class='zhuanji_child_first'></div>").append(a)
  	  				$("#zhuanji").append(div)
  				}else{
  					var img = $("<img src='singer_image/"+data[i].zhuanji_img+".jpg'>")
  	  				var p = $("<p>专辑："+data[i].zhuanji_name+"</p><p>歌手："+data[i].singer_name+"</p>")
  	  				var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'></a>").append(img).append(p)
  	  				var div = $("<div class='zhuanji_child'></div>").append(a)
  	  				$("#zhuanji").append(div)
  				}
  			}
  		}
  	})
  	//展示热门歌手
  	$(function(){
  		var data = main_data[0].singer_info
  		
  		for(var i=0;i<data.length;i++){
  			var img = $("<img src="+data[i].singer_img+">")
  			var p = $("<p style='margin-top:10px;border-radius:20px;color:black;text-align:center;'>"+data[i].singer_name+"</p>")
  			var a = $("<a href='detail.do?method=singer&singer_id="+new Base64().encode(data[i].singer_id+"")+"'></a>").append(img).append(p)
  			var div = $("<div class='singer_child'></div>").append(a)
  			$("#singer").append(div)
  		}
  		$("#singer .singer_child:eq(0)").css("margin-left","0px")
  		$("#singer .singer_child:eq(5)").css("margin-left","0px")
  		$("#singer .singer_child:eq(10)").css("margin-left","0px")
  		$("#singer .singer_child:eq(15)").css("margin-left","0px")
  	})
  	//更多功能   的点击事件
  	$(function(){
  		$(".more").each(function(){
  			$(this).click(function(){
  				var method=$(this).attr("method")
  				location = "more.do?method="+method
  			})
  		})
  	})
  	//处理热门歌曲展示
  	$(function(){
  		var data = main_data[0].music_info
  		
  		for(var i=0;i<data.length;i++){
  			$("#music .music_table").append($("<ul></ul>")
  					.append($("<li style='width:40%;' class='music_name'>"+data[i].music_name+"</li>"))
  					.append($("<li style='width:25%;' class='singer_name'>"+data[i].singer_name+"</li>"))
  					.append($("<li style='width:25%;' class='zhuanji_name'>"+data[i].zhuanji_name+"</li>"))
  					.append($("<li style='width:10%;'></li>")
  							.append($("<i class='like' style='float:left;width:18px;display:block;height:18px;background:url(img/player_icon.png) 0px 336px;'></i>"))
  							.append($("<i class='add' style='float:left;width:18px;display:block;height:18px;background:url(img/player_icon.png) 0px 318px;'></i>"))
  							))
  		}
  	})
  </script>
</html>
