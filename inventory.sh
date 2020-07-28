#!/bin/bash
Server_name=$(uname -n)
IP_address=$(ifconfig | grep inet | awk 'NR==5{print $2}')
OS_type=$(uname)
uptime=$(uptime | awk '{print $3}')
#Creating header in CSV
echo "S_NO,Server_name,IP_address,OS_type,Uptime" > server_info.CSV
echo "1,$Server_name,$IP_address,$OS_type,$uptime" >> server_info.csv