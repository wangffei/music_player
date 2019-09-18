<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'singer_detail_yy.jsp' starting page</title>
    
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
		a{color:black;}
		#content{
			width:100%;
			background:#e5e5e5;	
			overflow:hidden;
		}
		#container{
			width:82%;
			overflow:hidden;
			margin:0px auto;
		}
		#loading div{
			width:200px;
			margin:150px auto;
		}
		#content{
			display:block;
		}
		#left{
			width:300px;
			height:400px;
			margin-top:50px;
			margin-left:30px;
			/*background:red;*/
			border-radius:10px;
			overflow:hidden;
			float:left;
		}
		#left .left-pic{
			width:140px;
			height:140px;
			float:left;
			border-radius:10px;
			overflow:hidden;
		}
		#left .left-pic img{
			width:140px;
			height:140px;
		}
		#left .left-info{
			float:left;
			width:150px;
			height:140px;
			border-radius:10px;
			margin-left:10px;
		}
		#left .left-info li{
			font-size:15px;
			margin-top:13px;
		}
		#left .desc{
			width:300px;
			height:372px;
		}
		#left .desc img{
			width:160px;
			height:160px;
			margin-top:55px;
		}
		#left p{
			color:red;
			margin-top:10px;
		}
		#right{
			width:750px;
			background:#e5e5e5;
			float:right;
		}
		#right .left{
			width:50px;
			height:100%;
			background:#e5e5e5;
			float:left;
		}
		#right .left span{
			width:30px;
			height:30px;
			line-height:30px;
			background:#bec7be;
			display:block;
			margin:245px auto 0px;
			border-radius:50%;
			text-align:center;
			font-size:20px;
		}
		#right .left:hover{
			background:#cdcaca;
			cursor:pointer;
		}
		#right .right{
			width:50px;
			height:100%;
			background:#e5e5e5;
			float:left;
		}
		#right .right:hover{
			background:#cdcaca;
			cursor:pointer;
		}
		#right .right span{
			width:30px;
			height:30px;
			line-height:30px;
			background:#bec7be;
			display:block;
			margin:245px auto 0px;
			border-radius:50%;
			text-align:center;
			font-size:20px;
		}
		#right .center{
			width:650px;
			height:100%;
			float:left;
			position:relative;
			overflow:hidden;
			font-size:12px;
		}
		.center .content{
			width:510px;
			height:430px;
			margin:50px auto 0px; 
			overflow:hidden;
			padding:0px 100px;
		}
		.center .content ul li{
			width:170px;
			height:30px;
			line-height:30px;
			float:left;
		}
		.center .content h3{
			font-size:20px;
		}
		.center .content ul li:hover a{
			color:red;
		}
		#zhuanji ul li{
			float:left;
			width:246px;
			height:60px;
			margin-top:30px;
		}
		#zhuanji ul li a img{
			width:60px;
			height:60px;
			display:block;
			float:left;
		}
		#zhuanji ul li a p{
			float:left;
			width:186px;
		}
		#zhuanji{
			position:absolute;
			top:0px;
			left:0px;
			overflow:auto;
		}
		#music{
			position:absolute;
			left:650px;
			top:0px;
		}
	</style>
  </head>
  <script>var singer_url = "${singer_url}" ;</script>
  <body>
    <div id="container">
    	<div id="content" style="display:none;">
    		<div id="left">
	    		<div class="left-pic">
	    			<img src="img/logo.png">
	    		</div>
	    		<ul class="left-info"></ul>
	    		<div class="desc">
	    		</div>
	    		<p>详情扫码</p>
	    	</div>
    		<div id="right">
    			<div class="left"><span><</span></div>
	    			<div class="center">
	    				<div style="position:absolute;left:0px;top:0px;" index="1" class="content">
	    					<ul class="title">
		    					<li>歌名</li>
		    					<li>专辑</li>
		    					<li>操作</li>
		    				</ul>
	    				</div>
	    			</div>
	    		<div class="right"><span>></span></div>
	    	</div>
    	</div>
    	<div id="load" style="width:100%;height:100%;overflow:hidden;">
    		<div style="margin-top:100px;text-align:center;"><img style="width:200px;height:200px;" src="img/load.gif"></div>
    	</div>
    </div>
  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.function.js"></script>
  <script>
  	var page = 0
  	$(function(){
		//$("#content").css("display","block")
		$(".desc").append($("<img src='code.do?method=qrcode&useimg=true&data=https://www.baidu.com/s?wd=无数据&pic_url=img/logo.png'>"))
		//专辑展示
  		$.ajax({url:"music.yy?method=singer_temp&singer_url="+singer_url,type:"GET",success:function(data){
  			$("#content").css("display","block")
  			$("#load").css("display","none")
  			data = decodeURI(data)
  	  		data = eval(data)
  	  		page = data.length % 10 == 0 ? data.length / 10 : data.length / 10 + 1
  	  		for (var i=0;i<data.length;i++){
  	  			if(i != 0 && i % 10 == 0){
  	  				var index = i/10 +1
  	  				$(".center").append($("<div index='"+index+"' style='position:absolute;left:650px;top:0px;' class='content'></div>"))
  	  				$(".center .content:last").append($("<ul class='title'><li>歌名</li><li>歌手</li><li>操作</li></ul>"))
  	  			}
  	  			var ul = $("<ul></ul>")
  	  			var music_name = $("<li></li>")
  	  				.append($("<a href='javascript:void(0)' onclick='music_click(this)' src='music.yy?method=music&music_url="+data[i].music_url+"'>"+(data[i].music_name.length > 8 ? data[i].music_name.substring(0,8) : data[i].music_name)+"</a>"))
  	  			
  	  			var zhuanji_name = $("<li></li>")
  	  				.append($("<a href='music.yy?method=zhuanji&zhuanji_url="+data[i].zhuanji_url+"'>"+(data[i].zhuanji_name.length > 8 ? data[i].zhuanji_name.substring(0,8) : data[i].zhuanji_name)+"</a>"));
  	  			
  	  			var i_icon = $("<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 221px\"></i>"
  	  		  	  		+"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 336px\"></i>"+
  	  		  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 203px\"></i>"+
  	  		  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 317px\"></i>")
  	  			
  	  			var icon = $("<li></li>").append(i_icon)
  	  			
  	  			ul.append(music_name).append(zhuanji_name).append(icon)
  	  			
  	  			$(".center .content:last").append(ul)
  	  		}
  			dopage()
  		}})
  	})
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
  	function dopage(){
  	//换页效果
  	  	$(function(){
  	  		var flag = false;
  	  		//当前标签
  	  		var ele = null
  	  		//记录当前页数
  	  		var index = 1
  	  		//下一页
  	  		function movenext(){
  	  			var now = ele
  	  			var next = now.next()
  	  			flag = true
  	  			
  	  			now.css("left",now.css("left").replace("px","")*1 - 10 + "px")
  	  			next.css("left",next.css("left").replace("px","")*1 - 10 + "px")
  	  			
  	  			if(now.css("left").replace("px","")*1 != -650){
  	  				window.setTimeout(movenext, 10);
  	  			}else{
  	  				flag = false
  	  				index ++
  	  			}
  	  		}
  	  		function movelast(){
  	  			var now = ele
  	  			var next = now.next()
  	  			flag = true
  	  			
  	  			now.css("left",now.css("left").replace("px","")*1 + 10 + "px")
  	  			next.css("left",next.css("left").replace("px","")*1 + 10 + "px")
  	  			
  	  			if(now.css("left").replace("px","")*1 != 0){
  	  				window.setTimeout(movelast, 10);
  	  			}else{
  	  				flag = false
  	  				index --
  	  			}
  	  		}
  	  		$("#right .right").click(function(){
  	  		//	alert(index)
  	  			if(!flag){
  	  				$(this).parents("#right").find(".content").each(function(){
  	  					if($(this).attr("index")*1 == index){
  	  					//	alert($(this).attr("index"))
  	  						if(index +1 > page || index < 0){
  	  							return;
  	  						}
  	  						ele = $(this)
  	  						if(ele.next().length){
  	  							window.setTimeout(movenext, 10)
  	  						//	index ++
  	  						}
  	  					}
  	  				})
  	  			}
  	  		})
  	  		$("#right .left").click(function(){
  	  		//	alert(index)
  	  			if(!flag){
  	  				$(this).parents("#right").find(".content").each(function(){
  	  					if($(this).attr("index")*1 == (index-1)){
  	  						if(index - 1 > page || index < 0){
  	  							return;
  	  						}
  	  						ele = $(this)
  	  						window.setTimeout(movelast, 10)
  	  					//	index -- 
  	  					}
  	  				})
  	  			}
  	  		})
  	  	})
  	}
  </script>
</html>
