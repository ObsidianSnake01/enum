#!/bin/bash

# Function to prompt user for input
prompt_input() {
    read -p "$1" input
    echo "$input"
}

# Function to enumerate SNMP data
enumerate_snmp() {
    snmpwalk -v 2c -c public "$1" "$2"
}

# Prompt the user for the target IP address or hostname
target=$(prompt_input "Enter the target IP or hostname: ")

# Enumerate usernames
enumerate_snmp "$target" 1.3.6.1.4.1.77.1.2.25

# Enumerate group names
enumerate_snmp "$target" 1.3.6.1.4.1.77.1.2.3

# Enumerate passwords
enumerate_snmp "$target" 1.3.6.1.4.1.77.1.2.22

# Enumerate system names
enumerate_snmp "$target" 1.3.6.1.2.1.1.5.0

# Enumerate devices in the network
enumerate_snmp "$target" 1.3.6.1.2.1.4.22.1.2
