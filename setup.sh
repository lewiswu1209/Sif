#!/bin/bash

function banner() {
	echo " _____ _  __ "
	echo "/  ___(_)/ _|"
	echo "\ \`--. _| |_ "
	echo " \`--. \ |  _|"
	echo "/\__/ / | |  "
	echo "\____/|_|_|  "
}

function check_root() {
	if [ `whoami` != "root" ];then
		echo "	[+] 当前非root用户，正在使用sudo -E重新运行。"
		sudo -E ./setup.sh
		exit
	fi
}

function install_base() {
	echo "	[+] 正在安装git，python，Java，。。。"
	apt install -y git python2 python3 python3-pip openjdk-8-jre openjdk-11-jre
}

function install_from_git() {
	git clone --recurse-submodules https://github.com/lewiswu1209/Sif.git /opt/Sif
}

function install_from_apt() {
	echo "	[+] 正在安装nmap masscan sqlmap。。。"
	apt install -y nmap masscan sqlmap
}

function setup_env() {
	echo "	[+] 正在配置环境"
	echo "export PATH=\"\$PATH:/opt/Sif/bin\"" > /etc/profile.d/Sif.sh
}

function setup_app() {
	chmod +x /opt/Sif/auxiliary/Fast-Google-Dorks-Scan/FGDS.sh
	pip3 install click bs4 requests choice humanfriendly
	pip3 install -r /opt/Sif/auxiliary/dirmap/requirement.txt
	pip3 install -r /opt/Sif/auxiliary/AngelSword/requirement.txt
	pip2 install -r /opt/Sif/exploit/tp5-getshell/requirements.txt
}

function install_by_wget() {
	wget https://github.com/AntSwordProject/AntSword-Loader/releases/download/4.0.3/AntSword-Loader-v4.0.3-linux-x64.zip -O /tmp/antsword-loader.zip
	unzip /tmp/antsword-loader.zip -d /opt/Sif/auxiliary/
	mv /opt/Sif/auxiliary/AntSword* /opt/Sif/auxiliary/AntSword
	
	wget https://github.com/lewiswu1209/Sif/releases/download/0.1/burpsuite_pro_v2020.8.jar -O /opt/Sif/auxiliary/burpsuite/burpsuite_pro_v2020.8.jar
}

banner
check_root
install_base
install_from_apt
install_from_git
install_by_wget
setup_env
setup_app
