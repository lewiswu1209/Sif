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
	apt install -y git python2 python3 python3-pip
	echo "	[+] 我帮你装了git python2/3 pip3，你自己装pip2 java8 java11吧，java8记得用oracle jdk哦~"
}

function install_from_git() {
	git clone --recurse-submodules https://github.com/lewiswu1209/sif.git /opt/sif
}

function install_from_apt() {
	echo "	[+] 正在安装nmap masscan sqlmap。。。"
	apt install -y nmap masscan sqlmap
}

function setup_env() {
	echo "	[+] 正在配置环境"
	echo "export PATH=\"\$PATH:/opt/sif/bin\"" > /etc/profile.d/sif.sh
}

function setup_app() {
	chmod +x /opt/sif/auxiliary/Fast-Google-Dorks-Scan/FGDS.sh
	pip3 install click bs4 requests choice humanfriendly
	pip3 install -r /opt/sif/auxiliary/dirmap/requirement.txt
	pip3 install -r /opt/sif/auxiliary/AngelSword/requirements.txt
	pip2 install -r /opt/sif/exploit/tp5-getshell/requirements.txt
}

function install_by_wget() {
	wget https://github.com/AntSwordProject/AntSword-Loader/releases/download/4.0.3/AntSword-Loader-v4.0.3-linux-x64.zip -O /tmp/antsword-loader.zip
	unzip /tmp/antsword-loader.zip -d /opt/sif/auxiliary/
	mv /opt/sif/auxiliary/AntSword* /opt/sif/auxiliary/AntSword
}

banner
check_root
install_base
install_from_apt
install_from_git
install_by_wget
setup_env
setup_app
