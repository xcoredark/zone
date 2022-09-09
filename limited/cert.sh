#!/bin/bash
# Script Installer Xray Only By Mardhex
# https://t.me/mardhex
clear
echo -e "Renew Certificate Starting" 
sleep 0.5
systemctl stop nginx
echo "Cek Domain Lama"
clear
echo start
sleep 0.5
# // Renew Certificate Xray
domain="$(cat /root/domain)"
cd /root/
sudo /root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
sudo /root/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /data/xray.crt --keypath /data/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
