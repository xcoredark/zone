#!/bin/bash
# Script Installer Xray Only By Mardhex
# https://t.me/mardhex
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://${Server}/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
account default
host smtp.gmail.com
port 587
auth on
user indotunnel.org@gmail.com
from indotunnel.org@gmail.com
password gbreqryuucosliee
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://${Server}/autobackup.sh"
wget -O backup "https://${Server}/backup.sh"
wget -O restore "https://${Server}/restore.sh"

chmod +x autobackup
chmod +x backup
chmod +x restore
cd
rm -f /root/set-br.sh

