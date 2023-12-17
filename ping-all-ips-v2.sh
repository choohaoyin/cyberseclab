#!/bin/bash
ip_domains="200.200.51.0/24 200.201.51.0/24 200.99.51.0/24 200.20.51.1/24 200.21.55.1/24 200.30.54.1/24 200.31.57.1/24 10.10.51.0/30 10.10.51.4/30 10.10.51.8/30"

for ip_domain in $ip_domains; do
    ip_addresses=""
    total_addresses=""
    echo "Scanning ${ip_domain}..."
    ip_addresses=$(nmap -sn $ip_domain | grep "Nmap scan" | awk '{print $5}')
    total_addresses=$(echo "$ip_addresses" | wc -w)
    echo "Found ${total_addresses##*( )} IP address(es)"
    echo "-------"
    for ip in $ip_addresses; do
        ping -c 3 $ip
    done
    echo "===================================="
done