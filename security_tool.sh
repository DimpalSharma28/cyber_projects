#!/bin/bash

# ===== Colors =====
GREEN="\e[32m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"

# ===== Banner =====
banner() {
clear
echo -e "${BLUE}"
echo "=================================="
echo "     MINI SECURITY TOOL"
echo "     Author : Kali User"
echo "=================================="
echo -e "${RESET}"
}

# ===== Menu =====
menu() {
echo "1) System Information"
echo "2) Check SSH Status"
echo "3) File Integrity Check"
echo "4) Running Processes"
echo "5) Exit"
echo
read -p "Choose an option: " choice
}

# ===== Functions =====
system_info() {
echo -e "${GREEN}System Information:${RESET}"
uname -a
free -h
df -h /
}

ssh_status() {
echo -e "${GREEN}SSH Status:${RESET}"
systemctl status ssh | head -10
}

file_integrity() {
FILE="/etc/passwd"
echo -e "${GREEN}Checking file integrity for $FILE${RESET}"
sha256sum $FILE
}

processes() {
echo -e "${GREEN}Top Running Processes:${RESET}"
ps aux | head -10
}

# ===== Main Loop =====
while true; do
banner
menu

case $choice in
    1) system_info ;;
    2) ssh_status ;;
    3) file_integrity ;;
    4) processes ;;
    5) echo "Exiting tool..."; exit ;;
    *) echo -e "${RED}Invalid option!${RESET}" ;;
esac

echo
read -p "Press Enter to continue..."
done