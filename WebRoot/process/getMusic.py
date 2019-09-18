import requests
import urllib.parse
import urllib3
import re
from lxml import etree
import json
import sys

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
headers_search = {"User-Agent":"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36"
                  ,"Host":"songsearch.kugou.com"}
headers_music ={
            "User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3610.2 Safari/537.36",
            "Host":"wwwapi.kugou.com"
            }

def music(url):
    try:
        html = requests.get(url , headers = headers_search , verify=False)
        html = json.loads(html.text)
        song_list = html["data"]["lists"]
        data = []
        for song in song_list:
            song_data = {}
            singer_info = []
            singer_name = song["SingerName"].split("、")
            for i in range(0,len(singer_name)):
                singer = {}
                if(song["SingerId"][i] == 0):
                    singer["singer_url"] = ""
                    singer["singer_name"] = ""
                    singer_info.append(singer)
                    continue
                singer["singer_url"] = "https://www.kugou.com/singer/"+str(song["SingerId"][i])+".html"
                singer["singer_name"] = singer_name[i]
                singer_info.append(singer)
            song_data["singer"] = singer_info
            if(song["AlbumID"] != ""):
                song_data["zhuanji_name"] = "Vae新歌+精选珍藏合辑"
                song_data["zhuanji_url"] = "https://www.kugou.com/yy/album/single/"+song["AlbumID"]+".html"
            else:
                song_data["zhuanji_name"] = ""
                song_data["zhuanji_url"] = ""
            song_data["music_url"] = "https://wwwapi.kugou.com/yy/index.php?r=play/getdata&hash="+song["FileHash"]
            song_data["music_name"] = song["SongName"]
            song_data["time"] = song["Duration"]
            data.append(song_data)
            pass
        print(data)
    except Exception as er:
        print("[]")

def gedan(url):
    try:
        html = requests.get(url , headers = headers_search , verify=False)
        gedan_list = json.loads(html.text)["data"]["lists"]
        data = []
        for gedan in gedan_list:
            gedan_one = {}
            gedan_one["gedan_img"] = gedan["img"]
            gedan_one["gedan_name"] = gedan["specialname"]
            gedan_one["gedan_url"] = "https://www.kugou.com/yy/special/single/"+str(gedan["specialid"])+".html"
            gedan_one["gedan_creater"] = gedan["nickname"]
            data.append(gedan_one)
            pass
        print(data)
    except Exception as er:
        print("[]")

def main(key , page , tp):
    key = urllib.parse.quote(key , "utf-8")
    if(tp == "1"):
        tp = "song_search_v2"
        url = "https://songsearch.kugou.com/"+tp+"?keyword="+key+"&page="+page+"&pagesize=30&platform=WebFilter"
        music(url)
    elif(tp == "2"):
        tp = "special_search"
        url = "https://songsearch.kugou.com/"+tp+"?keyword="+key+"&page="+page+"&pagesize=30&platform=WebFilter"
        gedan(url)

if __name__ == "__main__": 
    key = sys.argv[1]
    tp = sys.argv[2]
    page = sys.argv[3]
    main(key , page , tp)
