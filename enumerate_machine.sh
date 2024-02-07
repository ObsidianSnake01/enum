#!/bin/bash

# This script provides system information for a Linux machine

# Function to display section headers
print_header() {
    echo "----------------------------------------------"
    echo "$1"
    echo "----------------------------------------------"
}

# Get the hostname
HOSTNAME=$(hostname)
print_header "Hostname"
echo "$HOSTNAME"

# Get the OS version
OS=$(lsb_release -ds)
print_header "Operating System"
echo "$OS"

# Get the kernel version
KERNEL=$(uname -r)
print_header "Kernel Version"
echo "$KERNEL"

# Get the uptime
UPTIME=$(uptime -p)
print_header "Uptime"
echo "$UPTIME"

# Get the list of users
print_header "Users"
cut -d: -f1 /etc/passwd

# Get the CPU information
CPU=$(lscpu | awk '/Model name/ {print $3 " " $4 " " $5}')
print_header "CPU"
echo "$CPU"

# Get the memory information
MEMORY=$(free -m | awk '/Mem:/ {print $2}')
print_header "Memory"
echo "$MEMORY MB"

# Get the list of installed packages
PACKAGES=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
print_header "Installed Packages"
echo "$PACKAGES"

# Get the list of mounted filesystems
print_header "Mounted Filesystems"
df -h | awk 'NR>1 {print $1}'

# Get a list of open ports
print_header "Open Ports"
netstat -tuln

# Get the Linux distribution and version
print_header "Distribution and Version"
lsb_release -a

# Get IP routing tables
print_header "IP Routing Tables"
ip route

# Get DNS details
print_header "DNS Details"
cat /etc/resolv.conf

# Get SNMP information
print_header "SNMP Information"
snmpget -v 2c -c public localhost .1.3.6.1.2.1.1.5.0

# Get users on database records (assuming MySQL)
print_header "MySQL Users"
mysql -u username -p password -e "SELECT User FROM mysql.user"

# Get network services and shares (assuming Samba)
print_header "Samba Services and Shares"
smbclient -L localhost

echo "Done!"
