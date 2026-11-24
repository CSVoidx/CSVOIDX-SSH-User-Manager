#!/usr/bin/env bash

while true; do
    clear
    printf '\033[1;36m'
    echo "========================================"
    echo "       CSVOIDX SSH USER MANAGER"
    echo "                V1.0"
    echo "========================================"
    printf '\033[0m'

    echo " [01] System Information"
    echo " [02] Local User List"
    echo " [03] SSH Service Status"
    echo " [00] Exit"
    echo "----------------------------------------"

    read -rp "Select Option: " option

    case "$option" in
        1) hostnamectl ;;
        2) getent passwd | awk -F: '$3 >= 1000 && $3 < 60000 {print $1}' ;;
        3) systemctl status ssh --no-pager ;;
        0|00) exit 0 ;;
        *) echo "Invalid option" ;;
    esac

    read -rp "Press Enter to continue..."
done
