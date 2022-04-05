#!/bin/bash
# AutoScriptSSH By JAGOANNEON
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Izin Akses
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
sleep 1
echo "Cek Izin Akses Script"
IZIN=$( curl http://akses.jagoanneon-premium.xyz:81/akses | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${GREEN}Akses Di Izinkan...${NC}"
else
echo -e "${RED}VPS tidak diijinkan${NC}";
echo "Kontak Admin Untuk Mendapatkan Akses Script"
echo "Facebook   : Generasi Ronggolawe Tuban"
echo "WhatsApp   : 083857684916"
exit 0
fi
clear
echo -e ""
echo -e "════════════════════════════" | lolcat
echo -e ""
echo -e "[1]. Change Port OpenVPN"
echo -e "═════════════════" | lolcat
echo -e "[2]. Change Port Vmess + Vless"
echo -e "═════════════════" | lolcat
echo -e "[3]. Change Port Trojan"
echo -e "═════════════════" | lolcat
echo -e "[4]. Change Port Squid"
echo -e "═════════════════" | lolcat
echo -e "[5]. Change Port SSH WS HTTP"
echo -e "═════════════════" | lolcat
echo -e "[6]. Change Port SSH WS TLS / SSL"
echo -e "═════════════════" | lolcat
echo -e "[0]. Exit"
echo -e ""
echo -e "════════════════════════════" | lolcat
echo -e ""
read -p "Select From Options [ 1-7 ] : " port
echo -e ""
case $port in
1)
portovpn
;;
2)
portvlm
;;
3)
porttrojan
;;
4)
portsquid
;;
5)
portsshnontls
;;
6)
portsshws
;;
0)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
