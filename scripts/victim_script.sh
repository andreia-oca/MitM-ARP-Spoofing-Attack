#!/bin/bash

ping -c 1 8.8.8.8
sleep 2

# Verify that ARP Spoofing is happening
arp -a

# Post sensitive data
curl -u andreia:parola http://bio.acousti.ca/
