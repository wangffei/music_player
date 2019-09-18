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
			position:relative;
			overflow:hidden;
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
			width:255px;
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
		}
		#music{
			position:absolute;
			left:650px;
			top:0px;
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
    			<li id="zhuanji_type"><span>住址：</span></li>
    			<li id="singer_name"><span>专辑数：</span></li>
    			<li id="zhuanji_date"><span>出生日：</span></li>
    		</ul>
    		<div class="desc">
    		</div>
    		<p>详情扫码</p>
    	</div>
    	<div id="right">
    		<div class="left"><span><</span></div>
    		<div class="center">
    			<div class="content" id="zhuanji">
    				<h3>所有专辑：</h3>
    				<ul></ul>
    			</div>
    			<div class="content" id="music">
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
  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/Base64.js"></script>
  <script src="js/jquery.function.js"></script>
  <script>
  	//设置默认属性
  	$(function(){
  		$("#container").css("height",$(document).height())
  		$("#right").css("height",$(document).height())
  		$("#left .left-pic img").attr("src",data[0].singer_info[0].singer_img)
  		$("#zhuanji_name").append($("<span>"+data[0].singer_info[0].singer_name+"</span>"))
  		$("#zhuanji_type").append($("<span>"+data[0].singer_info[0].singer_location+"</span>"))
  		$("#singer_name").append($("<span>"+data[0].zhuanji_info.length+"</span>"))
  		$("#zhuanji_date").append($("<span>"+data[0].singer_info[0].singer_borndate+"</span>"))
  		var url = encodeURI("code.do?method=qrcode&useimg=true&singer_id="+new Base64().encode(data[0].singer_info[0].singer_id+"")+"&data=https://www.baidu.com/s?wd="+data[0].singer_info[0].singer_name)
  		$("#left .desc").append($("<img src='"+url+"'>"))
  	})
  	//解析所有专辑信息
  	$(function(){
  		var _data = data[0].zhuanji_info
  		
  		for (var i=0;i<_data.length;i++){
  			var li = $("<li></li>")
  			var img = $("<img src='singer_image/"+_data[i].zhuanji_img+".jpg'>")
  			var p_name = $("<p>名字："+_data[i].zhuanji_name+"</p>")
  			var p_date = $("<p>发行日期："+_data[i].zhuanji_date+"</p>")
  			var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(_data[i].zhuanji_id+"")+"'></a>")
  			
  			a.append(img).append(p_name).append(p_date)
  			li.append(a)
  			$("#zhuanji ul").append(li)
  		}
  	})
  	//解析歌曲信息
  	$(function(){
  		var _data = data[0].music_info
  		for (var i=0;i<_data.length;i++){
  			var music_name = $("<li></li>")
  				.append($("<a href='javascript:void(0)' onclick= 'music_click(this)' src='detail.do?method=music&music_id="+new Base64().encode(_data[i].music_id+"")+"'>"+_data[i].music_name+"</a>"))
  			
  			var zhuanji_name = $("<li></li>")
  				.append($("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(_data[i].zhuanji_id+"")+"'>"+_data[i].zhuanji_name+"</a>"));
  			
  			var i_icon = $("<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 221px\"></i>"
  		  	  		+"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 336px\"></i>"+
  		  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 203px\"></i>"+
  		  	  		"<i style=\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('img/player_icon.png') 0px 317px\"></i>")
  			
  			var icon = $("<li></li>").append(i_icon)
  			
  			$("#music").append($("<ul></ul>").append(music_name).append(zhuanji_name).append(icon))
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
  	//换页效果
  	$(function(){
  		var flag = false;
  		//当前标签
  		var ele = null
  		//下一页
  		function movenext(){
  			var now = ele
  			var next = now.next()
  			flag = true
  			
  			now.css("left",ele.css("left").replace("px","")*1 - 10 + "px")
  			next.css("left",next.css("left").replace("px","")*1 - 10 + "px")
  			
  			if(now.css("left").replace("px","")*1 != -650){
  				window.setTimeout(movenext, 10);
  			}else{
  				flag = false
  			}
  		}
  		function movelast(){
  			var now = ele
  			var next = now.next()
  			flag = true
  			
  			now.css("left",ele.css("left").replace("px","")*1 + 10 + "px")
  			next.css("left",next.css("left").replace("px","")*1 + 10 + "px")
  			
  			if(now.css("left").replace("px","")*1 != 0){
  				window.setTimeout(movelast, 10);
  			}else{
  				flag = false
  			}
  		}
  		$("#right .right").click(function(){
  			if(!flag){
  				$(this).parents("#right").find(".content").each(function(){
  					if($(this).css("left").replace("px","")*1 == 0){
  						ele = $(this)
  						if(ele.next().length){
  							window.setTimeout(movenext, 10)
  						}
  					}
  				})
  			}
  		})
  		$("#right .left").click(function(){
  			if(!flag){
  				$(this).parents("#right").find(".content").each(function(){
  					if($(this).css("left").replace("px","")*1 == -650){
  						ele = $(this)
  						window.setTimeout(movelast, 10)
  					}
  				})
  			}
  		})
  	})
  </script>
</html>
