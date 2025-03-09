#!/bin/bash

# Check if the subnet is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <subnet>"
    echo "Example: $0 192.168.1.0/24"
    exit 1
fi

SUBNET=$1
LIVE_IPS="live_ips.txt"
PORT_SCAN_RESULTS="port_scan_results.txt"

# Step 1: Identify Live IPs
echo "[+] Scanning for live hosts in $SUBNET..."
nmap -sn $SUBNET | grep "Nmap scan report" | awk '{print $NF}' > $LIVE_IPS

if [ ! -s "$LIVE_IPS" ]; then
    echo "[!] No live hosts found."
    exit 1
fi

echo "[+] Live IPs saved to $LIVE_IPS"

# Step 2: Perform a Full Port Scan on Each Live IP
echo "[+] Starting full port scan..."
> $PORT_SCAN_RESULTS  # Clear previous results

while IFS= read -r ip; do
    echo "[+] Scanning $ip for open ports..."
    nmap -p- -T4 -A $ip >> $PORT_SCAN_RESULTS
    echo "----------------------------------------" >> $PORT_SCAN_RESULTS
done < $LIVE_IPS

echo "[+] Scan complete. Results saved to $PORT_SCAN_RESULTS"
