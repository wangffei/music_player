<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'recorder_more.jsp' starting page</title>
    
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
		a{color:black;text-decoration: none;}
		#container{
			width:80%;
			margin:0px auto;
		}
		#show{
			margin-top:30px;
		}
		#recorder-info{
			position: absolute;
			top:0px;
			width:100%;
			background:#a5a2a2;
			display:none;
		}
		#recorder-info div{
			width:360px;
			margin:70px auto;
			background:#9b9ba4;
		}
		#recorder-info div ul li:nth-child(1){
			width:130px;
			height:130px;
			margin:0px auto;
		}
		#form{
			display:none;
		}
		.title{
			height:43px;
		}
		#show div{
			float:left;
			overflow:hidden;
			margin-left:82px;
			margin-top:10px;
		}
		#show div li:nth-child(1){
			width:148px;
			height:148px;
			background:gray;
		}
		#show div li:nth-child(1) img{
			margin:4px;
			width:140px;
			height:140px;
		}
		
		#playing div{
			float:left;
			overflow:hidden;
			margin-left:30px;
			margin-top:10px;
		}
		#playing div li:nth-child(1){
			width:148px;
			height:148px;
			background:gray;
		}
		#playing div li:nth-child(1) img{
			margin:4px;
			width:140px;
			height:140px;
		}
		#playing{
			margin-top:20px;
		}
	</style>
  </head>
  
  <body>
    <div id="container">
    	<div class="title">
    		<h2 style="margin-top:20px;width:300px;float:left;">全部电台</h2>
    		<h4 id="recorder" style="width:68px;float:right;margin-top:20px;line-height:35px;">申请电台</h4>
    	</div>
    	<div id="show"></div>
    	<div class="title" style="margin-top:20px;">
    		<h2 style="margin-top:20px;width:300px;float:left;">正在直播</h2>
    	</div>
    	<div id="playing">
    		
    	</div>
    </div>
    <div id="recorder-info">
    	<div>
    		<ul>
    			<li><img id="add" src="img/add.png" style="border:1px solid black;margin-top:20px;width:130px;height:130px;"></li>
    			<li style="text-align:center;"><input class="title_a"  style="width:340px;height:30px;margin-top:30px;" type="text" placeholder="标题" name="title"></li>
    			<li style="text-align:center;"><textarea class="desc_a" style="width:340px;height:100px;margin-top:30px;" placeholder="描述" name="recorder-desc"></textarea></li>
    			<li style="text-align:center;"><input class="submit" style="width:100px;height:30px;margin-top:30px;" type="button" value="提交申请"></li>
    		</ul>
    		<form id="form" method="post" action="file.do" enctype="multipart/form-data">
    			<input type="hidden" name="title" class="title" >
    			<input type="hidden" name="desc" class="desc">
				<input class="file" name="img" type="file" />
				<input class="sub" type="submit" value="提交" />
			</form>
    	</div>
    </div>
  </body>
  <script src="js/jquery.min.js"></script>
  <script>
  	$(function(){
  		$("#recorder-info").css("height",$(document).height())
  		
  		$("#add").click(function(){
  			$(".file").click()
  			var img = $(".file")[0].onchange = function(){
  				var url = getObjectURL(this.files[0]) 
  				$("#add").attr("src",url)
  			}
  		})
  		
  		function getObjectURL(file) {
		    var url = null ;
		    if (window.createObjectURL!=undefined) { // basic
		        url = window.createObjectURL(file) ;
		    } else if (window.URL!=undefined) { // mozilla(firefox)
		        url = window.URL.createObjectURL(file) ;
		    } else if (window.webkitURL!=undefined) { // webkit or chrome
		        url = window.webkitURL.createObjectURL(file) ;
		    }
		    return url ;
		}
  		//alert("")
  		$(".submit").click(function(){
  			$(".title").val($(".title_a").val())
  			$(".desc").val($(".desc_a").val())
  			$(".sub").click()
  		})
  		
  		$(".title h4").click(function(){
  			$("#recorder-info").css("display","block")
  		})
  	})
  	$(function(){
  		$.ajax({
  			type:"GET",
  			url:"recorder.do?method=recorder_list",
  			success:function(data){
  				data = eval(data)
  				$("#show").css("height",(data.length % 5 == 0 ? data.length / 5 : parseInt(data.length / 5) +1 )*180 + "px")
  				//console.log(data.length % 5 == 0 ? data.length / 5 : parseInt(data.length / 5) +1)
  				for(var i=0;i<data.length;i++){
  					var div = null
  					var a = $("<a href='detail.do?method=recorder&recorder_id="+data[i].recorder_id+"'></a>")
  					if(i % 5 == 0){
  						a.append($("<li><img src='recorder/image/"+data[i].recorder_img+"'></li>"))
  						a.append($("<li>"+(data[i].recorder_name.length > 9 ? data[i].recorder_name.substring(0,9) : data[i].recorder_name)+"</li>"))
  						div = $("<div style='margin-left:0px;'></div>")
  						div.append(a)
  					}else{
  						a.append($("<li><img src='recorder/image/"+data[i].recorder_img+"'></li>"))
  						a.append($("<li>"+(data[i].recorder_name.length > 9 ? data[i].recorder_name.substring(0,9) : data[i].recorder_name)+"</li>"))
  						div = $("<div></div>")
  	  					div.append(a)
  					}
  					$("#show").append(div)
  				}
  			},error:function(){
  				alert("网络不给力")
  			}
  		})
  	})
  	$(function(){
  		$.ajax({
  			type:"GET",
  			url:"recorder.do?method=playing_list",
  			success:function(data){
  				data = eval(data)
  				for(var i=0;i<data.length;i++){
  					var div = null
  					var a = $("<a href='detail.do?method=recorder_playing&id="+data[i].id+"'></a>")
  					if(i % 5 == 0){
						a.append($("<li><img src='recorder/image/"+data[i].img+"'></li>"))	
						a.append($("<li>"+(data[i]._name.length > 9 ? data[i]._name.substring(0,9) : data[i]._name)+"</li>"))
  						div = $("<div style='margin-left:0px;'></div>")
  						div.append(a)
  					}else{
  						a.append($("<li><img src='recorder/image/"+data[i].img+"'></li>"))
  						.append($("<li>"+(data[i]._name.length > 9 ? data[i]._name.substring(0,9) : data[i]._name)+"</li>"))
  						div = $("<div></div>")
  	  					div.append(a)	
  					}
  					$("#playing").append(div)
  				}
  			}
  		})
  	})
  </script>
</html>
