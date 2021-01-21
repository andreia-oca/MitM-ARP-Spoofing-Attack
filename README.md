# MiTM-ARP-Spoofing-Attack
MiTM ARP Spoofing Attack Project for Security Protocols Course

# Contents
- [How to run the attack](#how-to-run-the-attack)
- [Topology](#topology)
- [Implementation](#implementation)
- [Useful Links](#useful-links)
- [References](#references)

## How to run the attack
One way to demonstrate how one can do an ARP Cache Poisoning attack is
by creating a virtual network with Docker containers and use a tool called
arpspoof to forge ARP replies.

- Create a docker network to play the role of the LAN with `make create_network`
- Create two docker images that will play the role of a victim and an attacker.
- Start capturing the network traffic on the attacker interface using `tcpdump`.
- Use `arpspoof` as the attacker to intervene between the gateway and the victim.
- To check if the attack is taking place, list the ARP table on  the victim with `arp -a`. 
- It should have two IP entries with the same MAC address.
- Now all the traffic sent to/from the victim is routed through the atacker interface.
- Use `wireshark` to analyze the network packets captured with tcpdump and find sensitive data there.

## Topology
            Internet  
               |
            gateway
               |
attacker -- switch -- victim


## References
Article: [Man In The Middle Attack (MITM) Part 1 — ARP Spoofing](https://levelup.gitconnected.com/man-in-the-middle-attack-part-1-arp-spoofing-6f5b174dec59)
