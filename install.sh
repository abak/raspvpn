#!/usr/bin/env sh

# install dependencies
# sudo apt-get install openvpn hostapd udhcpd

# get input
read -p "Enter SSID : " _ssid
read -p "Enter wpa key :" _wpa

# read -p "Enter VPN login : " vpn_username
# read -s -p "Enter VPN password : " vpn_password

# edit hostapd.conf with the SSID/WPA key

sed -i "s/<ssid>/$_ssid/g" etc/hostapd/hostapd.conf
sed -i "s/<wpa_key>/$_wpa/g" etc/hostapd/hostapd.conf

# copy files 
# sudo cp --parents etc/default/hostapd /
# sudo cp --parents etc/hostapd/hostapd.conf / 
# sudo cp --parents etc/iptables.nat.vpn.secure /

# edit hostapd.conf with the correct SSID/WPA key
