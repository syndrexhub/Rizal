#!/bin/bash
# Jagoanneon
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
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
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
domain=$(cat /etc/xray/domain)
sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

read -rp "Masukkan Bug: " -e bug
IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl stop client-sldns
systemctl stop server-sldns
pkill sldns-server
pkill sldns-client
systemctl enable client-sldns
systemctl enable server-sldns
systemctl start client-sldns
systemctl start server-sldns
systemctl restart client-sldns
systemctl restart server-sldns
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "═══════════════════════" | lolcat
echo -e "Informasi SSH & OpenVPN Premium By $domain"
echo -e "═══════════════════════" | lolcat
echo -e "IP/Host             : $IP"
echo -e "Domain              : $domain"
echo -e "Username            : $Login"
echo -e "Password            : $Pass"
echo -e "═══════════════════════" | lolcat
echo -e "NS (SlowDNS)        : $sldomain"
echo -e "DNS PUBLIC KEY      : $slkey"
echo -e "=============Host============="
echo -e "Host Domain (SSH)   : $domain"
echo -e "CloudFront(AWS CDN) : $cdndomain"
echo -e "Host NS (SlowDNS)   : $sldomain"
echo -e "═══════════════════════" | lolcat
echo -e "SlowDNS             : ALL SSH Port"
echo -e "OpenSSH             : 22"
echo -e "Dropbear            : 443, 109, 143"
echo -e "SSL/TLS             :$ssl"
echo -e "Proxy Squid         :$sqd"
echo -e "═══════════════════════" | lolcat
echo -e "OHP SSH             : 8181"
echo -e "OHP Dropbear        : 8282"
echo -e "OHP OpenVPN         : 8383"
echo -e "═══════════════════════" | lolcat
echo -e "SSH Websocket SSL   : 443"
echo -e "SSH Websocket HTTP  : 8880"
echo -e "═══════════════════════" | lolcat
echo -e "OVPN Websocket      : 2086"
echo -e "OVPN Port TCP       : $ovpn"
echo -e "OVPN Port UDP       : $ovpn2"
echo -e "OVPN Port SSL       : 990"
echo -e "OVPN TCP            : http://$IP:89/tcp.ovpn"
echo -e "OVPN UDP            : http://$IP:89/udp.ovpn"
echo -e "OVPN SSL            : http://$IP:89/ssl.ovpn"
echo -e "BadVPN UDPGW        : 7100,7200,7300"
echo -e "═══════════════════════" | lolcat
echo -e "SNI SSL/TLS         : ${bug}"
echo -e "═══════════════════════" | lolcat
echo -e "PAYLOAD WS DB" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "PAYLOAD WS SSL" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "GET ${domain}://bug.com/ HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "Created             : $hariini"
echo -e "Expired             : $expi"
echo -e "═══════════════════════" | lolcat
echo -e "AutoScript By JAGOANNEON" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "~ Beli Dong Masa Engga Hehehe ~" | lolcat
echo -e "~ Garansi 30Hari ~" | lolcat
echo -e "~ Mulai Dari Tanggal Pembelian ~" | lolcat
echo -e "~ Terimakasih Selamat Menikmati ~" | lolcat
echo -e""
read -p "Ketik Enter Untuk Kembali Ke Menu...."
sleep 1
menu
exit 0
fi

