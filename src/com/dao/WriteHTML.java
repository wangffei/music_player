package com.dao;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

//用于生成html页面的dao
public class WriteHTML {
	private static String rt = "\r\n";
	//歌手信息的静态页面
	public static boolean writeToFile_singer(String data , String fileName){
		data = data.replaceAll("//" , "\\\\/\\\\/");
		String html = 
				"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"+ rt +
				"<html>"+ rt +
				"  <head>"+ rt +
				"    "+ rt +
				"   <title>歌手信息</title>"+ rt +
				"    "+ rt +
				"	<meta http-equiv=\"pragma\" content=\"no-cache\">"+ rt +
				"	<meta http-equiv=\"cache-control\" content=\"no-cache\">"+ rt +
				"	<meta http-equiv=\"expires\" content=\"0\">    "+ rt +
				"	<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">"+ rt +
				"	<meta http-equiv=\"description\" content=\"This is my page\">"+ rt +
				"	<meta charset='gbk'>"+ rt +
				"	<!--"+ rt +
				"	<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">"+ rt +
				"	-->"+ rt +
				"	<style>"+ rt +
				"		*{margin:0px;padding:0px;}"+ rt +
				"		li{list-style:none;}"+ rt +
				"		a{color:black;}"+ rt +
				"		#content{"+ rt +
				"			width:100%;"+ rt +
				"			background:#e5e5e5;	"+ rt +
				"			overflow:hidden;"+ rt +
				"		}"+ rt +
				"		#container{"+ rt +
				"			overflow:hidden;"+ rt +
				"           width:82%;"+ rt +
				"           margin:0px auto;"+ rt +
				"		}"+ rt +
				"		#loading div{"+ rt +
				"			width:200px;"+ rt +
				"			margin:150px auto;"+ rt +
				"		}"+ rt +
				"		#content{"+ rt +
				"			display:block;"+ rt +
				"		}"+ rt +
				"		#left{"+ rt +
				"			width:300px;"+ rt +
				"			height:400px;"+ rt +
				"			margin-top:50px;"+ rt +
				"			margin-left:30px;"+ rt +
				"			/*background:red;*/"+ rt +
				"			border-radius:10px;"+ rt +
				"			overflow:hidden;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#left .left-pic{"+ rt +
				"			width:140px;"+ rt +
				"			height:140px;"+ rt +
				"			float:left;"+ rt +
				"			border-radius:10px;"+ rt +
				"			overflow:hidden;"+ rt +
				"		}"+ rt +
				"		#left .left-pic img{"+ rt +
				"			width:140px;"+ rt +
				"			height:140px;"+ rt +
				"		}"+ rt +
				"		#left .left-info{"+ rt +
				"			float:left;"+ rt +
				"			width:150px;"+ rt +
				"			height:140px;"+ rt +
				"			border-radius:10px;"+ rt +
				"			margin-left:10px;"+ rt +
				"		}"+ rt +
				"		#left .left-info li{"+ rt +
				"			font-size:15px;"+ rt +
				"			margin-top:13px;"+ rt +
				"		}"+ rt +
				"		#left .desc{"+ rt +
				"			width:300px;"+ rt +
				"			height:372px;"+ rt +
				"		}"+ rt +
				"		#left .desc img{"+ rt +
				"			width:160px;"+ rt +
				"			height:160px;"+ rt +
				"			margin-top:55px;"+ rt +
				"		}"+ rt +
				"		#left p{"+ rt +
				"			color:red;"+ rt +
				"			margin-top:10px;"+ rt +
				"		}"+ rt +
				"		#right{"+ rt +
				"			width:750px;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:right;"+ rt +
				"		}"+ rt +
				"		#right .left{"+ rt +
				"			width:50px;"+ rt +
				"			height:100%;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#right .left span{"+ rt +
				"			width:30px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			background:#bec7be;"+ rt +
				"			display:block;"+ rt +
				"			margin:245px auto 0px;"+ rt +
				"			border-radius:50%;"+ rt +
				"			text-align:center;"+ rt +
				"			font-size:20px;"+ rt +
				"		}"+ rt +
				"		#right .left:hover{"+ rt +
				"			background:#cdcaca;"+ rt +
				"			cursor:pointer;"+ rt +
				"		}"+ rt +
				"		#right .right{"+ rt +
				"			width:50px;"+ rt +
				"			height:100%;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#right .right:hover{"+ rt +
				"			background:#cdcaca;"+ rt +
				"			cursor:pointer;"+ rt +
				"		}"+ rt +
				"		#right .right span{"+ rt +
				"			width:30px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			background:#bec7be;"+ rt +
				"			display:block;"+ rt +
				"			margin:245px auto 0px;"+ rt +
				"			border-radius:50%;"+ rt +
				"			text-align:center;"+ rt +
				"			font-size:20px;"+ rt +
				"		}"+ rt +
				"		#right .center{"+ rt +
				"			width:650px;"+ rt +
				"			height:100%;"+ rt +
				"			float:left;"+ rt +
				"			position:relative;"+ rt +
				"			overflow:hidden;"+ rt +
				"			font-size:12px;"+ rt +
				"		}"+ rt +
				"		.center .content{"+ rt +
				"			width:510px;"+ rt +
				"			height:430px;"+ rt +
				"			margin:50px auto 0px; "+ rt +
				"			overflow:hidden;"+ rt +
				"			padding:0px 100px;"+ rt +
				"		}"+ rt +
				"		.center .content ul li{"+ rt +
				"			width:170px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		.center .content h3{"+ rt +
				"			font-size:20px;"+ rt +
				"		}"+ rt +
				"		.center .content ul li:hover a{"+ rt +
				"			color:red;"+ rt +
				"		}"+ rt +
				"		#zhuanji ul li{"+ rt +
				"			float:left;"+ rt +
				"			width:246px;"+ rt +
				"			height:60px;"+ rt +
				"			margin-top:30px;"+ rt +
				"		}"+ rt +
				"		#zhuanji ul li a img{"+ rt +
				"			width:60px;"+ rt +
				"			height:60px;"+ rt +
				"			display:block;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#zhuanji ul li a p{"+ rt +
				"			float:left;"+ rt +
				"			width:186px;"+ rt +
				"		}"+ rt +
				"		#zhuanji{"+ rt +
				"			position:absolute;"+ rt +
				"			top:0px;"+ rt +
				"			left:0px;"+ rt +
				"			overflow:auto;"+ rt +
				"		}"+ rt +
				"		#music{"+ rt +
				"			position:absolute;"+ rt +
				"			left:650px;"+ rt +
				"			top:0px;"+ rt +
				"		}"+ rt +
				"	</style>"+ rt +
				"  </head>"+ rt +
				"  <script>var data = \""+data+"\" ;</script>"+ rt +
				"  <body>"+ rt +
				"    <div id=\"container\">"+ rt +
				"    	<div id=\"content\">"+ rt +
				"    		<div id=\"left\">"+ rt +
				"	    		<div class=\"left-pic\">"+ rt +
				"	    			<img src=\"../img/logo.png\">"+ rt +
				"	    		</div>"+ rt +
				"	    		<ul class=\"left-info\"></ul>"+ rt +
				"	    		<div class=\"desc\">"+ rt +
				"	    		</div>"+ rt +
				"	    		<p>详情扫码</p>"+ rt +
				"	    	</div>"+ rt +
				"    		<div id=\"right\">"+ rt +
				"    			<div class=\"left\"><span><</span></div>"+ rt +
				"	    			<div class=\"center\">"+ rt +
				"	    				<div style=\"position:absolute;left:0px;top:0px;\" index=\"1\" class=\"content\">"+ rt +
				"	    					<ul class=\"title\">"+ rt +
				"		    					<li>歌名</li>"+ rt +
				"		    					<li>专辑</li>"+ rt +
				"		    					<li>操作</li>"+ rt +
				"		    				</ul>"+ rt +
				"	    				</div>"+ rt +
				"	    			</div>"+ rt +
				"	    		<div class=\"right\"><span>></span></div>"+ rt +
				"	    	</div>"+ rt +
				"    	</div>"+ rt +
				"    </div>"+ rt +
				"  </body>"+ rt +
				"  <script src=\"../js/jquery.min.js\"></script>"+ rt +
				"  <script src=\"../js/jquery.function.js\"></script>" + rt + 
				"  <script>"+ rt +
				"  	var page = 0"+ rt +
				"  	$(function(){"+ rt +
				"		//$(\"#content\").css(\"display\",\"block\")"+ rt +
				"		$(\".desc\").append($(\"<img src='../code.do?method=qrcode&useimg=true&data=https://www.baidu.com/s?wd=无数据&pic_url=img/logo.png'>\"))"+ rt +
				"		//专辑展示"+ rt +
				"  		data = decodeURI(data)"+ rt +
				"  		data = eval(data)"+ rt +
				"  		page = data.length % 10 == 0 ? data.length / 10 : data.length / 10 + 1"+ rt +
				"  		for (var i=0;i<data.length;i++){"+ rt +
				"  			if(i != 0 && i % 10 == 0){"+ rt +
				"  				var index = i/10 +1"+ rt +
				"  				$(\".center\").append($(\"<div index='\"+index+\"' style='position:absolute;left:650px;top:0px;' class='content'></div>\"))"+ rt +
				"  				$(\".center .content:last\").append($(\"<ul class='title'><li>歌名</li><li>歌手</li><li>操作</li></ul>\"))"+ rt +
				"  			}"+ rt +
				"  			var ul = $(\"<ul></ul>\")"+ rt +
				"  			var music_name = $(\"<li></li>\")"+ rt +
				"  				.append($(\"<a href='javascript:void(0)' onclick='music_click(this)' src='../music.yy?method=music&music_url=\"+data[i].music_url+\"'>\"+(data[i].music_name.length > 8 ? data[i].music_name.substring(0,8) : data[i].music_name)+\"</a>\"))"+ rt +
				"  			"+ rt +
				"  			var zhuanji_name = $(\"<li></li>\")"+ rt +
				"  				.append($(\"<a href='../music.yy?method=zhuanji&zhuanji_url=\"+data[i].zhuanji_url+\"'>\"+(data[i].zhuanji_name.length > 8 ? data[i].zhuanji_name.substring(0,8) : data[i].zhuanji_name)+\"</a>\"));"+ rt +
				"  			"+ rt +
				"  			var i_icon = $(\"<i style='transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url(\\\"../img/player_icon.png\\\") 0px 221px'></i>\" +"+ rt +
				"  		  	  		\"<i style='transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url(\\\"../img/player_icon.png\\\") 0px 336px'></i>\" +"+ rt +
				"  		  	  		\"<i style='transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url(\\\"../img/player_icon.png\\\") 0px 203px'></i>\" +"+ rt +
				"  		  	  		\"<i style='transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url(\\\"../img/player_icon.png\\\") 0px 317px'></i>\")"+ rt +
				"  			"+ rt +
				"  			var icon = $(\"<li></li>\").append(i_icon)"+ rt +
				"  			"+ rt +
				"  			ul.append(music_name).append(zhuanji_name).append(icon)"+ rt +
				"  			"+ rt +
				"  			$(\".center .content:last\").append(ul)"+ rt +
				"  		}"+ rt +
				"  	})"+ rt +
				"   //音乐点击事件 " + rt +
				"  	function music_click(obj){ " + rt +
				"  		$.ajax({" + rt +
				"  			url:$(obj).attr(\"src\")," + rt +
				"  			type:\"GET\"," + rt +
				"  			success:function(data){" + rt +
				"  				data = eval(data)[0].data" + rt +
				"  				var m = new music_my($(obj).attr(\"src\"))" + rt +
				"  				m.add_music(data)" + rt +
				"  			}" + rt +
				"  		})" + rt +
				"  	}" +rt +
				"  	//换页效果"+ rt +
				"  	$(function(){"+ rt +
				"  		var flag = false;"+ rt +
				"  		//当前标签"+ rt +
				"  		var ele = null"+ rt +
				"  		//记录当前页数"+ rt +
				"  		var index = 1"+ rt +
				"  		//下一页"+ rt +
				"  		function movenext(){"+ rt +
				"  			var now = ele"+ rt +
				"  			var next = now.next()"+ rt +
				"  			flag = true"+ rt +
				"  			"+ rt +
				"  			now.css(\"left\",now.css(\"left\").replace(\"px\",\"\")*1 - 10 + \"px\")"+ rt +
				"  			next.css(\"left\",next.css(\"left\").replace(\"px\",\"\")*1 - 10 + \"px\")"+ rt +
				"  			"+ rt +
				"  			if(now.css(\"left\").replace(\"px\",\"\")*1 != -650){"+ rt +
				"  				window.setTimeout(movenext, 10);"+ rt +
				"  			}else{"+ rt +
				"  				flag = false"+ rt +
				"  				index ++"+ rt +
				"  			}"+ rt +
				"  		}"+ rt +
				"  		function movelast(){"+ rt +
				"  			var now = ele"+ rt +
				"  			var next = now.next()"+ rt +
				"  			flag = true"+ rt +
				"  			"+ rt +
				"  			now.css(\"left\",now.css(\"left\").replace(\"px\",\"\")*1 + 10 + \"px\")"+ rt +
				"  			next.css(\"left\",next.css(\"left\").replace(\"px\",\"\")*1 + 10 + \"px\")"+ rt +
				"  			"+ rt +
				"  			if(now.css(\"left\").replace(\"px\",\"\")*1 != 0){"+ rt +
				"  				window.setTimeout(movelast, 10);"+ rt +
				"  			}else{"+ rt +
				"  				flag = false"+ rt +
				"  				index --"+ rt +
				"  			}"+ rt +
				"  		}"+ rt +
				"  		$(\"#right .right\").click(function(){"+ rt +
				"  		//	alert(index)"+ rt +
				"  			if(!flag){"+ rt +
				"  				$(this).parents(\"#right\").find(\".content\").each(function(){"+ rt +
				"  					if($(this).attr(\"index\")*1 == index){"+ rt +
				"  					//	alert($(this).attr(\"index\"))"+ rt +
				"  						if(index +1 > page || index < 0){"+ rt +
				"  							return;"+ rt +
				"  						}"+ rt +
				"  						ele = $(this)"+ rt +
				"  						if(ele.next().length){"+ rt +
				"  							window.setTimeout(movenext, 10)"+ rt +
				"  						//	index ++"+ rt +
				"  						}"+ rt +
				"  					}"+ rt +
				"  				})"+ rt +
				"  			}"+ rt +
				"  		})"+ rt +
				"  		$(\"#right .left\").click(function(){"+ rt +
				"  		//	alert(index)"+ rt +
				"  			if(!flag){"+ rt +
				"  				$(this).parents(\"#right\").find(\".content\").each(function(){"+ rt +
				"  					if($(this).attr(\"index\")*1 == (index-1)){"+ rt +
				"  						if(index - 1 > page || index < 0){"+ rt +
				"  							return;"+ rt +
				"  						}"+ rt +
				"  						ele = $(this)"+ rt +
				"  						window.setTimeout(movelast, 10)"+ rt +
				"  					//	index -- "+ rt +
				"  					}"+ rt +
				"  				})"+ rt +
				"  			}"+ rt +
				"  		})"+ rt +
				"  	})"+ rt +
				"  </script>"+ rt +
				"</html>" ;
		BufferedWriter writer = null ; 
		try {
			writer = new BufferedWriter(new FileWriter(fileName));
			writer.write(html);
			return true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				writer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	//写专辑的静态页面
	public static boolean writeToFile_zhuanji(String data , String fileName){
		data = data.replaceAll("//" , "\\\\/\\\\/");
		String html = 
				"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"+ rt +
				"<html>"+ rt +
				"  <head>"+ rt +
				"    "+ rt +
				"    <title>专辑详情</title>"+ rt +
				"    "+ rt +
				"	<meta http-equiv=\"pragma\" content=\"no-cache\">"+ rt +
				"	<meta http-equiv=\"cache-control\" content=\"no-cache\">"+ rt +
				"	<meta http-equiv=\"expires\" content=\"0\">    "+ rt +
				"	<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">"+ rt +
				"	<meta http-equiv=\"description\" content=\"This is my page\">"+ rt +
				"   <meta charset=\"gbk\">" + rt +
				"	<!--"+ rt +
				"	<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">"+ rt +
				"	-->"+ rt +
				"	<script>var data='"+data+"';</script>"+ rt +
				"	<style>"+ rt +
				"		*{margin:0px;padding:0px;font-size:12px;}"+ rt +
				"		a{color:black;}"+ rt +
				"		li{list-style:none;}"+ rt +
				"		"+ rt +
				"		/*容器样式*/"+ rt +
				"		#container{"+ rt +
				"			width:82%;"+ rt +
				"			background:#e5e5e5;	"+ rt +
				"			overflow:hidden;"+ rt +
				"           margin:0px auto;"+ rt +
				"		}"+ rt +
				"		/*左侧专辑信息显示*/"+ rt +
				"		#left{"+ rt +
				"			width:300px;"+ rt +
				"			height:400px;"+ rt +
				"			margin-top:50px;"+ rt +
				"			margin-left:30px;"+ rt +
				"			/*background:red;*/"+ rt +
				"			border-radius:10px;"+ rt +
				"			overflow:hidden;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#left .left-pic{"+ rt +
				"			width:140px;"+ rt +
				"			height:140px;"+ rt +
				"			float:left;"+ rt +
				"			border-radius:10px;"+ rt +
				"			overflow:hidden;"+ rt +
				"		}"+ rt +
				"		#left .left-pic img{"+ rt +
				"			width:140px;"+ rt +
				"			height:140px;"+ rt +
				"		}"+ rt +
				"		#left .left-info{"+ rt +
				"			float:left;"+ rt +
				"			width:150px;"+ rt +
				"			height:140px;"+ rt +
				"			border-radius:10px;"+ rt +
				"			margin-left:10px;"+ rt +
				"		}"+ rt +
				"		#left .left-info li{"+ rt +
				"			font-size:15px;"+ rt +
				"			margin-top:13px;"+ rt +
				"		}"+ rt +
				"		#left .desc{"+ rt +
				"			width:300px;"+ rt +
				"			height:372px;"+ rt +
				"		}"+ rt +
				"		#left .desc img{"+ rt +
				"			width:160px;"+ rt +
				"			height:160px;"+ rt +
				"			margin-top:55px;"+ rt +
				"		}"+ rt +
				"		#left p{"+ rt +
				"			color:red;"+ rt +
				"			margin-top:10px;"+ rt +
				"		}"+ rt +
				"		/*right*/"+ rt +
				"		#right{"+ rt +
				"			width:750px;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:right;"+ rt +
				"		}"+ rt +
				"		#right .left{"+ rt +
				"			width:50px;"+ rt +
				"			height:100%;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#right .left span{"+ rt +
				"			width:30px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			background:#bec7be;"+ rt +
				"			display:block;"+ rt +
				"			margin:245px auto 0px;"+ rt +
				"			border-radius:50%;"+ rt +
				"			text-align:center;"+ rt +
				"			font-size:20px;"+ rt +
				"		}"+ rt +
				"		#right .left:hover{"+ rt +
				"			background:#cdcaca;"+ rt +
				"			cursor:pointer;"+ rt +
				"		}"+ rt +
				"		#right .right{"+ rt +
				"			width:50px;"+ rt +
				"			height:100%;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#right .right:hover{"+ rt +
				"			background:#cdcaca;"+ rt +
				"			cursor:pointer;"+ rt +
				"		}"+ rt +
				"		#right .right span{"+ rt +
				"			width:30px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			background:#bec7be;"+ rt +
				"			display:block;"+ rt +
				"			margin:245px auto 0px;"+ rt +
				"			border-radius:50%;"+ rt +
				"			text-align:center;"+ rt +
				"			font-size:20px;"+ rt +
				"		}"+ rt +
				"		#right .center{"+ rt +
				"			width:650px;"+ rt +
				"			height:100%;"+ rt +
				"			float:left;"+ rt +
				"			overflow:hidden;"+ rt +
				"			position:relative;"+ rt +
				"		}"+ rt +
				"		.center .content{"+ rt +
				"			width:510px;"+ rt +
				"			height:430px;"+ rt +
				"			margin:50px 100px 0px; "+ rt +
				"		}"+ rt +
				"		.center .content ul li{"+ rt +
				"			width:170px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		.center .content ul li:hover a{"+ rt +
				"			color:red;"+ rt +
				"		}"+ rt +
				"		"+ rt +
				"		#container{"+ rt +
				"			display:block;"+ rt +
				"		}"+ rt +
				"		#loading div{"+ rt +
				"			width:200px;"+ rt +
				"			height:200px;"+ rt +
				"			margin:150px auto;"+ rt +
				"		}"+ rt +
				"	</style>"+ rt +
				"  </head>"+ rt +
				"  "+ rt +
				"  <body>"+ rt +
				"  <div>"+ rt +
				"    <div id=\"container\">"+ rt +
				"    	<div id=\"left\">"+ rt +
				"    		<div class=\"left-pic\">"+ rt +
				"    			<img src=\"../img/logo.png\">"+ rt +
				"    		</div>"+ rt +
				"    		<ul class=\"left-info\">"+ rt +
				"    		</ul>"+ rt +
				"    		<div class=\"desc\">"+ rt +
				"    		</div>"+ rt +
				"    		<p>详情扫码</p>"+ rt +
				"    	</div>"+ rt +
				"    	<div id=\"right\">"+ rt +
				"    		<div class=\"left\"><span><</span></div>"+ rt +
				"    		<div class=\"center\">"+ rt +
				"    			<div class=\"content\" index = \"1\" style=\"position:absolute;left:0px;top:0px;\">"+ rt +
				"    				<ul class=\"title\">"+ rt +
				"	    				<li>歌名</li>"+ rt +
				"	    				<li>歌手</li>"+ rt +
				"	    				<li>操作</li>"+ rt +
				"	    			</ul>"+ rt +
				"    			</div>"+ rt +
				"    		</div>"+ rt +
				"    		<div class=\"right\"><span>></span></div>"+ rt +
				"    	</div>"+ rt +
				"    </div>"+ rt +
				"  </div>"+ rt +
				"  </body>"+ rt +
				"  <script src=\"../js/jquery.min.js\"></script>"+ rt +
				"  <script src=\"../js/jquery.function.js\"></script>" + rt +
				"  <script>"+ rt +
				" 	var page = 1"+ rt +
				"  	$(function(){"+ rt +
				"  		data = eval(decodeURI(data))"+ rt +
				"  		$(\".desc\").append($(\"<img src='../code.do?method=qrcode&useimg=true&data=https://www.baidu.com/s?wd=暂无数据&pic_url=img/logo.png'>\"))"+ rt +
				"  		for (var i=0;i<data.length;i++){"+ rt +
				"  		  	if(i != 0 && i % 10 == 0){"+ rt +
				"  		  		$(\".center\").append($(\"<div  style='position:absolute;left:650px;top:0px;' class='content' index = '\"+(i/10+1)+\"'><ul class='title'><li>歌名</li><li>歌手</li><li>操作</li></ul></div>\"))"+ rt +
				"  		  		page ++ "+ rt +
				"  		  	}"+ rt +
				"  		  	var music_name = $(\"<li></li>\")"+ rt +
				"  		  		.append($(\"<a href='javascript:void(0)' onclick='music_click(this)' src='../music.yy?method=music&music_url=\"+data[i].music_url+\"'>\"+data[i].music_name+\"</a>\"))"+ rt +
				"  		  	"+ rt +
				"  		  	var singer_name = $(\"<li></li>\")"+ rt +
				"  		  		.append($(\"<a href='javascript:void(0)'>\"+data[i].singer_name+\"</a>\"));"+ rt +
				"  		  	"+ rt +
				"  		  	var i_icon = $(\"<i style=\\\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('../img/player_icon.png') 0px 221px\\\"></i>\""+ rt +
				"  		  		  	  +\"<i style=\\\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('../img/player_icon.png') 0px 336px\\\"></i>\"+"+ rt +
				"  		  		  	  \"<i style=\\\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('../img/player_icon.png') 0px 203px\\\"></i>\"+"+ rt +
				"  		  		  	 \"<i style=\\\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('../img/player_icon.png') 0px 317px\\\"></i>\")"+ rt +
				"  		  	"+ rt +
				"  		  	var icon = $(\"<li></li>\").append(i_icon)"+ rt +
				"  		  	"+ rt +
				"  		  	$(\"#right .center .content:last\").append($(\"<ul></ul>\").append(music_name).append(singer_name).append(icon))"+ rt +
				"  		 }"+ rt +
				"  		 dopage()"+ rt +
				"  	})"+ rt +
				"   //音乐点击事件 " + rt +
				"  	function music_click(obj){ " + rt +
				"  		$.ajax({" + rt +
				"  			url:$(obj).attr(\"src\")," + rt +
				"  			type:\"GET\"," + rt +
				"  			success:function(data){" + rt +
				"  				data = eval(data)[0].data" + rt +
				"  				var m = new music_my($(obj).attr(\"src\"))" + rt +
				"  				m.add_music(data)" + rt +
				"  			}" + rt +
				"  		})" + rt +
				"  	}" +rt +
				"  	function dopage(){"+ rt +
				"  	//换页效果"+ rt +
				"  	  	$(function(){"+ rt +
				"  	  		var flag = false;"+ rt +
				"  	  		//当前标签"+ rt +
				"  	  		var ele = null"+ rt +
				"  	  		//记录当前页数"+ rt +
				"  	  		var index = 1"+ rt +
				"  	  		//下一页"+ rt +
				"  	  		function movenext(){"+ rt +
				"  	  			var now = ele"+ rt +
				"  	  			var next = now.next()"+ rt +
				"  	  			flag = true"+ rt +
				"  	  			"+ rt +
				"  	  			now.css(\"left\",now.css(\"left\").replace(\"px\",\"\")*1 - 10 + \"px\")"+ rt +
				"  	  			next.css(\"left\",next.css(\"left\").replace(\"px\",\"\")*1 - 10 + \"px\")"+ rt +
				"  	  			"+ rt +
				"  	  			if(now.css(\"left\").replace(\"px\",\"\")*1 != -650){"+ rt +
				"  	  				window.setTimeout(movenext, 10);"+ rt +
				"  	  			}else{"+ rt +
				"  	  				flag = false"+ rt +
				"  	  				index ++"+ rt +
				"  	  			}"+ rt +
				"  	  		}"+ rt +
				"  	  		function movelast(){"+ rt +
				"  	  			var now = ele"+ rt +
				"  	  			var next = now.next()"+ rt +
				"  	  			flag = true"+ rt +
				"  	  			"+ rt +
				"  	  			now.css(\"left\",now.css(\"left\").replace(\"px\",\"\")*1 + 10 + \"px\")"+ rt +
				"  	  			next.css(\"left\",next.css(\"left\").replace(\"px\",\"\")*1 + 10 + \"px\")"+ rt +
				"  	  			"+ rt +
				"  	  			if(now.css(\"left\").replace(\"px\",\"\")*1 != 0){"+ rt +
				"  	  				window.setTimeout(movelast, 10);"+ rt +
				"  	  			}else{"+ rt +
				"  	  				flag = false"+ rt +
				"  	  				index --"+ rt +
				"  	  			}"+ rt +
				"  	  		}"+ rt +
				"  	  		$(\"#right .right\").click(function(){"+ rt +
				"  	  		//	alert(index)"+ rt +
				"  	  			if(!flag){"+ rt +
				"  	  				$(this).parents(\"#right\").find(\".content\").each(function(){"+ rt +
				"  	  					if($(this).attr(\"index\")*1 == index){"+ rt +
				"  	  					//	alert($(this).attr(\"index\"))"+ rt +
				"  	  						if(index +1 > page || index < 0){"+ rt +
				"  	  							return;"+ rt +
				"  	  						}"+ rt +
				"  	  						ele = $(this)"+ rt +
				"  	  						if(ele.next().length){"+ rt +
				"  	  							window.setTimeout(movenext, 10)"+ rt +
				"  	  						//	index ++"+ rt +
				"  	  						}"+ rt +
				"  	  					}"+ rt +
				"  	  				})"+ rt +
				"  	  			}"+ rt +
				"  	  		})"+ rt +
				"  	  		$(\"#right .left\").click(function(){"+ rt +
				"  	  		//	alert(index)"+ rt +
				"  	  			if(!flag){"+ rt +
				"  	  				$(this).parents(\"#right\").find(\".content\").each(function(){"+ rt +
				"  	  					if($(this).attr(\"index\")*1 == (index-1)){"+ rt +
				"  	  						if(index - 1 > page || index < 0){"+ rt +
				"  	  							return;"+ rt +
				"  	  						}"+ rt +
				"  	  						ele = $(this)"+ rt +
				"  	  						window.setTimeout(movelast, 10)"+ rt +
				"  	  					//	index -- "+ rt +
				"  	  					}"+ rt +
				"  	  				})"+ rt +
				"  	  			}"+ rt +
				"  	  		})"+ rt +
				"  	  	})"+ rt +
				"  	}"+ rt +
				"  </script>"+ rt +
				"</html>" ;
		BufferedWriter writer = null;
		try{
			writer = new BufferedWriter(new FileWriter(fileName));
			writer.write(html);
		}catch(Exception e){
			System.out.println(e);
			return false ;
		}finally{
			if(writer != null){
				try {
					writer.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return true;
	}
	//写歌单静态页面
	public static boolean writeToFile_gedan(String data , String filePath){
		data = data.replaceAll("//" , "\\\\/\\\\/");
		String html = 
				"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"+ rt +
				"<html>"+ rt +
				"  <head>"+ rt +
				"    "+ rt +
				"    <title>歌单详情</title>"+ rt +
				"    "+ rt +
				"	<meta http-equiv=\"pragma\" content=\"no-cache\">"+ rt +
				"	<meta http-equiv=\"cache-control\" content=\"no-cache\">"+ rt +
				"	<meta http-equiv=\"expires\" content=\"0\">    "+ rt +
				"	<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">"+ rt +
				"	<meta http-equiv=\"description\" content=\"This is my page\">"+ rt +
				"   <meta charset=\"gbk\">" +rt +
				"	<!--"+ rt +
				"	<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">"+ rt +
				"	-->"+ rt +
				"	<script>var data = \""+data+"\";</script>"+ rt +
				"	<style>"+ rt +
				"		*{margin:0px;padding:0px;font-size:12px;}"+ rt +
				"		a{color:black;}"+ rt +
				"		li{list-style:none;}"+ rt +
				"		"+ rt +
				"		/*容器样式*/"+ rt +
				"		#container{"+ rt +
				"			width:82%;"+ rt +
				"			background:#e5e5e5;	"+ rt +
				"			overflow:hidden;"+ rt +
				"           margin:0px auto;"+ rt +
				"		}"+ rt +
				"		/*左侧专辑信息显示*/"+ rt +
				"		#left{"+ rt +
				"			width:300px;"+ rt +
				"			height:400px;"+ rt +
				"			margin-top:50px;"+ rt +
				"			margin-left:30px;"+ rt +
				"			/*background:red;*/"+ rt +
				"			border-radius:10px;"+ rt +
				"			overflow:hidden;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#left .left-pic{"+ rt +
				"			width:140px;"+ rt +
				"			height:140px;"+ rt +
				"			float:left;"+ rt +
				"			border-radius:10px;"+ rt +
				"			overflow:hidden;"+ rt +
				"		}"+ rt +
				"		#left .left-pic img{"+ rt +
				"			width:140px;"+ rt +
				"			height:140px;"+ rt +
				"		}"+ rt +
				"		#left .left-info{"+ rt +
				"			float:left;"+ rt +
				"			width:150px;"+ rt +
				"			height:140px;"+ rt +
				"			border-radius:10px;"+ rt +
				"			margin-left:10px;"+ rt +
				"		}"+ rt +
				"		#left .left-info li{"+ rt +
				"			font-size:15px;"+ rt +
				"			margin-top:13px;"+ rt +
				"		}"+ rt +
				"		#left .desc{"+ rt +
				"			width:300px;"+ rt +
				"			height:372px;"+ rt +
				"		}"+ rt +
				"		#left .desc img{"+ rt +
				"			width:160px;"+ rt +
				"			height:160px;"+ rt +
				"			margin-top:55px;"+ rt +
				"		}"+ rt +
				"		#left p{"+ rt +
				"			color:red;"+ rt +
				"			margin-top:10px;"+ rt +
				"		}"+ rt +
				"		/*right*/"+ rt +
				"		#right{"+ rt +
				"			width:750px;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:right;"+ rt +
				"		}"+ rt +
				"		#right .left{"+ rt +
				"			width:50px;"+ rt +
				"			height:100%;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#right .left span{"+ rt +
				"			width:30px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			background:#bec7be;"+ rt +
				"			display:block;"+ rt +
				"			margin:245px auto 0px;"+ rt +
				"			border-radius:50%;"+ rt +
				"			text-align:center;"+ rt +
				"			font-size:20px;"+ rt +
				"		}"+ rt +
				"		#right .left:hover{"+ rt +
				"			background:#cdcaca;"+ rt +
				"			cursor:pointer;"+ rt +
				"		}"+ rt +
				"		#right .right{"+ rt +
				"			width:50px;"+ rt +
				"			height:100%;"+ rt +
				"			background:#e5e5e5;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		#right .right:hover{"+ rt +
				"			background:#cdcaca;"+ rt +
				"			cursor:pointer;"+ rt +
				"		}"+ rt +
				"		#right .right span{"+ rt +
				"			width:30px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			background:#bec7be;"+ rt +
				"			display:block;"+ rt +
				"			margin:245px auto 0px;"+ rt +
				"			border-radius:50%;"+ rt +
				"			text-align:center;"+ rt +
				"			font-size:20px;"+ rt +
				"		}"+ rt +
				"		#right .center{"+ rt +
				"			width:650px;"+ rt +
				"			height:100%;"+ rt +
				"			float:left;"+ rt +
				"			overflow:hidden;"+ rt +
				"			position:relative;"+ rt +
				"		}"+ rt +
				"		.center .content{"+ rt +
				"			width:510px;"+ rt +
				"			height:430px;"+ rt +
				"			margin:50px 100px 0px; "+ rt +
				"		}"+ rt +
				"		.center .content ul li{"+ rt +
				"			width:170px;"+ rt +
				"			height:30px;"+ rt +
				"			line-height:30px;"+ rt +
				"			float:left;"+ rt +
				"		}"+ rt +
				"		.center .content ul li:hover a{"+ rt +
				"			color:red;"+ rt +
				"		}"+ rt +
				"		"+ rt +
				"		#container{"+ rt +
				"			display:block;"+ rt +
				"		}"+ rt +
				"	</style>"+ rt +
				"  </head>"+ rt +
				"  "+ rt +
				"  <body>"+ rt +
				"  <div>"+ rt +
				"    <div id=\"container\">"+ rt +
				"    	<div id=\"left\">"+ rt +
				"    		<div class=\"left-pic\">"+ rt +
				"    			<img src=\"../img/logo.png\">"+ rt +
				"    		</div>"+ rt +
				"    		<ul class=\"left-info\">"+ rt +
				"    		</ul>"+ rt +
				"    		<div class=\"desc\">"+ rt +
				"    		</div>"+ rt +
				"    		<p>详情扫码</p>"+ rt +
				"    	</div>"+ rt +
				"    	<div id=\"right\">"+ rt +
				"    		<div class=\"left\"><span><</span></div>"+ rt +
				"    		<div class=\"center\">"+ rt +
				"    			<div class=\"content\" index = \"1\" style=\"position:absolute;left:0px;top:0px;\">"+ rt +
				"    				<ul class=\"title\">"+ rt +
				"	    				<li>歌名</li>"+ rt +
				"	    				<li>歌手</li>"+ rt +
				"	    				<li>操作</li>"+ rt +
				"	    			</ul>"+ rt +
				"    			</div>"+ rt +
				"    		</div>"+ rt +
				"    		<div class=\"right\"><span>></span></div>"+ rt +
				"    	</div>"+ rt +
				"    </div>"+ rt +
				"  </div>"+ rt +
				"  </body>"+ rt +
				"  <script src=\"../js/jquery.min.js\"></script>"+ rt +
				"  <script src=\"../js/jquery.function.js\"></script>" + rt +
				"  <script>"+ rt +
				" 	var page = 1"+ rt +
				"  	$(function(){"+ rt +
				"  		$(\"#container\").css(\"display\",\"block\")"+ rt +
				"  		$(\"#loading\").css(\"display\",\"none\")"+ rt +
				"  		data = eval(decodeURI(data))"+ rt +
				"  		$(\".desc\").append($(\"<img src='../code.do?method=qrcode&useimg=true&data=https://www.baidu.com/s?wd=暂无数据&pic_url=img/logo.png'>\"))"+ rt +
				"  		for (var i=0;i<data.length;i++){"+ rt +
				"  		  	if(i != 0 && i % 10 == 0){"+ rt +
				"  		  		$(\".center\").append($(\"<div  style='position:absolute;left:650px;top:0px;' class='content' index = '\"+(i/10+1)+\"'><ul class='title'><li>歌名</li><li>歌手</li><li>操作</li></ul></div>\"))"+ rt +
				"  		  		page ++ "+ rt +
				"  		  	}"+ rt +
				"  		  	var music_name = $(\"<li></li>\")"+ rt +
				"  		  		.append($(\"<a href='javascript:void(0)' onclick='music_click(this)' src='../music.yy?method=music&music_url=\"+data[i].music_url+\"'>\"+data[i].music_name+\"</a>\"))"+ rt +
				"  		  	"+ rt +
				"  		  	var singer_name = $(\"<li></li>\")"+ rt +
				"  		  		.append($(\"<a href='javascript:void(0)'>\"+data[i].singer_name+\"</a>\"));"+ rt +
				"  		  	"+ rt +
				"  		  	var i_icon = $(\"<i style=\\\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('../img/player_icon.png') 0px 221px\\\"></i>\""+ rt +
				"  		  		  	  +\"<i style=\\\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('../img/player_icon.png') 0px 336px\\\"></i>\"+"+ rt +
				"  		  		  	  \"<i style=\\\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('../img/player_icon.png') 0px 203px\\\"></i>\"+"+ rt +
				"  		  		  	  \"<i style=\\\"transform: scale(0.75);float:left;width:18px;display:block;height:18px;background:url('../img/player_icon.png') 0px 317px\\\"></i>\")"+ rt +
				"  		  	"+ rt +
				"  		  	var icon = $(\"<li></li>\").append(i_icon)"+ rt +
				"  		  	"+ rt +
				"  		  	$(\"#right .center .content:last\").append($(\"<ul></ul>\").append(music_name).append(singer_name).append(icon))"+ rt +
				"  		}"+ rt +
				"  		dopage()"+ rt +
				"  	})"+ rt +
				"   //音乐点击事件 " + rt +
				"  	function music_click(obj){ " + rt +
				"  		$.ajax({" + rt +
				"  			url:$(obj).attr(\"src\")," + rt +
				"  			type:\"GET\"," + rt +
				"  			success:function(data){" + rt +
				"  				data = eval(data)[0].data" + rt +
				"  				var m = new music_my($(obj).attr(\"src\"))" + rt +
				"  				m.add_music(data)" + rt +
				"  			}" + rt +
				"  		})" + rt +
				"  	}" +rt +
				"  	function dopage(){"+ rt +
				"  	//换页效果"+ rt +
				"  	  	$(function(){"+ rt +
				"  	  		var flag = false;"+ rt +
				"  	  		//当前标签"+ rt +
				"  	  		var ele = null"+ rt +
				"  	  		//记录当前页数"+ rt +
				"  	  		var index = 1"+ rt +
				"  	  		//下一页"+ rt +
				"  	  		function movenext(){"+ rt +
				"  	  			var now = ele"+ rt +
				"  	  			var next = now.next()"+ rt +
				"  	  			flag = true"+ rt +
				"  	  			"+ rt +
				"  	  			now.css(\"left\",now.css(\"left\").replace(\"px\",\"\")*1 - 10 + \"px\")"+ rt +
				"  	  			next.css(\"left\",next.css(\"left\").replace(\"px\",\"\")*1 - 10 + \"px\")"+ rt +
				"  	  			"+ rt +
				"  	  			if(now.css(\"left\").replace(\"px\",\"\")*1 != -650){"+ rt +
				"  	  				window.setTimeout(movenext, 10);"+ rt +
				"  	  			}else{"+ rt +
				"  	  				flag = false"+ rt +
				"  	  				index ++"+ rt +
				"  	  			}"+ rt +
				"  	  		}"+ rt +
				"  	  		function movelast(){"+ rt +
				"  	  			var now = ele"+ rt +
				"  	  			var next = now.next()"+ rt +
				"  	  			flag = true"+ rt +
				"  	  			"+ rt +
				"  	  			now.css(\"left\",now.css(\"left\").replace(\"px\",\"\")*1 + 10 + \"px\")"+ rt +
				"  	  			next.css(\"left\",next.css(\"left\").replace(\"px\",\"\")*1 + 10 + \"px\")"+ rt +
				"  	  			"+ rt +
				"  	  			if(now.css(\"left\").replace(\"px\",\"\")*1 != 0){"+ rt +
				"  	  				window.setTimeout(movelast, 10);"+ rt +
				"  	  			}else{"+ rt +
				"  	  				flag = false"+ rt +
				"  	  				index --"+ rt +
				"  	  			}"+ rt +
				"  	  		}"+ rt +
				"  	  		$(\"#right .right\").click(function(){"+ rt +
				"  	  		//	alert(index)"+ rt +
				"  	  			if(!flag){"+ rt +
				"  	  				$(this).parents(\"#right\").find(\".content\").each(function(){"+ rt +
				"  	  					if($(this).attr(\"index\")*1 == index){"+ rt +
				"  	  					//	alert($(this).attr(\"index\"))"+ rt +
				"  	  						if(index +1 > page || index < 0){"+ rt +
				"  	  							return;"+ rt +
				"  	  						}"+ rt +
				"  	  						ele = $(this)"+ rt +
				"  	  						if(ele.next().length){"+ rt +
				"  	  							window.setTimeout(movenext, 10)"+ rt +
				"  	  						//	index ++"+ rt +
				"  	  						}"+ rt +
				"  	  					}"+ rt +
				"  	  				})"+ rt +
				"  	  			}"+ rt +
				"  	  		})"+ rt +
				"  	  		$(\"#right .left\").click(function(){"+ rt +
				"  	  		//	alert(index)"+ rt +
				"  	  			if(!flag){"+ rt +
				"  	  				$(this).parents(\"#right\").find(\".content\").each(function(){"+ rt +
				"  	  					if($(this).attr(\"index\")*1 == (index-1)){"+ rt +
				"  	  						if(index - 1 > page || index < 0){"+ rt +
				"  	  							return;"+ rt +
				"  	  						}"+ rt +
				"  	  						ele = $(this)"+ rt +
				"  	  						window.setTimeout(movelast, 10)"+ rt +
				"  	  					//	index -- "+ rt +
				"  	  					}"+ rt +
				"  	  				})"+ rt +
				"  	  			}"+ rt +
				"  	  		})"+ rt +
				"  	  	})"+ rt +
				"  	}"+ rt +
				"  </script>"+ rt +
				"</html>" ;
		BufferedWriter writer = null;
		try{
			writer = new BufferedWriter(new FileWriter(filePath));
			writer.write(html);
		}catch(Exception e){
			System.out.println(e);
			return false;
		}finally{
			if(writer != null){
				try{
					writer.close();
				}catch(Exception e){
					System.out.println(e);
				}
			}
		}
		return true;
	}
}
