#!/bin/sh

# This script returns the IP address of a VM instance by its name
# defined in libvirt. The scripts accepts a parameter specifying the
# VM instance name.

if [ $# -ne 1 ]
then
    echo "You must specify one argument - the libvirt name of a VM instance"
    exit 1
fi

nmap -sT -PN -T5 -p22 192.168.0.0/24 > /dev/null 2>&1
ip neighbour | grep `virsh dumpxml $1 | grep "mac address" | cut -d \' -f2` |cut -d ' ' -f1
