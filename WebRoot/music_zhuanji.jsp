<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dao.MoreDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'music_zhuanji.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="http://localhost/music_player/css/bootstrap.min.css">
	<style>
		*{margin:0px;padding:0px;font-size:12px;}
		li{list-style:none;}
		a{text-decoration: none;color:black;}
		p{margin:0px;}
		
		#left .left-box{
			width:230px;
			height:400px;
			background:#4eff0073;
			margin:50px auto;
			overflow:hidden;
			border-radius:10px;
		}
		#left .left-box ul li{
			width:100%;
			padding:20px;
			letter-spacing: 5px;
			cursor:pointer;
			font-size:18px;
		}
		#left .left-box ul li:hover{
			color:#c6c73eeb;
		}
		#left .left-box ul li:first-child{
			margin-top:45px;
		}
		
		#right{
			float:right;
			width:800px;
		}
		#right .zhuanji_content{
			width:750px;
			height:450px;
			background:#f4f4eaa8;
			margin:30px auto;
			border-radius:10px;
			overflow:hidden;
		}
		
		/*标题样式*/
		.top .title{
			float:left;
			font-size:25px;
			font-family:"宋体";
			line-height:30px;
		}
		.top .chose{
			margin-top:10px;
			margin-left:625px;
		}
		.top .btn{
			height:30px;
		}
		
		/*推荐不分样式*/
		.top{
			width:100%;
			height:30px;
		}
		
		/*专辑展示样式*/
		.bottom .zhuanji_show{
			width:140px;
			height:190px;
			float:left;
			border-radius:5px;
			overflow:hidden;
			margin-top:12px;
			margin-left:10px;
		}
		.bottom .zhuanji_show li{
			text-align:center;
			color:#4746467d;
		}
		.bottom .zhuanji_show:hover li{
			color:red;
		}
		.bottom .zhuanji_show li img{
			width:140px;
			height:140px;
		}
		
		/*右边筛选部分*/
		.chose p{
			width:80px;
			height:30px;
			border-radius:10px;
			background:white;
			cursor:pointer;
		}
		.chose p select{
			width:60px;
			height:20px;
			outline:none;
			border:0px;
			margin:5px 10px; 
			background:white;
			text-align:center;
		}
		.chose p select option{
			width:100px;
			height:30px;
			text-align:center;
			line-height:30px;
		}
		.left-box{
			position:fixed;
			top:0px;
		}
	</style>
  </head>
  <script>
  	var zhuanji_data = <%= MoreDao.getZhuanji_type()%>
  </script>
  <body>
    <div id="left">
    	<div class="left-box">
    		<ul class="type">
    			<li name="tuijian">推荐</li>
    			<li name="huayu">华语</li>
    			<li name="oumei">欧美</li>
    			<li name="yinyueren">音乐人</li>
    			<li name="hanguo">韩国</li>
    		</ul>
    	</div>
    </div>
    <div id="right">
    	<div class="zhuanji_content" id="tuijian">
    		<div class="top">
    			<p class="title">推荐：</p>
    			<div class="chose">
					<p><select class="select"><option>时间</option></select></p>
				</div>
    		</div>
    		<div class="bottom"></div>
    	</div>
    	<div class="zhuanji_content" id="huayu">
    		<div class="top">
    			<p class="title">华语：</p>
    			<div class="chose">
					<p><select class="select"><option>时间</option></select></p>
				</div>
    		</div>
    		<div class="bottom"></div>
    	</div>
    	<div class="zhuanji_content" id="oumei">
    		<div class="top">
    			<p class="title">欧美：</p>
    			<div class="chose">
					<p><select class="select"><option>时间</option></select></p>
				</div>
    		</div>
    		<div class="bottom"></div>
    	</div>
    	<div class="zhuanji_content" id="yinyueren">
    		<div class="top">
    			<p class="title">音乐人：</p>
    			<div class="chose">
					<p><select class="select"><option>时间</option></select></p>
				</div>
    		</div>
    		<div class="bottom"></div>
    	</div>
    	<div class="zhuanji_content" id="hanguo">
    		<div class="top">
    			<p class="title">韩国：</p>
    			<div class="chose">
					<p><select class="select"><option>时间</option></select></p>
				</div>
    		</div>
    		<div class="bottom"></div>
    	</div>
    </div>
  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.mousewheel.js"></script> 
  <script src="js/jquery.function.js"></script>
  <script src="js/Base64.js"></script>
   <script src="js/bootstrap.min.js"></script>
  <script>
  	//给下拉按钮加点击事件
  	$(function(){
  		$(".chose p .select").each(function(){
  			$(this).click(function fn(){
  				var _this = $(this)
  				ajax("more.do?method=getdate&data="+$(this).parents(".zhuanji_content").find(".title").html().replace("：",""),function(data){
  					_this.find("option").each(function(){
  						$(this).remove()
  					})
  					data = eval(data)
  					for(var i=0;i<data.length;i++){
  						_this.append("<option>"+(data[i].zhuanji_date+"").substring(0,4)+"</option>")
  					}
  					_this.unbind("click" , fn)
  				},function(){
  					console.log("加载失败")
  				})
  			})
  		})
  		//根据选择跟新页面
  		$(".chose p .select").each(function(){
  			$(this).change(function(){
  				var _this = $(this)
  				//alert(_this.val())
  				ajax("page.do?method=zhuanji&year="+_this.val() , function(data){
  					data = eval(data)
  					_this.parents(".zhuanji_content").find(".zhuanji_show").each(function(){
  						$(this).remove()
  					})
  					
  					for (var i=0;i<data.length;i++){
  						var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'></a>")
	  			  			.append($("<li><img src='singer_image/"+data[i].zhuanji_img+".jpg'></li>"))
	  			  			.append($("<li>名字："+data[i].zhuanji_name+"</li>"))
	  			  			.append($("<li>歌手："+data[i].singer_name+"</li>"))
  		  				_this.parents(".zhuanji_content").find(".bottom").append($("<ul data='"+new Base64().encode(data[i].zhuanji_id+"")+"' class='zhuanji_show'></ul>").append(a))
  					}
  				},function(){
  					concole.log("加载失败");
  				})
  			})
  		})
  	})
  	//给导航栏加监听事件
  	//$(function(){
  		//alert($(document).scrollTop())
  	//	$(document).mousewheel(function(event , delta){
	//		var dir = delta > 0 ? 'Up' : 'Down';
	//		if(dir == "Up"){
	//			if($(document).scrollTop() != 0){
	//				$("#left .left-box").css("margin-top",$(document).scrollTop()-50+"px")
	//			}else{
	//				$("#left .left-box").css("margin-top","50px")
	//			}
	//		}else if(dir == "Down"){
	//			if($(document).scrollTop() != 0){
	//				$("#left .left-box").css("margin-top",150+$(document).scrollTop()+"px")
	//			}else{
	//				$("#left .left-box").css("margin-top","150px")
	//			}
	//		}
	//	})
  	//})
  	//滚动条的隐藏现实事件
  	$(function(){	
  		function mouse(){
  			$("body").css("overflow-y","hidden")
  		}
  		
  		var t = window.setTimeout(mouse, 5000);
  		$("body").mousewheel(function(event , delta){
  			var dir = delta > 0 ? 'Up' : 'Down';
  			if(t != null){
  				window.clearTimeout(t);
  			}
  			if(dir == "Up"){
  				//console.log("up")
  				$("body").css("overflow-y","auto")
  			}else if(dir == "Down"){
  				//console.log("down")
  				$("body").css("overflow-y","auto")
  			}
  			t = window.setTimeout(mouse, 5000);
  		})
  	})
  	//锚链接事件
  	$(function(){
  		$(".left-box ul li").each(function(){
  			$(this).click(function(){
  				var id = $(this).attr("name")
  				//$("#left .left-box").css("margin-top",50+$("#"+id).offset().top+"px")
  				$(document).scrollTop($("#"+id).offset().top)
  			})
  		})
  	})
 	//处理数据添加
  	$(function(){
  		//解析推荐部分
  		var data = zhuanji_data[0].tuijian
  		for (var i=0;i<data.length;i++){
  			var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'></a>")
	  			.append($("<li><img src='singer_image/"+data[i].zhuanji_img+".jpg'></li>"))
	  			.append($("<li>名字："+data[i].zhuanji_name+"</li>"))
	  			.append($("<li>歌手："+data[i].singer_name+"</li>"))
  			$("#tuijian .bottom").append($("<ul data='"+new Base64().encode(data[i].zhuanji_id+"")+"' class='zhuanji_show'></ul>").append(a))
  		}
  		//处理华语部分
  		data = zhuanji_data[0].huayu
  		for (var i=0;i<data.length;i++){
  			var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'></a>")
	  			.append($("<li><img src='singer_image/"+data[i].zhuanji_img+".jpg'></li>"))
	  			.append($("<li>名字："+data[i].zhuanji_name+"</li>"))
	  			.append($("<li>歌手："+data[i].singer_name+"</li>"))
  			$("#huayu .bottom").append($("<ul class='zhuanji_show'></ul>").append(a))
  		}
  		//处理欧美部分
  		data = zhuanji_data[0].oumei
  		for (var i=0;i<data.length;i++){
  			var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'></a>")
	  			.append($("<li><img src='singer_image/"+data[i].zhuanji_img+".jpg'></li>"))
	  			.append($("<li>名字："+data[i].zhuanji_name+"</li>"))
	  			.append($("<li>歌手："+data[i].singer_name+"</li>"))
  			$("#oumei .bottom").append($("<ul class='zhuanji_show'></ul>").append(a))
  		}
  		//处理音乐人部分
  		data = zhuanji_data[0].yinyueren
  		for (var i=0;i<data.length;i++){
  			var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'></a>")
	  			.append($("<li><img src='singer_image/"+data[i].zhuanji_img+".jpg'></li>"))
	  			.append($("<li>名字："+data[i].zhuanji_name+"</li>"))
	  			.append($("<li>歌手："+data[i].singer_name+"</li>"))
  			$("#yinyueren .bottom").append($("<ul class='zhuanji_show'></ul>").append(a))
  		}
  		//处理韩国不分
  		data = zhuanji_data[0].hanguo
  		for (var i=0;i<data.length;i++){
  			var a = $("<a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'></a>")
	  			.append($("<li><img src='singer_image/"+data[i].zhuanji_img+".jpg'></li>"))
	  			.append($("<li>名字："+data[i].zhuanji_name+"</li>"))
	  			.append($("<li>歌手："+data[i].singer_name+"</li>"))
  			$("#hanguo .bottom").append($("<ul class='zhuanji_show'></ul>").append(a))
  		}
  	})
  </script>
</html>
