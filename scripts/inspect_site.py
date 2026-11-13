import urllib.request
import re
import json

base_url = "https://fycare.webflow.io"

pages = [
    "",
    "/our-projects",
    "/make-appointment",
    "/our-services",
    "/contact-us",
    "/blog",
    "/about-us"
]

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}

for p in pages:
    url = base_url + p
    try:
        req = urllib.request.Request(url, headers=headers)
        with urllib.request.urlopen(req) as resp:
            content = resp.read().decode('utf-8', errors='ignore')
            title = re.search(r'<title>(.*?)</title>', content, re.I)
            title_text = title.group(1) if title else "No title"
            print(f"URL: {url} -> Status: {resp.status}, Title: {title_text}, Length: {len(content)}")
    except Exception as e:
        print(f"URL: {url} -> Error: {e}")
