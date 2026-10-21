#!/usr/bin/env bash
set -euo pipefail

check_port() {
    local host="$1"
    local port="$2"
    if timeout 2 bash -c "exec 3<>/dev/tcp/${host}/${port}" 2>/dev/null; then
        echo "OPEN    ${host}:${port}"
    else
        echo "CLOSED  ${host}:${port}"
    fi
}

host="${1:-127.0.0.1}"
for port in 22 80 443; do
    check_port "$host" "$port"
done
