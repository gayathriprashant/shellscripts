#!/bin/bash
<<mycom
date_array=($(date))
echo "${date_array[2]}"
mycom
<<mycom
echo -e "\033[92mHello World\033[0m"
echo -e "\033[31mHello World\033[0m"
echo -e "\033[91mHello World\033[0m"
echo -e "\033[102mHello World\033[0m"
echo -e "\033[100mHello World\033[0m"
echo -e "\033[101mHello World\033[0m"
echo -e "\033[150mHello World\033[0m"
mycom
