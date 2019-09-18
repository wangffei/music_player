import requests
import urllib3
import json
from threading import Thread
import sys

headers = {
        "user-agent":"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        "referer":"https://music.laod.cn/"
    }

path = ""

class MyThread(Thread):
    def __init__(self,list_id):
        self.list_id = list_id
        Thread.__init__(self)
    def run(self):
        #types: playlist id: 3778678
        postData = {"types":"playlist","id":self.list_id}
        response = requests.post("https://music.laod.cn/api.php" , headers = headers , data=postData)
        html = json.loads(response.text)["playlist"]
        data = {}
        data["img"] = html["creator"]["avatarUrl"]
        data["name"] = html["name"]
        music_list = {}
        i = 1
        for item in html["tracks"]:
            music = {}
            music["zhuanji_name"] = item["al"]["name"]
            music["singer_name"] = item["ar"][0]["name"]
            music["singer_img"] = str(item["al"]["picUrl"])+"?param=200y200"
            music["music_name"] = item["name"]
            music["time"] = item["dt"]
            music["music_url"] = "music.yy?method=hotPlay&id="+str(item["id"])
            music_list[i] = music
            i = i + 1
        data["data"] = music_list
        fp = open(path+"163Hot/"+str(self.list_id)+".js","w" , encoding="utf-8")
        fp.write("var auto_list = "+str(data) + "\r\nif(list !== undefined && list != null){ \r\nlist.push(auto_list) \r\n}")

if __name__ == "__main__":
    path = sys.argv[1]
    playList = [2122703724 , 2250011882,3778678,652232466,4395559,2884035,440103454,2433860552]
    for i in range(0,len(playList)):
        thread = MyThread(playList[i])
        thread.start()
