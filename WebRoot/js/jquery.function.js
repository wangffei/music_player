function ajax(url , success , error){
	$.ajax({
		type:"GET",
		url:url,
		success:success,
		error:error
	})
}
var cookie = {
    set:function(key,val,time){//设置cookie方法
    	if(typeof(time) == "undefined"){
    		time = 1
    	}
        var date=new Date(); //获取当前时间
        var expiresDays=time;  //将date设置为n天以后的时间
        date.setTime(date.getTime()+expiresDays*24*3600*1000); //格式化为cookie识别的时间
        document.cookie=key + "=" + val +";expires="+date.toGMTString();  //设置cookie
    },
    get:function(key){//获取cookie方法
        /*获取cookie参数*/
        var getCookie = document.cookie.replace(/[ ]/g,"");  //获取cookie，并且将获得的cookie格式化，去掉空格字符
        var arrCookie = getCookie.split(";")  //将获得的cookie以"分号"为标识 将cookie保存到arrCookie的数组中
        var tips;  //声明变量tips
        for(var i=0;i<arrCookie.length;i++){   //使用for循环查找cookie中的tips变量
            var arr=arrCookie[i].split("=");   //将单条cookie用"等号"为标识，将单条cookie保存为arr数组
            if(key==arr[0]){  //匹配变量名称，其中arr[0]是指的cookie名称，如果该条变量为tips则执行判断语句中的赋值操作
                tips=arr[1];   //将cookie的值赋给变量tips
                break;   //终止for循环遍历
            }
        }
        return tips;
    },
    del:function(key){ //删除cookie方法
       var date = new Date(); //获取当前时间
       date.setTime(date.getTime()-10000); //将date设置为过去的时间
       document.cookie = key + "=v; expires =" +date.toGMTString();//设置cookie
    }
}

