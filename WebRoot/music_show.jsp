<%@page import="com.dao.MoreDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'music_show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		*{margin:0px;padding:0px;font-size:12px;}
		li{list-style:none;}
		a{color:black;}
		
		#container{
			width:80%;
			height:400px;
			background:#000000f7;
			margin:30px auto 0px;
		}
		/*公共*/
		.content{
			width:500px;
			height:341px;
			margin:29px auto;
			border-radius:10px;
			overflow:hidden;
		}
		.content ul li{
			width:125px;
			height:30px;
			float:left;
			font-size:14px;
			line-height:30px;
			border-top:1px solid black;
			color:#aeabab;
		}
		.content ul li:last-child{
			width:80px;
		}
		.content ul li:first-child{
			width:170px;
		}
		.content ul li a{
			color:#aeabab;
		}
		.content ul li a:hover{
			color:#ff8b8b;
		}
		/*左边*/
		#left{
			width:50%;
			float:left;
		}
		/*右边*/
		#right{
			width:50%;
			float:left;
		}
		
		/*底部*/
		#foot{
			width:80%;
			height:50px;
			background:#000000f7;
			border-top:1px solid red;
			margin:0px auto;
		}
		#foot ul li{
			width:30px;
			height:30px;
			background:#aeabab;
			margin-top:10px;
			border-radius:50%;
			float:left;
			margin-left:30px;
			cursor:pointer;
			font-size:18px;
			line-height:30px;
			text-align:center;
		}
		#foot ul li:hover{
			background:#000000f7;
			color:red;
		}
		#foot ul{
			width:600px;
			height:50px;
			margin:0px auto;
		}
	</style>
  </head>
  <script>
  	var music_data = <%=MoreDao.getMusicinfo()%>
  	
  	var pages = <%=MoreDao.getMusicPageCount()%>
  	
  	var pagenow = 1
  </script>
  <body>
    <div id="container">
    	<div id="left">
	    	<div class="content">
	    		<ul class="title">
	    			<li>歌名</li>
	    			<li>歌手</li>
	    			<li>专辑</li>
	    			<li>操作</li>
	    		</ul>
	    	</div>
	    </div>
	    <div id="right">
	    	<div class="content">
	    		<ul class="title">
	    			<li>歌名</li>
	    			<li>歌手</li>
	    			<li>专辑</li>
	    			<li>操作</li>
	    		</ul>
	    	</div>
	    </div>
    </div>
    <div id="foot">
    	<ul>
    	</ul>
    </div>
  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/Base64.js"></script>
  <script src="js/jquery.function.js"></script>
  <script>
  	//数据展示封装
  	function show(_data){
  		var count = _data.length > 10 ? 10 : _data.length
  		for(var i=0;i< count;i++){
  	  		var music_name = _data[i].music_name.length > 12 ? _data[i].music_name.substring(0,12) : _data[i].music_name
  	  		var zhuanji_name = _data[i].zhuanji_name.length > 8 ? _data[i].zhuanji_name.substring(0,8) : _data[i].zhuanji_name
  	  		var singer_name = _data[i].singer_name.length > 8 ? _data[i].singer_name.substring(0,8) : _data[i].singer_name
  	  		
  	  		//console.log(music_name.length)
  	  		//console.log(music_name + "\t" + zhuanji_name +"\t" +singer_name)
  	  		var li_music = $("<li></li>")
  	  			.append($("<a href='javascript:void(0)' onclick='music_click(this)' src='detail.do?method=music&music_id="+new Base64().encode(_data[i].music_id+"")+"'>"+music_name+"</a>"))
  	  			
  	  		var li_singer = $("<li></li>")
  	  			.append($("<a href='detail.do?method=singer&singer_id="+new Base64().encode(_data[i].singer_id+"")+"'>"+singer_name+"</a>"))
  	  			
  	  		var li_zhuanji = $("<li></li>")
  	  			.append($("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(_data[i].zhuanji_id+"")+"'>"+zhuanji_name+"</a>"))
  	  	
  	  		var i_icon = $("<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 221px\"></i>"
  	  		+"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 336px\"></i>"+
  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 203px\"></i>"+
  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 317px\"></i>")
  	  		var li_last = $("<li></li>").append(i_icon)
  	  		
  	  		var ul = $("<ul></ul>").append(li_music).append(li_singer).append(li_zhuanji).append(li_last)
  	  			
  	  		$("#left .content").append(ul)
  		}
  		if(count < 10){
  			return;
  		}
  		//alert(_data.length)
  		for(var i=10;i<_data.length;i++){
  	  		var music_name = _data[i].music_name.length > 12 ? _data[i].music_name.substring(0,12) : _data[i].music_name
  	  		var zhuanji_name = _data[i].zhuanji_name.length > 8 ? _data[i].zhuanji_name.substring(0,8) : _data[i].zhuanji_name
  	  		var singer_name = _data[i].singer_name.length > 8 ? _data[i].singer_name.substring(0,8) : _data[i].singer_name
  	  		
  	  		//console.log(music_name.length)
  	  		//console.log(music_name + "\t" + zhuanji_name +"\t" +singer_name)
  	  		var li_music = $("<li></li>")
  	  			.append($("<a href='javascript:void(0)' onclick='music_click(this)' src='detail.do?method=music&music_id="+new Base64().encode(_data[i].music_id+"")+"'>"+music_name+"</a>"))
  	  			
  	  		var li_singer = $("<li></li>")
  	  			.append($("<a href='detail.do?method=singer&singer_id="+new Base64().encode(_data[i].singer_id+"")+"'>"+singer_name+"</a>"))
  	  			
  	  		var li_zhuanji = $("<li></li>")
  	  			.append($("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(_data[i].zhuanji_id+"")+"'>"+zhuanji_name+"</a>"))
  	  		
  	  		var i_icon = $("<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 221px\"></i>"
  	  		+"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 336px\"></i>"+
  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 203px\"></i>"+
  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 317px\"></i>")
  	  		var li_last = $("<li></li>").append(i_icon)
  	  			
  	  		var ul = $("<ul></ul>").append(li_music).append(li_singer).append(li_zhuanji).append(li_last)
  	  			
  	  		$("#right .content").append(ul)
  		}
  	}
    //音乐点击事件
  	function music_click(obj){
  		$.ajax({
  			url:$(obj).attr("src"),
  			type:"GET",
  			success:function(data){
  				data = eval(data)[0].data
  				var m = new music_my($(obj).attr("src"))
  				m.add_music(data)
  			}
  		})
  	}
  	//处理歌曲展示
  	$(function(){
  		show(music_data)
  	})
  	//处理分页信息
  	$(function(){
  		var start = pagenow > 5 ? pagenow - 4 : 1;
  		if(pagenow > 5){
  			var end = pages > pagenow +5 ? pagenow +6 : pages+1;
  		}else{
  			var end = 11
  		}
  		//console.log(start +"\t" +end)
  		for(var i=start; i < end ; i++){
  			$("#foot ul").append($("<li>"+i+"</li>"))
  		}
  		$("#foot ul li").each(function(){
  			if($(this).html()*1 == pagenow){
  				$(this).css({"background":"#000000f7","color":"red"})
  			}
  		})
  	})
  	//事件处理封装
  	function music_event(){
  		$("#foot ul li").each(function(){
  			$(this).click(function(){
  				var _this = $(this)
  				if(pagenow == _this.html()){
  					return;
  				}
  				ajax("page.do?method=music&page="+_this.html() , function(data){
  					$("#foot ul li").each(function(){
  						$(this).remove()
  					})
  					pagenow = _this.html()*1
  					data = eval(data)
  					var start = pagenow > 5 ? pagenow - 4 : 1;
  			  		if(pagenow > 5){
  			  			var end = pages > pagenow +5 ? pagenow +6 : pages+1;
  			  		}else{
  			  			var end = 11
  			  		}
  			  		
  			  		console.log(pages +"\t"+ pagenow +"\t" +end)
  			  		//console.log(start +"\t" +end)
  			  		for(var i=start; i < end ; i++){
  			  			$("#foot ul").append($("<li>"+i+"</li>"))
  			  		}
  			  		$("#foot ul li").each(function(){
  			  			if($(this).html()*1 == pagenow){
  			  				$(this).css({"background":"#000000f7","color":"red"})
  			  			}
  			  		})
  			  		$(".content ul").each(function(){
  			  			if($(this).attr("class") != "title"){
  			  				$(this).remove()
  			  			}
  			  		})
  			  		show(data)
  			  		music_event()
  				},function(){
  					console.log("加载失败")
  				})
  			})
  		})
  	}
  	//ajax处理页面刷新
  	$(function(){
  		music_event()
  	})
  </script>
</html>
