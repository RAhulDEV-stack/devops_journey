#!/usr/bin/env bash
set -euo pipefail

echo "Host: $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo 
echo "== Disk (/) =="
df -h /
echo 
echo "== Memory =="
free -h 
echo
echo "== listening sockets =="
count=$(ss -tuln | awk 'NR>1 {print $5}' | wc -l)
echo "Total: $count"
ss -tuln
