# Sif

这个是我自己做测试时使用的工具包，因为有重装系统的爱好，每次都重新搜集也太麻烦了，就弄了个repository，每次clone就能搞到最新版的了。
原本想按照用途分成不同repository，用传说中的上古宝剑起名字，后来想想好浮夸，就放弃了，然后从北欧神话中随便抓了个名字。
Sif是北欧神话中的战士，依然好浮夸。

## What's in it
### Web测试工具
    +Burpsuite 2020.8
    +Struts2-Scan
    +dirsearch
    +dirmap
    +sqlmap
    +atlas
    +AngelSword
    +Fast-Goole-Dorks-Scan
    +GitHack
    +PHPStudy_BackDoor_Exp

### Payloads

```
+b374k-webshell
+mr6-webshell
```

### 远程管理

```
+Behinder
+AntSword
```

### 主机测试

    +nmap
    +masscan

### 字典
    +fuzzDicts
    +Yara-Rules

### 后渗透工具
    +mimikatz
    +netcat
    +Windows Exploit Suggester - Next Generation

## How to install
我用的是新版Ubuntu，你用的如果不是的话……good luck：<br/>
PS：希望你有git-lfs
```
wget https://raw.githubusercontent.com/lewiswu1209/Sif/master/setup.sh -o ./setup.sh
chmod +x ./setup.sh
./setup.sh
```
如果需要Metesploit的话(不，你不需要)
```
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall
```

## 欢迎通过pull request和提交issue的方式和我交流
