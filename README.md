# Rizal AutoScriptSSH
# Update dulu Bor

<img src="https://img.shields.io/badge/Update%20Upgrade-green"> 

```html
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot
```

# Buat Akses Root Di VPS /Root VPS
  <img src="https://img.shields.io/badge/Akses_Root%20VPS-green">
Untuk Mengizinkan Root Dan Ubah Password Login di VPS Google Cloud Platform, Aws, Dan Lain-lain

```html
wget -qO- -O vpsroot.sh https://raw.githubusercontent.com/jagoanneon01/Rizal/main/vpsroot.sh && bash vpsroot.sh
  ```

# Install Semua Layanan VPN /Install All VPN Service
  <img src="https://img.shields.io/badge/Install_Semua_Layanan_VPN%20Batch-green">

```html
rm -f setup.sh && apt update && apt upgrade -y && update-grub && sleep 2 && apt-get update -y && apt-get upgrade && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/jagoanneon01/Rizal/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```

### Fitur Script

• CEK SEMUA IP DAN PORT (Service ALL VPN)

• SSH & OpenVPN

• SSH Over DNS (SlowDNS)

• SSH Websocket (Cloudflare)

• OpenVPN Websocket (Cloudflare)

• SSLH

• SSH CloudFront Websocket (Aws CloudFront Only) [OFF]

• OHP SSH & OHP Dropbear & OHP OpenVPN (OPEN HTTP PUNCHER)

• XRAY VMESS 

• XRAY VLESS

• XRAY TROJAN

• XRAY VMESS GRPC

• XRAY VLESS GRPC

• SHADOWSOCKS

• SSR

• PPTP VPN

• L2TP VPN

• SSTP VPN

• WIREGUARD

• TROJAN GO

• Backup Data ALL Service

• Restore Data ALL Service

• Auto Fix

• Auto Update

### Os Supported

• Debian 10 & 9

• Ubuntu 18.04 & 20.04

# Service & Port

• SlowDNS                 : Port SSH

• OpenSSH                 : 22, 2253

• Dropbear                : 443, 109, 143, 1153

• Stunnel5                : 443, 445, 777

• OpenVPN                 : TCP 1194, UDP 2200, SSL 990

• Websocket SSH TLS       : 443

• Websocket SSH HTTP      : 8880

• Websocket OpenVPN       : 2086

• Squid Proxy             : 3128, 8080

• Badvpn                  : 7100, 7200, 7300

• Nginx                   : 89

• Wireguard               : 7070

• L2TP/IPSEC VPN          : 1701

• PPTP VPN                : 1732

• SSTP VPN                : 444

• Shadowsocks-R           : 1443-1543

• SS-OBFS TLS             : 2443-2543

• SS-OBFS HTTP            : 3443-3543

• XRAYS Vmess TLS         : 8443

• XRAYS Vmess None TLS    : 80

• XRAYS Vless TLS         : 8443

• XRAYS Vless None TLS    : 80

• XRAYS Trojan            : 2083

• XRAYS Vmess GRPC TLS    : 1180,3380

• XRAYS Vless GRPC TLS    : 2280,4480

• OHP SSH                 : 8181

• OHP Dropbear            : 8282

• OHP OpenVPN             : 8383

• Trojan Go               : 2087

• CloudFront Websocket    : [OFF]


 ### Server Information & Other Features

• Timezone                : Asia/Jakarta (GMT +7)

• Fail2Ban                : [ON]

• Dflate                  : [ON]

• IPtables                : [ON]

• Auto-Reboot             : [ON]

• IPv6                    : [OFF]

• Autoreboot On 05.00 GMT +7

• Autoreboot On 00.00 GMT +7

• Autoreboot On 12.00 GMT +7

• Autoreboot On 18.00 GMT +7

• Auto Delete Expired Account

• Full Orders For Various Services

• White Label

• Auto Fix

• Auto update