/*版本1时解析歌曲类（已弃用）*/
/*
var music_play = function(){
	//控制切换音乐的界面
	var page = parent.document
	//保存歌曲总共时长
	time = 0
	//ajax封装
	_ajax = function(url , susses , faild , async){
		$.ajax({
			type:"GET",
			url:url,
			async:async,
			success:susses,
			error:faild
		});
	}
	//显示音乐播放界面
	show = function(){
		$("#music_word",page).css("display","block")
	}
	
	timeSort = function(arr){
		for (var i=0;i<arr.length;i++){
			for (var j=1;j<arr.length - i;j++){
				if(arr[j-1] > arr[j]){
					var temp = arr[j-1]
					arr[j-1] = arr[j]
					arr[j] = temp
				}
			}
		}
		return arr
	}
	
	//歌词解码
	this.urlDecode = function(music_id){
		var lrcdata = null;
		//通过ajax获取歌词网页
		_ajax("music.do?method=getmusicword&music_id="+music_id,function(data){
			lrcdata = data;
		},function(){
			console.log('歌词请求失败')
		} , false);
		//alert(lrcdata)
		if(lrcdata != null && lrcdata != ""){
			var reg1 = /(\[\d{2}:\d{2}\.\d{2}\])+(.[^\[]*)?/g  //匹配歌词时间及内容部分
			var reg2 = /\[.([^0-9\]]*)?\]/g                      //匹配歌词头部信息
			var json = eval(lrcdata)
			lrcdata = json[0]['music_lrc']
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
					json = json + "\""+time+"\":\"" + str_txt +"\",";
				}
			}
			
			json = json.replace(/,$/ , "}]")
			
			json = eval(json)
			
			function mysort(){//给歌词部分按时间排序
				var arr = [];
				for(var i in json[0]){
					arr.push(i*1)
				}
				arr = this.timeSort(arr)
				//console.log(arr)
				
				for(var i in arr){
					$("#lrc_show_bar",page).append($("<p id="+Math.round(arr[i])+" style='text-align:center;font-family:隶书;'>"+json[0][arr[i]]+"</p>"))
				//	ajson += "\""+arr[i]+"\":\""+json[0][arr[i]]+"\","
				}
			}
			mysort()
		}
	}
	
	this.urlDecode_yy = function(lrcdata){
		if(typeof(lrcdata) == "undefined"){
			return ;
		}
		if(lrcdata != null && lrcdata != ""){
			var reg1 = /(\[\d{2}:\d{2}\.\d{2}\])+(.[^\[]*)?/g  //匹配歌词时间及内容部分
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
			
			function mysort(){//给歌词部分按时间排序
				var arr = [];
				for(var i in json[0]){
					arr.push(i*1)
				}
				//arr.sort(function(a , b){
				//	return a-b;
				//})
				arr = this.timeSort(arr)
				//console.log(arr)
				
				$("#lrc_show_bar",page).find("p").each(function(){
					$(this).remove()
				})
				
				for(var i in arr){
					$("#lrc_show_bar",page).append($("<p id="+Math.round(arr[i])+" style='text-align:center;font-family:隶书;'>"+json[0][arr[i]]+"</p>"))
				//	ajson += "\""+arr[i]+"\":\""+json[0][arr[i]]+"\","
				}
			}
			mysort()
		}
	}
	//将音乐导入浏览器
	music_src=function(music_href){
		$("#music_player",page).attr("src",music_href)
	}
	//播放
	play = function(){
		$("#music_play",page).css("background","url(img/icon.jpg) 205px 227px").attr("value","0");
		$("#music_player",page)[0].play();
	}
	//暂停
	stop = function(){
		$("#music_play",page).css("background","url(img/icon.jpg) 261px 227px").attr("value","1");
		$("#music_player",page)[0].pause();
	}
	//给音乐播放加监听事件
	listenEvent = function(){
		init_top = $("#lrc_show_bar",page).css("top").replace("px","")*1
		$("#music_player",page)[0].addEventListener("timeupdate",function(){
			var now = $("#music_player",page)[0].currentTime
			var per = now/time *100
			//console.log(per)
			$(".progress-bar",page).css("width",per+"%").attr("aria-valuenow",per)
			var min = parseInt(now/60) <10 ? "0"+parseInt(now/60) : parseInt()
			var sec = parseInt(now%60) <10 ? "0"+parseInt(now%60) : parseInt(now%60)
			$(".proc_top",page).find("div").html(min+":"+sec+"/"+parseInt(time/60)+":"+parseInt(time%60));
			$("#"+Math.round(now),page).parent("div").find("p").css("color","black").css("font-size","14px")
			$("#"+Math.round(now),page).css("color","red").css("font-size","18px")
			//console.log(now)
			if($("#"+Math.round(now),page)[0]){
				var top = $("#"+Math.round(now),page)[0].offsetTop
				if(top>210){					
					$("#lrc_show_bar",page).css("top",init_top-(top-init_top-165)+"px")
				}else{
					$("#lrc_show_bar",page).css("top",init_top)
				}
			}
		})
	}
	//音乐结束后的监听事件
	end = function(){
		$("#music_player",page)[0].addEventListener("ended",function(){
			$("#music_play",page).css("background","url(img/icon.jpg) 261px 227px").attr("value","1");
			$("#music_proc",page).find(".progress-bar").css("width",0+"%")
			$("#music_proc",page).find(".progress-bar").attr("aria-valuenow",0+"")
			$("#lrc_show_bar",page).css("top",init_top+"px")
			$("#lrc_show_bar",page).find("p").each(function(){
				$(this).remove()
			})
		})
	}
	
	this.setPage = function(a_page){
		page = a_page
	}
	this.music_yy = function(prop){
		//清除歌词
		$("#lrc_show_bar",page).find("p").each(function(){
			$(this).remove()
		})
		//time = prop.time
		//$("#music_player",page).attr("time",time)
		//设置歌手信息
		$(".music_singer_name",page).html(prop.data.author_name)
		//设置歌手图片
		$(".music_singer_pic",page).find("img").attr("src",prop.data.img)
		//设置脚部歌手图标
		$("#singer_pic",page).attr("src",prop.data.img)
		//导入歌词
		this.urlDecode_yy(prop.data.lyrics)
		//导入歌曲
		music_src(prop.data.play_url)
		//$("#music_player",page).attr("time",$("#music_player",page)[0].duration)
		window.onload = function(){
			cookie.set("mp3_url",prop.data.play_url.replace(/=/g,"%25"),1)
			cookie.set("singer_img",prop.data.img,1)
			cookie.set("lrc_url",prop.data.lyrics,1)
			cookie.set("singer_name",prop.data.author_name,1)
			cookie.set("type","yy",1)
			show();
			//listenEvent()
			//end()
			play();
			$("#music_player",page)[0].oncanplaythrough = function(){
				//alert($("#music_player",page)[0].duration)	
				$("#music_player",page).attr("time",$("#music_player",page)[0].duration)
				location = "music_list.jsp"
			}
			//location = "music_list.jsp"
		}
	}
	this.music = function(prop){
		//清除歌词
		$("#lrc_show_bar",page).find("p").each(function(){
			$(this).remove()
		})
		//$("#music_player",page).unbind()
		//$("# ",page).unbind()
		time = prop.time
		$("#music_player",page).attr("time",time)
		//设置歌手信息
		$(".music_singer_name",page).html(prop.singer_name)
		//设置歌手图片
		$(".music_singer_pic",page).find("img").attr("src",prop.singer_img)
		//设置脚部歌手图标
		$("#singer_pic",page).attr("src",prop.singer_img)
		//导入歌词
		this.urlDecode(prop.music_id)
		//导入歌曲
		music_src(prop.music_href)
		window.onload = function(){
			cookie.set("mp3_url",prop.music_href.replace(/=/g,"%25"),1)
			cookie.set("singer_img",prop.singer_img,1)
			cookie.set("time",prop.time,1)
			cookie.set("music_id",prop.music_id,1)
			cookie.set("singer_name",prop.singer_name,1)
			cookie.set("type","server",1)
			show();
			//listenEvent()
			//end()
			play();
			location = "music_list.jsp"
		}
	}
	
	this.recorder = function(prop){
		time = prop.time
		$("#music_player",page).attr("time",time)
		//设置歌手信息
		$(".music_singer_name",page).html(prop.singer_name)
		//设置歌手图片
		$(".music_singer_pic",page).find("img").attr("src",prop.singer_img)
		//设置脚部歌手图标
		$("#singer_pic",page).attr("src",prop.singer_img)
		//导入歌曲
		music_src(prop.music_href)
		window.onload = function(){
			play();
		}
	}
}
*/

