#!/usr/bin/env bash
set -euo pipefail

threshold="${1:-80}"
usage=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

echo "Root disk usage: ${usage}% (threshold: ${threshold}%)"

if [ "$usage" -ge "$threshold" ]; then
    echo "WARNING: usage is at or above the threshold" >&2
    exit 1
fi

echo "OK"
