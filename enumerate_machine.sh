#!/bin/bash

# This script enumerates a Linux machine

# Get the hostname
HOSTNAME=$(hostname)
echo "Hostname: $HOSTNAME"

# Get the OS version
OS=$(lsb_release -d | cut -f2)
echo "Operating System: $OS"

# Get the kernel version
KERNEL=$(uname -r)
echo "Kernel Version: $KERNEL"

# Get the uptime
UPTIME=$(uptime -p)
echo "Uptime: $UPTIME"

# Get the list of users
USERS=$(cut -d: -f1 /etc/passwd)
echo "Users: $USERS"

# Get the CPU information
CPU=$(lscpu | grep "Model name" | cut -f2 -d:)
echo "CPU: $CPU"

# Get the memory information
MEMORY=$(free -m | grep "Mem" | awk '{print $2}')
echo "Memory: $MEMORY MB"

# Get the list of installed packages
PACKAGES=$(dpkg --list | grep -v "ii  " | wc -l)
echo "Installed Packages: $PACKAGES"

# Get the list of mounted filesystems
FILESYSTEMS=$(df -h | grep -v "Filesystem" | awk '{print $1}')
echo "Mounted Filesystems: $FILESYSTEMS"

# Get the kernel version
kernel=$(uname -r)
echo "Kernel: $kernel"

# Get a list of installed packages
echo "Installed packages:"
dpkg-query -l

# Get a list of users on the machine
echo "Users:"
cat /etc/passwd | cut -d: -f1

# Get a list of open ports
echo "Open ports:"
netstat -tulpn

# Get the Linux distribution and version
distro=$(lsb_release -d | cut -d: -f2 | awk '{print $1}')
version=$(lsb_release -d | cut -d: -f2 | awk '{print $2}')
echo "Distribution: $distro $version"

# Get IP routing tables
ip route

# Get hostname
hostname

# Get DNS details
cat /etc/resolv.conf

# Get SNMP information
snmpget -v 2c -c public localhost .1.3.6.1.2.1.1.5.0

# Get users on database records
mysql -u username -p password -e "SELECT User FROM mysql.user"

# Get network services and shares
smbclient -L localhost

echo "Done!"
