#!/bin/bash

enp7s0_addr=`ifconfig enp7s0 | grep inet | head -n 1 | awk '{print $2}'`
wlp8s0_addr=`ifconfig wlp8s0 | grep inet | head -n 1 | awk '{print $2}'`
essid=`iwconfig wlp8s0 | grep ESSID | awk '{print $4}' | cut -d : -f 2`
public_ip=`~/.scripts/network/echo_pub_ip.sh`

printf "enp7s0: $enp7s0_addr\n"
printf "wlp8s0: $wlp8s0_addr\n"
printf "essid: $essid\n"
printf "public: $public_ip\n"
