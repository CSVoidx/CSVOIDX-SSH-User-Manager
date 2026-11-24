#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "Please run with sudo."
    exit 1
fi

echo "CSVOIDX SSH User Manager"
echo "Checking system requirements..."

for cmd in useradd userdel passwd chage getent; do
    command -v "$cmd" >/dev/null || {
        echo "Missing dependency: $cmd"
        exit 1
    }
done

echo "System requirements: OK"
echo "SSH configuration unchanged."

install -d -m 755 /opt/csvoidx-user-manager
install -m 755 "$(dirname "$0")/manager.sh" /opt/csvoidx-user-manager/manager.sh
ln -sfn /opt/csvoidx-user-manager/manager.sh /usr/local/bin/csvoidx-user

echo "CSVOIDX Installation Successful"
echo "Run: csvoidx-user"
