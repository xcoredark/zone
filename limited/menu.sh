#!/bin/bash
# Script Installer Xray Only By Mardhex
# https://t.me/mardhex
clear
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m            MANAGER XRAY           \E[0m"
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [\e[36m•01\e[0m] Add Vmess WS|GRPC|XTLS"
echo -e " [\e[36m•02\e[0m] Add Vless WS|GRPC|XTLS"
echo -e " [\e[36m•03\e[0m] Add Trojan WS|GRPC|XTLS"
echo -e " [\e[36m•04\e[0m] Add Sodosok WS|GRPC|XTLS"
echo -e " [\e[36m•05\e[0m] Delete User All Xray"
echo -e " [\e[36m•06\e[0m] Renew User All Xray"
echo -e " [\e[36m•07\e[0m] Cek User Login All Xray"
echo -e " [\e[36m•08\e[0m] Cek Data User All Xray"
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m            MANAGER VPS            \E[0m"
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [\e[36m•09\e[0m] Add New Domain"
echo -e " [\e[36m•10\e[0m] Auto Backup Data VPS"
echo -e " [\e[36m•11\e[0m] Backup Data VPS"
echo -e " [\e[36m•12\e[0m] Restore Data VPS"
echo -e " [\e[36m•13\e[0m] Renew Sertifikat Xray"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e  "Press x or [ Ctrl+C ] • To-Exit"
echo -e ""
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; addws;;
2) clear ; addvless ;;
3) clear ; addtr;;
4) clear ; addss ;;
5) clear ; del-user ;;
6) clear ; renew ;;
7) clear ; cek-user ;;
8) clear ; cek-usage ;;
9) clear ; add-host ;;
10) clear ; autobackup ;;
11) clear ; backup ;;
12) clear ; restore ;;
13) clear ; cert ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
