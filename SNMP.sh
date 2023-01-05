#!/bin/bash

# Prompt the user for the target IP address or hostname
echo -n "Enter the target IP or hostname: "
read target

# Enumerate usernames
snmpwalk -v 2c -c public $target 1.3.6.1.4.1.77.1.2.25

# Enumerate group names
snmpwalk -v 2c -c public $target 1.3.6.1.4.1.77.1.2.3

# Enumerate passwords
snmpwalk -v 2c -c public $target 1.3.6.1.4.1.77.1.2.22

# Enumerate system names
snmpwalk -v 2c -c public $target 1.3.6.1.2.1.1.5.0

# Enumerate devices in the network
snmpwalk -v 2c -c public $target 1.3.6.1.2.1.4.22.1.2
