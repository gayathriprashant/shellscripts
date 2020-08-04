#!/bin/bash
print_header() 
{
    printf "#%0.s" $(seq 1 $(tput cols))
    printf "\n"
}
center_msg() 
{
    msg=$1
    terminalcols=$(tput cols)
    msg_lens=$(echo ${#1})
    pre-space=$(($((terminalcols-msg_lens))/2))
    print_header
    printf "%0.s" $(seq 1 $pre_space)
    printf "%s" "$1"
    printf "\n"
    print_header
}
check_remotepass()
{
    if [ ! -e "remotepass" ]
    then
        center_msg "Please store your password in >>remotepass<< file and retry"
        exit 1
    fi
} 
check_remoteuser() 
{
    if [ ! -e "remoteuser" ]
    then
        center_msg "Please store your password in >>remoteuser<< file and retry"
        exit 2
    fi
}
check_list_of_servers()
{
    if [ ! -e "list_of_servers" ]
    then
        center_msg "Please store your password in >>list_of_servers<< file and retry"
        exit 3
    fi
}
center_msg "Welcome to connecting Multiple servers"
check_remotepass
check_remoteuser
check_list_of_servers
ssh_opt="sshpass -f remotepass ssh -n -o StictHostKeyChecking=No PubKeyAuthentication=No devops"
echo "Server_name,OS_TYPE,OS_VERSION,ARC_TYPE,CPU_TYPE" > server_info.csv 
while read server
do
    echo "working on $server"
    OS_TYPE=$($ssh_opt@$server "cat /etc/os-release" | grep -w "NAME" | awk -F "NAME=" '{ print $2 }' | tr '"' " " )
    echo "$OS_TYPE" | grep -i "ubuntu" 1>/dev/null 2>&1
    if [ $? -eq 0 ]
    then
       OS_VERSION=$($ssh_opt@$server "cat /etc/os-release" | grep "VERSION_ID" | awk -F "VERSION_ID=" '{ print $2}')
    else
       OS_VERSION=$($ssh_opt@$server "cat /etc/redhat-release" | awk -F "release" '{ print $2 }' | awk '{ print $1 }' 
    fi
    #ARC_TYPE  - uname -p
    #CPU_TYPE=$(cat proc/cpuinfo | grep "model name")
    echo "OS_TYPE=$OS_TYPE"
    echo "OS_VERSION=$OS_VERSION"
    echo "$server,$OS_TYPE,$OS_VERSION,$ARC_TYPE,$CPU_TYPE" >> server_info.csv
done < list_of_servers
center_msg "Thank you for using shell script"

