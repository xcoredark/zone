#!/bin/bash
# Script Installer Xray Only By Mardhex
# https://t.me/mardhex
clear
echo "Checking VPS"
echo "Masukan Link Email Restore"
read -rp "Link File Restore: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup/xray
cp -r xray /usr/local/etc/xray
cp -r public_html /home/vps/
cp crontab /etc/
strt
rm -rf /root/backup/xray
rm -f backup.zip
echo Done
