#!/bin/bash
file_usage_threshold=10
df -pH | grep -vE “Filesystem|none|tmpfs” | while read line 
do
  file_name=$(echo $line | awk '{ print $1}')
  file_usage=$(echo $line | awk '{ print $5 }' | sed '/s/%//g')
  echo "file system name: $file_name, file system usage: $file_usage"
  if [ $file_usage -gt $file_usage_threshold ]
  then
    echo "$file_name: $file_usage" >> file_system_info.txt
  fi
  count=$(cat file_system_info.txt | wc -l) #wc gives the number of lines in the file
  if [ $count -gt 0 ]
  then
    echo "Some file system has reached the threshold"
    echo -e "Subject:Alert\n\n $(cat file_system_info.txt)\n" | sendmail <emailID>
  fi
done
