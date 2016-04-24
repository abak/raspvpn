#!/usr/bin/env sh

if [ $# -eq 0 ]; then
   echo "Usage : install.sh <path_to_openvpn_config_file>";
   exit;
fi

# install dependencies
# sudo apt-get install openvpn hostapd udhcpd

# get input
read -p "Enter SSID : " _ssid
read -s -p "Enter wpa key : " _wpa

read -p "\nEnter VPN login : " vpn_username
read -s -p "\nEnter VPN password : " vpn_password

# edit hostapd.conf with the SSID/WPA key

sed -i "s/<ssid>/$_ssid/g" etc/hostapd/hostapd.conf
sed -i "s/<wpa_key>/$_wpa/g" etc/hostapd/hostapd.conf

# create openvpn login file
echo $vpn_username >> etc/openvpn/openvpn.login
echo $vpn_password >> etc/openvpn/openvpn.login

# create new openvpn config file
cat $1 | sed -e "s@auth-user-pass@auth-user-pass /etc/openvpn/openvpn.login@" > etc/openvpn/configuration

# copy files 
# sudo cp --parents etc/default/hostapd /
# sudo cp --parents etc/hostapd/hostapd.conf / 
# sudo cp --parents etc/iptables.nat.vpn.secure /
# sudo cp --parents etc/openvpn/openvpn.login /

