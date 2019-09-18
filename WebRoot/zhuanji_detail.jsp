<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zhuanji_detail.jsp' starting page</title>
    
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
		}
		.center .content{
			width:510px;
			height:430px;
			margin:50px auto 0px; 
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
	</style>
  </head>
  <script>
  	var data = ${data}
  </script>
  <body>
    <div id="container">
    	<div id="left">
    		<div class="left-pic">
    			<img src="javascript:void(0)">
    		</div>
    		<ul class="left-info">
    			<li id="zhuanji_name"><span>名字：</span></li>
    			<li id="zhuanji_type"><span>类型：</span></li>
    			<li id="singer_name"><span>歌手：</span></li>
    			<li id="zhuanji_date"><span>发行日期：</span></li>
    		</ul>
    		<div class="desc">
    		</div>
    		<p>详情扫码</p>
    	</div>
    	<div id="right">
    		<div class="left"><span><</span></div>
    		<div class="center">
    			<div class="content">
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
  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/Base64.js"></script>
  <script src="js/jquery.function.js"></script>
  <script>
  	//设置默认属性
  	$(function(){
  		$("#container").css("height",$(document).height())
  		$("#right").css("height",$(document).height())
  		$("#left .left-pic img").attr("src","singer_image/"+data[0].zhuanji_info[0].zhuanji_img+".jpg")
  		$("#zhuanji_name").append($("<span>"+data[0].zhuanji_info[0].zhuanji_name+"</span>"))
  		$("#zhuanji_type").append($("<span>"+data[0].zhuanji_info[0].location+"</span>"))
  		$("#singer_name").append($("<span>"+data[0].zhuanji_info[0].singer_name+"</span>"))
  		$("#zhuanji_date").append($("<span>"+data[0].zhuanji_info[0].zhuanji_date+"</span>"))
  		var url = encodeURI("code.do?method=qrcode&useimg=true&zhuanji_id="+new Base64().encode(data[0].zhuanji_info[0].zhuanji_id+"")+"&data=https://www.baidu.com/s?wd="+data[0].zhuanji_info[0].singer_name)
  		$("#left .desc").append($("<img src='"+url+"'>"))
  	})
  	//解析歌曲信息
  	$(function(){
  		var _data = data[0].music_info
  		for (var i=0;i<_data.length;i++){
  			var music_name = $("<li></li>")
  				.append($("<a href='javascript:void(0)' onclick = 'music_click(this)' src='detail.do?method=music&music_id="+new Base64().encode(_data[i].music_id+"")+"'>"+_data[i].music_name+"</a>"))
  			
  			var singer_name = $("<li></li>")
  				.append($("<a href='detail.do?method=singer&singer_id="+new Base64().encode(_data[i].singer_id+"")+"'>"+_data[i].singer_name+"</a>"));
  			
  			var i_icon = $("<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 221px\"></i>"
  		  	  		+"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 336px\"></i>"+
  		  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 203px\"></i>"+
  		  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 317px\"></i>")
  			
  			var icon = $("<li></li>").append(i_icon)
  			
  			$("#right .center .content").append($("<ul></ul>").append(music_name).append(singer_name).append(icon))
  		}
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
  </script>
</html>
