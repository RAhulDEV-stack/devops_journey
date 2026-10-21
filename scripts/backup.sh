#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <folder>" >&2
    exit 1
fi

src="$1"

if [ ! -d "$src" ]; then
    echo "Error: '$src' is not a directory" >&2
    exit 1
fi

name="$(basename "$src")"
timestamp="$(date +%Y%m%d-%H%M)"
backup_dir="$HOME/backups"
mkdir -p "$backup_dir"
archive="$backup_dir/$name-$timestamp.tar.gz"

tar -czf "$archive" -C "$(dirname "$src")" "$name"

size="$(du -h "$archive" | cut -f1)"
echo "Backup created: $archive ($size)"
