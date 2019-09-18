import re
from urllib import parse
import requests
import json
import urllib3
import sys

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
headers = {
        "user-agent":"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
        "referer":"https://www.kugou.com/yy/html/search.html"
    }

def main(url):
    try:
        html = requests.get(url , headers = headers , verify=False)
        reg = ".*?var data=(\[.*?\}\]),\r\n"
        html = json.loads(re.search(reg , html.text)[1])
        data = []
        for item in html:
            song = {}
            song["music_name"] = parse.quote(item["songname"])
            song["music_url"] = "https://wwwapi.kugou.com/yy/index.php?r=play/getdata&hash="+item["hash"]
            song["singer_name"] = parse.quote(item["singername"])
            data.append(song)
        print(str(data).replace("'",'"'))
    except Exception as er:
        #print(er)
        print("[]")

if __name__ == "__main__":
    url = sys.argv[1]
    main(url)
