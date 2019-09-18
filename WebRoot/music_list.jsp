<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'music_list.jsp' starting page</title>
    
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
		body{overflow:hidden;}
		#bk{
			width:100%;
			height:100%;
			position:absolute;
			border:none;
			-webkit-filter: blur(5px);
			filter: blur(15px);
		}
		svg{
			position: fixed;
			top:0px;
			left:0px;
			opacity: 0.3;
		}
		/*右侧布局开始*/
		#player_left{
			float:left;
			margin-left:18px;
		}
		#music_list .row-item{
			color:white;
			font-size:15px;
			height:50px;
		}
		#music_list{
			width:820px;
		}
		#music_list .row-item div{
			border-bottom:1px solid #b4adad;
			float:left;
			padding-right:210px;
			padding-top:18px;
			padding-bottom:11px;
		}
		#music_list .row-item div:first-child{
			padding-left:90px;
		}
		
		#container{
			width:1100px;
			margin:0px auto;
		}
		#box{
			width:100%;
			background:black;
		}
		
		/*右边*/
		#player_right{
			float:left;
		}
		#player_right .singer_img{
			overflow:hidden;width:201px;
			height:185px;
			background:url('img/bk.png');
			margin:20px 0px 0px 30px;
		}
		#player_right .singer_img img{
			width:180px;
			height:180px;
			display:block;
			margin-top:4px;
			border-radius:5px;
		}
		
		/*滚动条*/
		.data{
			float:left;
			overflow:hidden;
		}
		.scroll{
			float:right;
			width:6px;
		}
		.scroll .scroll_bar{
			width:6px;
			background:#b5aaaa;
			border-radius:4px;
			position:relative;
			transition:top 0.6s linear;
		}
		
		/*歌词解析*/
		.lrc_panel{
			overflow:hidden;
			color:white;
		}
		/**滚动条*/
		._data{
			position:relative;
			transition:top 0.6s linear;
		}
		/*列表解析*/
		._data .item div{
			height:45px;
			float:left;
			color:rgba(225,225,225,.8);
			line-height:45px;
			font-size:14px;
			border-bottom:0.3px solid rgba(225,225,225,.8);
		}
		.music_name{
			width:30%;
			overflow:hidden;
		}
		.music_name a{
			color:rgba(225,225,225,.8);
			text-decoration: none;
		}
		.singer_name{
			width:30%;
			overflow:hidden;
		}
		.zhuanji_name{
			width:30%;
			overflow:hidden;
		}
		.index_icon{
			width:5%;
		}
		.delete_music{
			width:5%;
		}
		.delete_music i{
			visibility: hidden;
			width:10px;
			height:10px;
			display:block;
			background:url("img/btn.png") 141px 88px;
			margin-top:15px;
			cursor:pointer;
		}
		.item:hover .delete_music i{
			visibility: visible;
		}
		.item .delete_music .music_do{
			position: relative;
			height:50px;
			top:0px;
			left:-20px;
			border-bottom:0px;
			visibility: hidden;
		}
		.delete_music .music_do p{
			width:50px;
			background:#6d6969ad;
			cursor:pointer;
			line-height:20px;
			text-align:center;
			border-bottom:0.2px solid black;
		}
		.delete_music .music_do p:hover{
			background:black;
			color:white;
		}
		.delete_music i:hover + .music_do{
			visibility: visible;
		}
		.delete_music .music_do:hover{
			visibility: visible;
		}
	</style>
  </head>
  <body>
    <div id="box">
    	<!-- <img id="bk" src="javascript:void(0)"> -->
    	<svg version="1.1" style="width:100%;" width="1366" height="635" preserveAspectRatio="none">
			<filter id="bg">
				<feGaussianBlur in="SourceGraphic" stdDeviation="50"></feGaussianBlur>
			</filter>
			<image id="bk" x="0" y="0" width=1366  height="635" href="" style="filter:url('#bg')" preserveAspectRatio="none" externalResourcesRequired="true"></image>
		</svg> 
    	<div id="container">
		    <div id="player_left">
		    	<div id = "music_list">
		    		<div class="row-item">
		    			<div>歌曲</div>
		    			<div>歌手</div>
		    			<div>专辑</div>
		    		</div>
		    		<div class="data_area">
		    			<div class="data">
		    				<div class="_data"></div>
		    			</div>
		    			<div class="scroll">
					    	<div class="scroll_bar"></div>
					    </div>
		    		</div>
		    	</div>
		    </div>
		    <div id="player_right">
		    	<div class="singer_img">
		    	 	<img style="position:relative" src="javascript:void(0)">
		    	</div>
		    	<div class="lrc_panel">
		    		<ul style="position:relative" class="panel">		
		    		</ul>
		    	</div>
		    </div>
	    </div>
	    <div id="wait" style="width:100%;height:100%;position:absolute;display:none;">
	    	<div style="width:450px;margin:220px auto;background:black;"><i style="margin-left:50px;width:51px;height:51px;background:url(img/uploading.gif);display:block;float:left;transform:scale(0.6);"></i><span style="font-size:25px;color:white;line-height:51px;">正在获取数据请耐心等待</span></div>
	    </div>
    </div>
  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.mousewheel.js"></script>
  <script>
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
    //展示歌词
    function lrc_show(data){
		var arr = [];
		for(var i in data){
			arr.push(i*1)
		}
		arr.sort(function(a , b){
			return a-b;
		})
		
		$(".panel").find("li").each(function(){
			$(this).remove()
		})
		
		for(var i in arr){
			$(".panel").append($("<li id="+Math.round(arr[i])+" style='text-align:center;font-size:14px;line-height:31px;'>"+data[arr[i]]+"</li>"))
		}
    }
  </script>
  <script>
  	//保存音乐列表
  	var music_list = window.parent.music_list
  	var music_index = window.parent.music_index
  	
  	//当前播放歌曲
  	var music_now = music_list[music_index]
  	//当前播放歌曲歌词
  	var lrc = parent.lrc
  	//保存页面高度
  	var scrren_height = $(document).height()
  	
  	$("#music_list").css("height",scrren_height +"px")
  	$("#box").css("height",scrren_height+"px")
  	$(".scroll").css("height",scrren_height - 50 + "px")
  	$(".data").css("width",$(".data_area").width() - 6 + "px")
  	$(".lrc_panel").css("width",$("#container").width() - 840 + "px")
  	$(".lrc_panel").css("height",scrren_height - 205 + "px")
  	$("._data").css("width",$(".data").width() + "px")
  	$(".scroll_bar").css("height",(scrren_height - 50)/(parent.music_count*45.3)*(scrren_height - 50)+"px")
  	//alert($(document).height() - 50)
  	//求解json键值对个数
  	function json_size(d){
  		var l = 0
  		for(var i in d){
  			if(d.hasOwnProperty(i)){
  				l++
  			}
  		}
  		return l
  	}
  	
  	function ajax(url , method , susses , faild , async){
		$.ajax({
			type:method,
			url:url,
			async:async,
			success:susses,
			error:faild
		});
	}
  	/*解析当前播放歌曲*/
  	//歌词解析
  	if(lrc != null){
  		lrc_show(parent.lrc)
  	}
  	//解析歌手图片
  	$("#bk").attr("href",music_now.singer_img)
  	$(".singer_img img").attr("src",music_now.singer_img)
  	//快速对齐歌词
  	function lrc_now(){
  		var tempTime = 0
  		var tempIndex = 0
  		var tempArr = []
  		var currentTime = $("#music_player" , parent.document)[0].currentTime
  		
  		for(var i in lrc){
  			tempArr.push(i)
  		}
  		tempArr.sort(function(a,b){
  			return a - b
  		})
  		for(var i=0 ; i<tempArr.length ; i++){
  			if(tempArr[i] < currentTime){
  				tempTime = tempArr[i]
  				if(i == tempArr.length - 1){
  					tempIndex = i - 5
  				}
  			}else{
  				tempIndex = i-1
  				tempIndex = tempIndex-4 <0 ? 0 : tempIndex - 4
  				break
  			}
  		}
  		for(var i=tempIndex-1;i>=0;i--){
  			$("#"+Math.round(tempArr[i])).remove()
  		}
  		//console.log($("#"+tempTime).html())
  		$("#"+Math.round(tempTime)).css("color","lightgreen")
  	}
  	lrc_now()
  	/*歌词解析结束*/
  	/*解析音乐列表*/
  	var show_index = 1;
  	for(var index in parent.music_list){
  		var temp = show_index
  		music_index = window.parent.music_index
  		if(index == music_index){
  			temp = "<i style='width:10px;height:10px;display:block;background:url(\"img/wave.gif\");margin-top:13px;'></i>"
  		}
  		var div_item = $("<div tp='1' class='item'></div>")
  		var div_index = $("<div index='"+show_index+"' class='index_icon'>"+temp+"</div>")
  		var div_delete = $("<div class='delete_music'><i></i></div>")
  		var div_music = $("<div class='music_name'><a href='javascript:void(0)' index='"+index+"' onclick='music_click(this)'>"+music_list[index].music_name+"</a></div>")
  		var div_singer = $("<div class='singer_name'>"+music_list[index].singer_name+"</div>")
  		var div_zhuanji = $("<div class='zhuanji_name'>"+music_list[index].zhuanji_name+"</div>")
  		var music_do = $("<div class='music_do'><p onclick='delete_music(this)'>删除</p><p onclick='clear_music(this)'>清空</p><p onclick='download_music(this)'>下载</p></div>")
  		div_item.append(div_index).append(div_delete.append(music_do)).append(div_music).append(div_singer).append(div_zhuanji)
  		$("._data").append(div_item)
  		show_index ++
  	}
  	//下载音乐
  	function download_music(obj){
  		$("#wait").css("display","block")
  		var temp_index = $(obj).parents(".item").find(".music_name a").attr("index")*1
  		$.ajax({
  			url:parent.music_list[temp_index].music_url,
  			type:"GET",
  			success:function(data){
  				data = eval(data)[0].data
  				var url = data.play_url
  				var xhr = new XMLHttpRequest();
  		  		xhr.open('GET', url, true);//get请求，请求地址，是否异步
  		  		xhr.responseType = "blob";    // 返回类型blob
  		  		xhr.send()
  		  		xhr.onreadystatechange = function () {// 请求完成处理函数
  		  			if (xhr.readyState == 4 && xhr.status === 200) {
  		  				if(xhr.response != null){
	  		  				var blob = xhr.response;// 获取返回值
		  		  			var a = document.createElement('a');
		  					a.download = $(obj).parents(".item").find(".music_name a").html()+".mp3";
		  					a.href=window.URL.createObjectURL(blob);
		  					a.click();
		  					$("#wait").css("display","none")
  		  				}
  		  			}else if(xhr.readyState == 4 && xhr.status != 200){
  		  				$("#wait").css("display","none")
  		  				parent.music_download(url)
  		  			}
  		  		};
  			},error:function(err){
  				$("#wait").css("display","none")
  			}
  		})
  	}
  	//删除歌曲时
  	function delete_music(obj){
  		//删除列表中元素
  		var temp_index = $(obj).parents(".item").find(".music_name a").attr("index")
  		var index_icon = $(obj).parents(".item").find(".index_icon").attr("index")
  		delete parent.music_list[temp_index]
  		//歌曲数目减一
  		parent.music_count --
  		$(obj).parents(".item").remove()
  		$(".index_icon").each(function(){
  			if($(this).attr("index")*1 > index_icon){
  				if($(this).parents(".item").find(".music_name a").attr("index")*1 == parent.music_index*1){
  	  				$(this).attr("index",$(this).attr("index")*1 - 1)
  	  			}else{
  	  				$(this).attr("index",$(this).attr("index")*1 - 1)
  	  				$(this).html($(this).attr("index"))
  	  			}
  			}
  		})
		if($(obj).parents(".item").find(".music_name a").attr("index")*1 == parent.music_index){
  			parent.music_next()
  		}
  	}
  	//清空列表时
  	function clear_music(obj){
  		parent.music_list = {}
  		parent.music_index = 0
  		parent.music_count = 0
  		$(".item").each(function(){
  			$(this).remove()
  		})
  	}
  	//点击歌曲时
  	function music_click(obj){
  		$("#music_player",parent.document)[0].pause()
		music_index = window.parent.music_index
		var temp = $(obj).attr("index")
  		music_now = parent.music_list[temp]
  		ajax(music_now.music_url , "GET" , function(data){
  			data = eval(data)[0].data
	  		$(".panel li").each(function(){
	  			$(this).remove()
	  		})
  			lrc = lrc_decode(data.lyrics)
  			if(lrc != null){
  				lrc_show(lrc)
  			}
  			$("#bk").attr("href",music_now.singer_img)
  			$(".singer_img img").attr("src",music_now.singer_img)
  			$("#singer_pic",parent.document).attr("src",music_now.singer_img)
  			parent.lrc = lrc
  			data.play_url = data.play_url;//.replace(/m7c.music./g, "m7.music.").replace(/m8c.music./g, "m8.music.")
  			$("#music_player" , parent.document ).attr("src",data.play_url)
  			$("#music_player" , parent.document )[0].play()
  		} , function(){} , true)
  		$(".index_icon i").each(function(){
  			var t = $(this).parents(".index_icon")
  			$(this).remove()
  			t.html(t.attr("index"))	
  		})
  		music_index = temp
  		var html = $(obj).parents(".item").find(".index_icon").html()
  		$(obj).parents(".item").find(".index_icon").html($("<i style='width:10px;height:10px;display:block;background:url(\"img/wave.gif\");margin-top:13px;'></i>").attr("index",music_index))
  		parent.music_index = html*1
  		$("#music_player",parent.document).attr("time",music_now.time/1000)
  		//$("#music_play",parent.document).css("background","url(img/icon.jpg) 205px 227px").attr("value","0");
	}
  	$(function(){
  		var scroll_index = 0
  		var scroll_size = 45.3 * 4
  		//滚动条样式
  	  	$(".data").mousewheel(function(event , delta){
  			var dir = delta > 0 ? 'Up' : 'Down';
  			//刷新滚动条长度
  	  		$(".scroll_bar").css("height",(scrren_height - 50)/(parent.music_count*45.3)*(scrren_height - 50)+"px")
  			var height_release = parent.music_count*45.3 - (scrren_height - 50)
  	  		if(height_release < 45.3){
  				$(".scroll_bar").css("visibility","hidden")
  			}
  			if(dir == "Up"){
  				if(scroll_index+1 == 0){
  					scroll_index ++
  					$("._data").css("top" , 0) 
  	  				$(".scroll_bar").css("top" , 0)
  					return
  				}else if(scroll_index != 0){
	  				$("._data").css("top" , (++scroll_index)*scroll_size) 
	  				$(".scroll_bar").css("top" , -scroll_index*scroll_size / height_release*(scrren_height - $(".scroll_bar").height() - 60))
  				}
  			}else if(dir == "Down"){
  				if(-((scroll_index-1) * scroll_size) > height_release && -((scroll_index-1) * scroll_size) < height_release+scroll_size){
  					scroll_index --
  					$("._data").css("top" , -height_release) 
  	  				$(".scroll_bar").css("top" , height_release/(parent.music_count*45.3)*(scrren_height-50))
  					return
  				}else if(-((scroll_index) * scroll_size) < height_release){
	  				$("._data").css("top" , (--scroll_index)*scroll_size) 
	  				$(".scroll_bar").css("top" , -scroll_index*scroll_size / height_release*(scrren_height - $(".scroll_bar").height() - 60))
  				}
  			}
  		})
  	})
  </script>
</html>
