#!/bin/bash
merah="\e[1;31m"
hijau="\e[1;32m"
kuning="\e[1;33m"
biru="\e[1;34m"
putih="\e[1;37m"
cyan="\e[1;36m"
NC="\e[1;37m"
clear
if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipv4.icanhazip.com )
	
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

        echo -e  " ${cyan}╠════════════════════════════════════════════════════════════╣${NC}"
    echo -e  " ║                    ┃ JAGOANNEON - VPN ┃                    ║" | lolcat
    echo -e  " ${cyan}╠════════════════════════════════════════════════════════════╝${NC}"
	echo -e " ║ ${merah}CPU Model${NC}${putih}:${NC} $cname"
	echo -e " ║ ${merah}Number Of Cores${NC}${putih}:${NC} $cores"
	echo -e " ║ ${merah}CPU Frequency${NC}${putih}:${NC} $freq MHz"
	echo -e " ║ ${merah}Total Amount Of RAM${NC}${putih}:${NC} $tram MB"
	echo -e " ║ ${merah}Total Amount Of Swap${NC}${putih}:${NC} $swap MB"
	echo -e " ║ ${merah}System Uptime${putih}:${NC} $up"
	echo -e " ║ ${merah}Isp Name${NC}${putih}:${NC} $ISP"
	echo -e " ║ ${merah}City${NC}${putih}:${NC} $CITY"
	echo -e " ║ ${merah}Time${NC}${putih}:${NC} $WKT"
	echo -e " ║ ${merah}IPVPS${NC}${putih}:${NC} $IPVPS"
        echo -e " ║ ${merah}WhatsApp${NC}${putih}:${NC} ${hijau}wa.me/+6283857684916${NC}"
        echo -e " ║ ${merah}Facebook${NC}${putih}:${NC} ${biru}Generasi Ronggolawe Tuban${NC}"
        echo -e " ${cyan}╠════════════════════════════════════════════════════════════╝${NC}"
	date | lolcat
	echo -e "-----------------------------------------------------"
echo -e ""
echo -e  " ${cyan}╠════════════════════════════════════════════════════════════╣${NC}"
echo -e  " ║                       ┃ MENU OPTIONS ┃                     ║" |lolcat
echo -e  " ${cyan}╠════════════════════════════════════════════════════════════╝${NC}"

echo -e " 0.)  Control Panel Trial"

echo -e " 1.)  Control Panel SSH & OVPN"

echo -e " 2.)  Control Panel Vmess-V2ray"

echo -e " 3.)  Control Panel Vless"

echo -e " 4.)  Control Panel Trojan-GFW"

echo -e " 5.)  Control Panel Trojan-GO"

echo -e " 99.)  Control Panel GRPC"

echo -e ""
echo -e  " ${cyan}╠════════════════════════════════════════════════════════════╣${NC}"
echo -e  " ║                       ┃ SYSTEM MENU ┃                      ║" | lolcat 
echo -e  " ${cyan}╠════════════════════════════════════════════════════════════╝${NC}"

echo -e " 6.)  Add Subdomain Host For VPS"

echo -e " 7.)  Renew Certificate V2RAY"

echo -e " 8.)  Change Port All Account"

echo -e " 9.)  Autobackup Data VPS"

echo -e " 10.)  Backup Data VPS"

echo -e " 11.)  Restore Data VPS"

echo -e " 12.)  Webmin Menu"

echo -e " 13.)  Limit Bandwith Speed Server"

echo -e " 14.)  Check Usage of VPS Ram"

echo -e " 15.)  Reboot VPS"

echo -e " 16.)  Speedtest VPS"

echo -e " 17.)  Information Display System"

echo -e " 18.)  Info Script Auto Install"

echo -e " 19.)  Restart All Service"

echo -e " 20.)  Set Auto Reboot"

echo -e " 21.)  Set Multi Login Akun"

echo -e ""
echo -e  " ${cyan}╠════════════════════════════════════════════════════════════╣${NC}"
echo -e  " ║                       ┃ DOMAIN MENU ┃                      ║" | lolcat 
echo -e  " ${cyan}╠════════════════════════════════════════════════════════════╝${NC}"

echo -e " 22.)  Wilcard Domain"

echo -e " 23.)  Status Tunneling"

echo -e " 24.)  Auto Pointing IP"

echo -e " 25.)  Informasi Sistem Port VPN"

echo -e  "  ╠═════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║   x.) Exit Menu .                                             ║" | lolcat
echo -e  "  ║     GANBATTEO ONIICAN, POWERED BY JAGOANNEON.                 ║" | lolcat
echo -e  "  ╚═════════════════════════════════════════════════════╝" | lolcat
echo -e ""

read -p "     Please Input Number  [1-31 or x] :  "  num

echo -e ""

case $num in

0)

trial-menu

;;

1)

tessh

;;

2)

wss

;;

3)

vls

;;

4)

trj

;;

5)

trjgo

;;

6)

addhost

;;

7)

certv2ray

;;

8)

changeport

;;

9)

autobackup

;;

10)

backup

;;

11)

restore

;;

12)

webmin

;;

13)

limitspeed

;;

14)

ram

;;

15)

reboot

;;

16)

speedtest

;;

17)

info

;;

18)

about

;;

19)

restart

;;

20)

reboot

;;

21)

autokill

;;

22)

wilcard

;;

23)

running

;;

24)

wget https://raw.githubusercontent.com/jagoanneon01/Jagoanneon/main/cf.sh && chmod +x cf.sh && ./cf.sh

;;

25)

nano log-install.txt

;;

99)

grpcc

;;

x)

exit

;;

*)

echo "Please enter an correct number"

;;

esac