/*版本2解析歌曲使用类*/
var music_my = function(music_url){
	var page = window.parent
	//修改page
	setPage = function(whe){
		page = whe
	}
	//计算json键值对个数
	size_my = function(d){
		var size = 0
		for(var i in d){
			if(d.hasOwnProperty(i)){
				size ++ 
			}
		}
		return size
	}
	//播放歌曲
	play_music = function(m , i , l , t){
		$("#music_player",page.document).attr("src",m)
		$("#music_player",page.document).attr("time",t*1/1000)
		$("#music_player",page.document)[0].play()
		$("#music_play",page.document).css("background","url(img/btn.png) 234px 234px").attr("value","0");
		$("#singer_pic",page.document).attr("src",i)
		page.lrc = lrc_decode(l)
	}
	lrc_decode = function(lrcdata){
		if(typeof(lrcdata) == "undefined"){
			return ;
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
	//给index页面的music_list增加一个元素
	this.add_music = function(data){
		for(var i in page.music_list){
			if(page.music_list[i].music_name == data.song_name 
					&& page.music_list[i].singer_name == data.author_name 
					&& page.music_list[i].music_url == music_url){
				page.music_index = i
				play_music(data.play_url , data.img , data.lyrics , data.timelength)
				return
			}
		}
		parent.music_count ++
		var music = {}
		music["music_url"] = music_url//data.play_url
		music["singer_img"] = data.img
		music["time"] = data.timelength
		music["singer_name"] = data.author_name
		music["zhuanji_name"] = data.album_name
		music["music_name"] = data.song_name
		page.music_index = size_my(page.music_list) + 1
		page.music_list[(size_my(page.music_list) + 1)] = music
		play_music(data.play_url , data.img , data.lyrics , data.timelength)
	}
	//将音乐添加进列表但不播放
	this.add = function(data){
		for(var i in page.music_list){
			if(page.music_list[i].music_name == data.song_name 
					&& page.music_list[i].singer_name == data.author_name 
					&& page.music_list[i].music_url == music_url){
				return
			}
		}
		parent.music_count ++
		var music = {}
		music["music_url"] = music_url//data.play_url
		music["singer_img"] = data.img
		music["time"] = data.timelength
		music["singer_name"] = data.author_name
		music["zhuanji_name"] = data.album_name
		music["music_name"] = data.song_name
		page.music_index = size_my(page.music_list) + 1
		page.music_list[(size_my(page.music_list) + 1)] = music
	}
}