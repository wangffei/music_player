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
    
    <title>My JSP 'music_singer.jsp' starting page</title>
    
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
		a{text-decoration: none;color:black;}
		
		/*左边*/
		#left{
			width:250px;
			float:left;
			overflow:hidden;
		}
		#left .left-container{
			width:230px;
			height:400px;
			background:#4eff0073;
			margin:50px auto;
			border-radius:10px;
			overflow:auto;
		}
		#left .left-container div{
			width:200px;
			height:300px;
			margin:50px auto;
		}
		#left .left-container div li{
			width:30px;
			height:30px;
			font-size:18px;
			background:yellow;
			float:left;
			text-align:center;
			line-height:30px;
			cursor:pointer;
			margin-left:27px;
			margin-top:27px;
			border-radius:50%;
		}
		#left .left-container div li:hover{
			background:red;
			color:white;
		}
		
		/*右边*/
		#right{
			width:800px;
			float:left;
		}
		#right .right-container{
			width:800px;
			height:450px;
			margin-top:30px;
			background:#d0fcf9;
			border-radius:10px;
		}
		#right .right-container .singer_show{
			width:120px;
			height:150px;
			float:left;
			margin:42px 0px 0px 30px;
		}
		#right .right-container .singer_show:hover p{
			color:red;
		}
		#right .right-container .singer_show p img{
			width:120px;
			height:120px;
			border-radius:50%;
		}
		#right .right-container .singer_show p{
			text-align:center;
			font-size:12px;
			line-height:18px;
		}
	</style>
  </head>
  <script>
  	var singer_data = <%=MoreDao.getSinger_info()%>;
  </script>
  <script>
  	var pages = <%=MoreDao.getPageCount()%>
  </script>
  <body>
    <div id="left">
    	<div class="left-container">
    		<div></div>
    	</div>
    </div>
    <div id="right">
    	<div class="right-container"></div>
    </div>
  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.function.js"></script>
  <script src="js/Base64.js"></script>
  <script>
  	//处理分页
  	$(function(){
  		for(var i=0;i<pages;i++){
  			if(i==0){
  				$("#left .left-container div").append("<li items='action'>"+(i+1)+"</li>")
  			}else{
  				$("#left .left-container div").append("<li items='none'>"+(i+1)+"</li>")
  			}
  		}
  		$(".left-container div li").each(function(){
  			if($(this).attr("items") == "action"){
  				$(this).css({"background":"red","color":"white"})
  			}
  		})
  	})
  	//处理分页ajax
  	$(function(){
  		$(".left-container div li").each(function(){
  			$(this).click(function(){
  				if($(this).attr("items") == "action"){
  					return;
  				}else{
  					_this = $(this)
  					ajax("page.do?method=singer&page="+$(this).html() , function(data){
  						if(data == "ERROR"){
  							alert("请求失败 ， 请不要随意串改url")
  						}else{
  							data = eval(data)
  							//改变左边导航栏试图
  							$(".left-container div li").each(function(){
  								$(this).attr("items","none")
  								$(this).css({"background":"yellow","color":"black"})
  							})
  							_this.attr("items","action")
  							_this.css({"background":"red","color":"white"})
  							//清空原本内容
  							$("#right .right-container .singer_show").each(function(){
  								$(this).remove()
  							})
  							//添加新的分页
  							for(var i=0;i<data.length;i++){
  					  			var a=$("<a href='detail.do?method=singer&singer_id="+new Base64().encode(data[i].singer_id+"")+"'></a>")
  					  				.append($("<p><img src='"+data[i].singer_img+"'></p>"))
  					  				.append($("<p>"+data[i].singer_name+"</p>"))
  					  				.append($("<p>"+data[i].singer_borndate+"</p>"))
  					  			var div = $("<div class='singer_show'></div>").append(a)
  					  			$("#right .right-container").append(div)
  					  		}
  						}
  					},function(){
  						console.log("加载失败")
  					})
  				}
  			})
  		})
  	})
  	//展示歌手信息
  	$(function(){
  		for(var i=0;i<singer_data.length;i++){
  			var a=$("<a href='detail.do?method=singer&singer_id="+new Base64().encode(singer_data[i].singer_id+"")+"'></a>")
  				.append($("<p><img src='"+singer_data[i].singer_img+"'></p>"))
  				.append($("<p>"+singer_data[i].singer_name+"</p>"))
  				.append($("<p>"+singer_data[i].singer_borndate+"</p>"))
  			var div = $("<div class='singer_show'></div>").append(a)
  			$("#right .right-container").append(div)
  		}
  	})
  </script>
</html>
