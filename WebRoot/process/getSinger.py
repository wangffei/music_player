import requests
import urllib3
from lxml import etree
from urllib import parse
import re
import json
import sys

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
headers = {
        "user-agent":"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        "referer":"https://www.kugou.com/yy/html/search.html"
    }

def main(url):
    try:
        html = requests.get(url , headers = headers, verify=False)
        reg = ".*?songsdata = (\[.*?);"
        html = re.search(reg , html.text)[1]
        html = json.loads(html)
        data = []
        for item in html:
            song = {}
            song["zhuanji_name"] = parse.quote(item["album_name"])
            song["zhuanji_url"] = "https://www.kugou.com/album/"+str(item["album_id"])+".html"
            song["music_url"] = "https://wwwapi.kugou.com/yy/index.php?r=play/getdata&hash="+item["hash"]
            song["music_name"] = parse.quote(item["songname"])
            data.append(song)
        print(data)
    except Exception as er:
        print("[]")

if __name__ == "__main__":
    url = sys.argv[1]
    main(url)
