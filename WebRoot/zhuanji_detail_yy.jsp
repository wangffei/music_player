<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>专辑详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>var zhuanji_url = "${zhuanji_url}";</script>
	<style>
		*{margin:0px;padding:0px;font-size:12px;}
		a{color:black;}
		li{list-style:none;}
		
		/*容器样式*/
		#container{
			width:82%;
			background:#e5e5e5;	
			overflow:hidden;
			margin:0px auto;
		}
		/*左侧专辑信息显示*/
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
		/*right*/
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
			overflow:hidden;
			position:relative;
		}
		.center .content{
			width:510px;
			height:430px;
			margin:50px 100px 0px; 
		}
		.center .content ul li{
			width:170px;
			height:30px;
			line-height:30px;
			float:left;
		}
		.center .content ul li:hover a{
			color:red;
		}
		
		#container{
			display:none;
		}
		#loading div{
			width:200px;
			height:200px;
			margin:150px auto;
		}
	</style>
  </head>
  
  <body>
  <div>
    <div id="container">
    	<div id="left">
    		<div class="left-pic">
    			<img src="img/logo.png">
    		</div>
    		<ul class="left-info">
    		</ul>
    		<div class="desc">
    		</div>
    		<p>详情扫码</p>
    	</div>
    	<div id="right">
    		<div class="left"><span><</span></div>
    		<div class="center">
    			<div class="content" index = "1" style="position:absolute;left:0px;top:0px;">
    				<ul class="title">
	    				<li>歌名</li>
	    				<li>歌手</li>
	    				<li>操作</li>
	    			</ul>
    			</div>
    		</div>
    		<div class="right"><span>></span></div>
    	</div>
    </div>
    <div id="loading">
    	<div>
    		<img src="img/load.gif">
    	</div>
    </div>
  </div>
  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.function.js"></script>
  <script>
 	var page = 1
  	$(function(){
  		$.ajax({
  			type:"GET",
  			url:"music.yy?method=zhuanji_temp&zhuanji_url="+zhuanji_url,
  			success:function(data){
  				$("#container").css("display","block")
  				$("#loading").css("display","none")
  				data = eval(decodeURI(data))
  				$(".desc").append($("<img src='code.do?method=qrcode&useimg=true&data=https://www.baidu.com/s?wd=暂无数据&pic_url=img/logo.png'>"))
  				for (var i=0;i<data.length;i++){
  		  			if(i != 0 && i % 10 == 0){
  		  				$(".center").append($("<div  style='position:absolute;left:650px;top:0px;' class='content' index = '"+(i/10+1)+"'><ul class='title'><li>歌名</li><li>歌手</li><li>操作</li></ul></div>"))
  		  				page ++ 
  		  			}
  		  			var music_name = $("<li></li>")
  		  				.append($("<a href='javascript:void(0)' onclick='music_click(this)' src='music.yy?method=music&music_url="+data[i].music_url+"'>"+data[i].music_name+"</a>"))
  		  			
  		  			var singer_name = $("<li></li>")
  		  				.append($("<a href='javascript:void(0)'>"+data[i].singer_name+"</a>"));
  		  			
  		  			var i_icon = $("<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 221px\"></i>"
  		  		  	  		+"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 336px\"></i>"+
  		  		  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 203px\"></i>"+
  		  		  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 317px\"></i>")
  		  			
  		  			var icon = $("<li></li>").append(i_icon)
  		  			
  		  			$("#right .center .content:last").append($("<ul></ul>").append(music_name).append(singer_name).append(icon))
  		  		}
  				dopage()
  			},error:function(){}
  		})
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
