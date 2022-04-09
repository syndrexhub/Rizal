#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /etc/xray
mkdir /var/lib/crot;
clear
echo "Masukkan Domain Anda, Jika Anda Tidak Memiliki Domain Klik Enter"
echo "Ketikkan Perintah newhost setelah proses instalasi Script Selesai"
read -p "Hostname / Domain: " host
echo "IP="$host >> /var/lib/crot/ipvps.conf
echo "$host" >> /etc/xray/domain
#install ssh ovpn
wget https://raw.githubusercontent.com/jagoanneon01/Rizal/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && sed -i -e 's/\r$//' ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/jagoanneon01/Rizal/main/backup/set-br.sh && chmod +x set-br.sh && sed -i -e 's/\r$//' set-br.sh && ./set-br.sh
#install xray
wget https://raw.githubusercontent.com/jagoanneon01/Rizal/main/xray/ins-xray.sh && chmod +x ins-xray.sh && sed -i -e 's/\r$//' ins-xray.sh && screen -S xray ./ins-xray.sh
# Websocket
wget https://raw.githubusercontent.com/jagoanneon01/Rizal/main/websocket/edu.sh && chmod +x edu.sh && sed -i -e 's/\r$//' edu.sh && ./edu.sh
# Ohp Server
wget https://raw.githubusercontent.com/jagoanneon01/Rizal/main/ohp/ohp.sh && chmod +x ohp.sh && sed -i -e 's/\r$//' ohp.sh && ./ohp.sh
# Install Slowdns Server
wget https://raw.githubusercontent.com/jagoanneon01/DNSKU/main/slowdnss/install-sldns && chmod +x install-sldns && sed -i -e 's/\r$//' install-sldns && bash install-sldns
# Informasi IP Saya dan Semua Port TCP UDP
#wget https://raw.githubusercontent.com/jagoanneon01/Rizal/main/ipsaya.sh && chmod +x ipsaya.sh && sed -i -e 's/\r$//' ipsaya.sh && ./ipsaya.sh
#
# install xray grpc
#wget https://raw.githubusercontent.com/jagoanneon01/Rizal/main/grpc/grpcku.sh && chmod +x grpcku.sh && sed -i -e 's/\r$//' grpcku.sh && screen -S grpc ./grpcku.sh
#

rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -f /root/install
rm -f /root/install-sldns
#rm -f /root/ipsaya
#rm -f /root/grpcku.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, 2253"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC        : 2053"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC        : 1443"  | tee -a log-install.txt
echo "   - CloudFront Websocket    : "  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - TrojanGo                : 2087"  | tee -a log-install.txt
echo "   - SLOWDNS OpenSSH         : 2253[OFF]"  | tee -a log-install.txt
echo "   - SLOWDNS Dropbear        : 1153[OFF]"  | tee -a log-install.txt
echo "   - SLOWDNS SSL/TLS         : 3353[OFF]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
