#!/bin/bash
# Script Installer Xray Only By Mardhex
# https://t.me/mardhex
domain=$(cat /root/domain)
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "\e[1;45mMENU PEMBUATAN AKUN XRAY/SHADOWSOCKS\e[0m"
		read -rp "Masukkan Nama User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Username Telah Digunakan, Silahkan Masukkan Username Lain"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
tls="443"
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ssws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "AES-128-GCM","ivCheck": false,"level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#ssgrpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "AES-128-GCM","ivCheck": false,"level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json

# JSON SS WS TLS
# buat json ss ws ke folder nginx
cat>/etc/FsidVPN/webserver/ssws-$user.txt<<EOF
{ 
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "aes-128-gcm",
            "password": "$uuid",
            "port": $tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "ISI_BUG"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}
EOF

# JSON SS WS GRPC
# buat file ss grpc di folder nginx
cat>/etc/FsidVPN/webserver/ssgun-$user.txt<<EOF
{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "aes-128-gcm",
            "password": "$uuid",
            "port": $tls
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "ISI_BUG"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}

}
EOF
systemctl restart xray
clear
echo -e ""
echo -e "====== XRAY/SHADOWSOCKS ======"
echo -e "Username: ${user}"
echo -e "Domain: ${domain}"
echo -e "Port TLS: ${tls}"
echo -e "ID: ${uuid}"
echo -e "Path WS: /ss-ws"
echo -e "Path gRPC: ss-grpc"
echo -e "Expired On     : $exp"
echo -e "=============================="
echo -e "Link SS WS: http://$domain:85/ssws-$user.txt"
echo -e "------------------------------"
echo -e "Link SS gRPC: http://$domain:85/ssgun-$user.txt"
echo -e "=============================="
echo -e "======Script Installer By Mardhex======"

