#!/bin/bash

# Prompt the user for the target IP address or hostname
echo -n "Enter the target IP or hostname: "
read target

# Get network policies and passwords
smbclient -L $target

# Get the number and identity of computers within a domain
nmblookup -A $target

# Get a list of shares across individual machines in the network
smbclient -L $target
