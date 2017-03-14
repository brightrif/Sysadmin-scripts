#!/bin/bash

# Test an IP address for validity:
# Usage:
#      [script name] IP_ADDRESS
#Author: Bright Antony (brightantony.g@gmail.com)

#check user enter veriable or not.
if (( $# < 1 )); then
        echo "Enter the ip address to be verify"
        exit 0
fi

#the function to check the Ip is vaild?
function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi

    return $stat
}
host=$1

valid_ip $host

if [[ $? -ne 0 ]];then
  echo "Invalid IP Address ($host)"
else
  echo "$host is correct IP Address"
fi
