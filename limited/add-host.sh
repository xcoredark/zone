#!/bin/bash

read -p "Masukan Domain Baru : " domainbaru

#Validate
if [[ $domainbaru == "" ]]; then
echo "Silakan Masukan Domain Anda"
exit 1
fi

#Input To Domain
cat > /root/domain << END
$domainbaru
END

clear 
echo "Sukses Menambahkan Domain"
