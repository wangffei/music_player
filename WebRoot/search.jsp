<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'search.jsp' starting page</title>
    
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
		a{color:black;text-decoration:none;}
		a:hover{color:red;text-decoration:underline;}
		
		#container{
			width:80%;
			margin:0px auto;
		}
		#item{
			width:100%;
			height:80px;
			margin-top:30px;
		}
		#item ul li{
			float:left;
			color:#4a4a4a;
			font-size:16px;
			margin:20px 20px 0px;
			cursor:pointer;
			line-height:24px;
		}
		#item ul li:nth-child(2){
			border-bottom:5px solid black;
		}
		#item ul #result{
			padding:0px;
			font-size:24px;
			color:black;
			font-weight: 500;
			margin-right:50px;
			cursor:initial;
		}
		
		#content{
			width:100%;
		}
		#content table{
			width:90%;
			margin:0px auto;
			border-collapse:separate;
		}
		#loading{
			width:100%;
			height:400px;
			overflow:hidden;
			position:absolute;
			top:100px;
			left:0px;
		}
		#loading div{
			margin:80px auto;
			width:200px;
		}
		
		#page ul{
			width:800px;
			height:50px;
			margin:30px auto;
		}
		#page ul li{
			cursor:pointer;
		}
		#page ul li:hover{
			color:gray;
		}
		#music-zhuanji{
			display:none;
			overflow:auto;
		}
		
		.zhuanji{
			float:left;
			width:192px;
			margin-left:16px;
		}
		.zhuanji li img{
			width:192px;
			height:192px;
		}
		#music-zhuanji ul {
			width:750px;
			margin:15px auto;
		}
		#music-zhuanji .page{
			width:100%;
			float:left;
		}
		#music-zhuanji ul li{
			cursor:pointer;
		}
		#music-zhuanji ul li:hover{
			color:gray;
		}
		#music-zhuanji .singer li img{
			width:200px;
			height:200px;
			border-radius:50%;
		}
		#music-zhuanji .singer{
			width:200px;
			margin-left:16px;
			float:left;
		}
		#music-zhuanji .singer li{
			text-align:center;
		}
	</style>
	<script src="js/jquery.min.js"></script>
	<script>var key = "${key}"</script>
  </head>
  
  <body>
    <div id="container">
    	<div id="item">
    		<ul>
    			<li id="result">搜索结果</li>
    			<li id="music">歌曲</li>
    			<li id="zhuanji">专辑</li>
    		</ul>
    		<p style="margin-top:19px;margin-left:20px;float:left;">关键字:<span style="color:red;">${key}</span></p>
    	</div>
    	<div id="content" style="display:none;">
    		<table border=0 cellpadding="0" cellspacing="0" id="show">
    			<tr id="title" style="line-height:50px;">
    				<th style="width:8%;padding:0px 9px;text-align:left;">#</th>
    				<th style="width:23%;padding:0px 9px;text-align:left;">歌曲</th>
    				<th style="width:23%;padding:0px 9px;text-align:left;">歌手</th>
    				<th style="width:23%;padding:0px 9px;text-align:left;">专辑</th>
    				<th style="width:15%;padding:0px 9px;text-align:left;"></th>
    				<th style="width:8%;padding:0px 9px;text-align:right;">时长</th>
    			</tr>
    		</table>
    		<div id="page">
    			<ul style="text-align:center;"><img style="width:30px;height:30px;" src="img/load.gif"></ul>
    		</div>
    	</div>
    	<div id="music-zhuanji">
    		<div class="content"></div>
    		<div class="page">
    			<ul style="text-align:center;"><img style="width:30px;height:30px;" src="img/load.gif"></ul>
    		</div>
    	</div>
    	<div id="loading">
    		<div><img src="img/load.gif"></div>
    	</div>
    </div>
  </body>
  <script src="js/Base64.js"></script>
  <script src="js/jquery.function.js"></script>
  <script>
  	var flag = [false,true]
  	var pagenow = 1
	var pages = 0
	var page = 0
  	function music(){
  		$.ajax({url:"search.do?method=music&key="+key+"&tp=1&flag=0&pages=1",type:"GET",async:false,
  			success:function(data){
  				$.ajax({url:"search.do?method=page&key="+key+"&tp=1",type:"GET",async:false,
  					success:function(data){
  						if(flag[0]){
  							return;
  						}
  						data = eval("["+data+"]")[0]
  						page = data.page*1
  				//		alert(page)
  						$("#loading").css("display","none")
  						$("#content").css("display","block")
  					},error:function(){/*	alert("网络不给力")*/}
  				})
  				data = eval(data)
  				for(var i=0;i<data.length;i++){
  					var tr = null
  					if(i%2){
  						tr = $("<tr style='background:white;display:table-row;'></tr>")
  					}else{	
  						tr = $("<tr style='background:#f7f7f7;display:table-row;'></tr>")
  					}
  					var td_num = $("<td style='width:8%;padding:0px 9px;text-align:left;'><div style='height:50px;'><span style='line-height:50px;'>"+i+"</span></div></td>")
  					var td_name = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div title='"+data[i].music_name+"'><a onclick='music_click(this)' tp='1' href='javascript:void(0)' src='detail.do?method=music&music_id="+new Base64().encode(data[i].music_id+"")+"'><span>"+(data[i].music_name.length>6 ? data[i].music_name.substring(0,6) : data[i].music_name)+"</span></a></div></td>")
  					var td_singer = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div style='height=50px;'><a href='detail.do?method=singer&singer_id="+new Base64().encode(data[i].singer_id+"")+"'><span>"+data[i].singer_name+"</span></a></div></td>")
  					var td_zhuanji = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div style='height=50px;'><a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'><span>"+data[i].zhuanji_name+"</span></a></div></td>")
  					var td_click = $("<td style='width:15%;'><i style='cursor:pointer;display:block;width:18px;height:18px;float:left;background:url(img/player_icon.png) 72px 221px;'></i><i style='cursor:pointer;display:block;width:18px;height:18px;float:left;background:url(img/player_icon.png) 72px 336px;margin-left:10px;'></i></td>");
  					var td_time = $("<td style='width:8%;padding:0px 9px;text-align:right;'><div style='height=50px;'><span>"+parseInt(data[i].time*1/60)+":"+(data[i].time*1%60)+"</span></div></td>")
  					tr.append(td_num).append(td_name).append(td_singer).append(td_zhuanji).append(td_click).append(td_time)
  					$("#show").append(tr)
  				}
  				if(data.length < 30){
  					if(page*1 == 0){
  						pagenow = 0
  					}
  					click()
  				}
  			},error:function(){
  				//alert("网络不给力")
  			}})
  	}
	function click(){
		pagenow ++
		if(pagenow > page*1){
			$.ajax({url:"search.do?method=music&pages="+(pagenow-page*1)+"&key="+key+"&flag=1",
			type:"GET",
			success:function(data){
				if(flag[0]){
					return;
				}
				data = decodeURI(data)
				//console.log(data)
				//console.log(data)
				data = eval(data)
				for(var i=0;i<data.length;i++){
					var tr = null
					if(i%2){
						tr = $("<tr style='background:white;display:table-row;'></tr>")
					}else{	
						tr = $("<tr style='background:#f7f7f7;display:table-row;'></tr>")
					}
					var index = $("#show tr:last td").eq(0).find("div span").html()*1
					if(!index){
						index = 0
					}
					var td_num = $("<td style='width:8%;padding:0px 9px;text-align:left;'><div style='height:50px;'><span style='line-height:50px;'>"+(++index)+"</span></div></td>")
					var td_name = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div title='"+data[i].music_name+"'><a tp='2' onclick='music_click(this)' href='javascript:void(0)' src='music.yy?method=music&music_url="+data[i].music_url+"&time="+data[i].time+"'><span>"+(data[i].music_name.length>10 ? data[i].music_name.substring(0,10) : data[i].music_name)+"</span></a></div></td>")
					var td_singer = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div style='height=50px;'></div></td>")
					for (var j=0;j<data[i].singer.length;j++){
						var a = $("<a href='music.yy?method=singer&singer_url="+data[i].singer[j].singer_url+"'>"+data[i].singer[j].singer_name+" </a>")
						td_singer.append(a)
					}
					var td_zhuanji = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div style='height=50px;'><a href='music.yy?method=zhuanji&zhuanji_url="+data[i].zhuanji_url+"'><span>"+data[i].zhuanji_name+"</span></a></div></td>")
					var td_click = $("<td style='width:15%;'><i style='cursor:pointer;display:block;width:18px;height:18px;float:left;background:url(img/player_icon.png) 72px 221px;'></i><i style='cursor:pointer;display:block;width:18px;height:18px;float:left;background:url(img/player_icon.png) 72px 336px;margin-left:10px;'></i></td>");
					var td_time = $("<td style='width:8%;padding:0px 9px;text-align:right;'><div style='height=50px;'><span>"+parseInt(data[i].time/60) +":" + data[i].time %60+"</span></div></td>")
					tr.append(td_num).append(td_name).append(td_singer).append(td_zhuanji).append(td_click).append(td_time)
					$("#show").append(tr)
				}
				},error:function(){/*alert("网络异常")*/}
			})
		}else{
			$.ajax({url:"search.do?method=music&pages="+(pagenow)+"&key="+key+"&flag=0",
				type:"GET",
				success:function(data){
					if(flag[0]){
						return;
					}
					data = decodeURI(data)
					data = eval(data)
					for(var i=0;i<data.length;i++){
						var tr = null
						if(i%2){
							tr = $("<tr style='background:white;display:table-row;'></tr>")
						}else{	
							tr = $("<tr style='background:#f7f7f7;display:table-row;'></tr>")
						}
						var index = $("#show tr:last td").eq(0).find("div span").html()*1
						var td_num = $("<td style='width:8%;padding:0px 9px;text-align:left;'><div style='height:50px;'><span style='line-height:50px;'>"+(++index)+"</span></div></td>")
						var td_name = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div title='"+data[i].music_name+"'><a onclick='music_click(this)' tp='1' href='javascript:void(0)' src='detail.do?method=music&music_id="+new Base64().encode(data[i].music_id+"")+"'><span>"+(data[i].music_name.length>6 ? data[i].music_name.substring(0,6) : data[i].music_name)+"</span></a></div></td>")
						var td_singer = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div style='height=50px;'><a href='detail.do?method=singer&singer_id="+new Base64().encode(data[i].singer_id+"")+"'><span>"+data[i].singer_name+"</span></a></div></td>")
						var td_zhuanji = $("<td style='width:23%;padding:0px 9px;text-align:left;'><div style='height=50px;'><a href='detail.do?method=zhuanji&zhuanji_id="+new Base64().encode(data[i].zhuanji_id+"")+"'><span>"+data[i].zhuanji_name+"</span></a></div></td>")
						var td_click = $("<td style='width:15%;'><i style='cursor:pointer;display:block;width:18px;height:18px;float:left;background:url(img/player_icon.png) 72px 221px;'></i><i style='cursor:pointer;display:block;width:18px;height:18px;float:left;background:url(img/player_icon.png) 72px 336px;margin-left:10px;'></i></td>");
						var td_time = $("<td style='width:8%;padding:0px 9px;text-align:right;'><div style='height=50px;'><span>"+parseInt(data[i].time*1/60)+":"+(data[i].time*1%60)+"</span></div></td>")
						tr.append(td_num).append(td_name).append(td_singer).append(td_zhuanji).append(td_click).append(td_time)
						$("#show").append(tr)
					}
				},error:function(){	/*alert("网络异常")*/}
			})
		}
  	}
  	$(function(){
  		music()
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
  <script>
  	$(function(){
  		$("#music").click(function(){
  			pagenow = 1
  			for(var i=0;i<flag.length;i++){
  				flag[i] = true
  			}
  			flag[0] = false
  			$(this).parents("ul").children().each(function(){
  				$(this).css("border","none")
  			})
  			$(this).css("border-bottom","5px solid black")
  			$("#page ul li").each(function(){
  				$(this).remove()
  			})
  			$("#show").find("tr").each(function(){
				if($(this).attr("id") != "title"){
					$(this).remove()
				}
			})
			$("#loading").css("display","block")
  			$("#content").css("display","none")
  			$("#music-zhuanji").css("display","none")
  			music()
  		})
  	})
  	function zhuanji(){
		$.ajax({
   			type:"GET",
   			url:"search.do?method=zhuanji&key="+key+"&page="+(pagenow++),
   			success:function(data){
   				if(flag[1]){
   					return;
   				}
   				if(data == "ERROR"){
   					
   				}else{
   					data = eval(data)
   					for(var i=0;i<data.length;i++){
   						var gedan_name = decodeURI(data[i].gedan_name)
   						var gedan_creater = decodeURI(data[i].gedan_creater)
   						var div = $("<div class='zhuanji'></div>")
   						var a = $("<a href='music.yy?method=gedan&gedan_url="+data[i].gedan_url+"'></a>")
   						var li_img = $("<li><img src='"+data[i].gedan_img+"'></li>")
   						var li_zhuanji_name = $("<li style='color:black;'>"+(gedan_name.length > 10 ? gedan_name.substring(0,10) : gedan_name)+"</li>")
   						var li_singer_name = $("<li style='color:#999;'>"+(gedan_creater.length > 10 ? gedan_creater.substring(0,10) : gedan_creater)+"</li>")
   						a.append(li_img).append(li_zhuanji_name).append(li_singer_name)
   						$("#music-zhuanji .content").append(div.append(a))	
   					}
   				}
   			},error:function(){}
   		})
	}
  	$("#zhuanji").click(function(){
  		pagenow = 1
  		$("#music-zhuanji .content div").each(function(){
  			$(this).remove()
  		})
  		for(var i=0;i<flag.length;i++){
			flag[i] = true
		}
		flag[1] = false
  		$("#content").css("display","none")
  		$("#loading").css("display","block")
  		$(this).parents("ul").children().each(function(){
			$(this).css("border","none")
		})
		$(this).css("border-bottom","5px solid black")
		zhuanji()
		$("#loading").css("display","none")
		$("#music-zhuanji").css("display","block")
  	})
  </script>
  <script>
  window.onscroll = function () {
      //htmlHeight 是网页的总高度
      var htmlHeight = document.body.scrollHeight || document.documentElement.scrollHeight;
      //clientHeight是网页在浏览器中的可视高度，
      var clientHeight = document.body.clientHeight || document.documentElement.clientHeight;
      //scrollTop是浏览器滚动条的top位置，
      var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
      //通过判断滚动条的top位置与可视网页之和与整个网页的高度来返回各项参数
      if (scrollTop + clientHeight + 100 >= htmlHeight) {
          if(!flag[0]){
        	  click()
          }else if(!flag[1]){
        	  zhuanji()
          }
      }
  }
  </script>
</html>
