#!/bin/bash

sudo su
apt-get install openvpn
cp ca.crt dh2048.pem server.conf server.crt server.key /etc/openvpn
service openvpn restart
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.8.0.1/24 -o eth0 -j MASQUERADE
