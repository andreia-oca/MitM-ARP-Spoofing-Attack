FROM ubuntu:20.04
ARG VERSION=1

LABEL name="ARP Spoofing attack" \
	  version="${VERSION}"

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && \
	apt-get install -y iputils-ping net-tools iproute2 openssl wget \
	bsdmainutils git ssh vim dsniff sslstrip iptables curl

CMD echo "TODO"
