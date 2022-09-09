#!/bin/bash
# Script Installer Xray Only By Mardhex
# https://t.me/mardhex
clear
echo "Checking VPS"
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
echo " Silakan Masukan Email Aktif"
read -rp " Email: " -e email
sleep 1
echo Membuat Directory
mkdir /root/backup
sleep 1
echo Start Backup
clear
cp -r /usr/local/etc/xray backup/xray
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "The following is a link to your vps data backup file.

Your VPS IP $IP

$link

If you want to restore data, please enter the link above.

Thank You For Using Our Services.
@Copiright 2021 By MDX Stores" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo "Done"
echo "Please Check Your Email"
