#!/bin/bash

# Check if subnet is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <subnet>"
    echo "Example: $0 192.168.1.0/24"
    exit 1
fi

SUBNET=$(echo $1 | cut -d'/' -f1 | cut -d'.' -f1-3)
LIVE_IPS="live_ips.txt"
PORT_SCAN_RESULTS="port_scan_results.txt"

# Step 1: Identify Live IPs
echo "[+] Scanning for live hosts in $SUBNET..."
> $LIVE_IPS  # Clear previous results

for i in {1..254}; do
    ping -c 1 -W 1 "$SUBNET.$i" &>/dev/null && echo "$SUBNET.$i" >> $LIVE_IPS &
done
wait

if [ ! -s "$LIVE_IPS" ]; then
    echo "[!] No live hosts found."
    exit 1
fi

echo "[+] Live IPs saved to $LIVE_IPS"

# Step 2: Full Port Scan Using Netcat (nc)
echo "[+] Starting full port scan..."
> $PORT_SCAN_RESULTS  # Clear previous results

for ip in $(cat $LIVE_IPS); do
    echo "[+] Scanning $ip for open ports..."
    for port in {1..65535}; do
        (echo >/dev/tcp/$ip/$port) 2>/dev/null && echo "[+] Open Port Found: $ip:$port" >> $PORT_SCAN_RESULTS &
    done
    wait
    echo "----------------------------------------" >> $PORT_SCAN_RESULTS
done

echo "[+] Scan complete. Results saved to $PORT_SCAN_RESULTS"
