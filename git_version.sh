#!/bin/bash
which git &> /dev/null
if [ $? -ne 0 ]
then
   echo "Please install wget and retry"
   exit 1
fi
if [ -e "index.html" ]
then
    echo "Removing old index.html"
    rm -rf index.html
fi
url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
wget $url
if [ $? -ne 0 ]
then
   echo "Unable to install wget"
   exit 2
fi

#declare -a git_vers_arr
while read line
do
   # echo $line
   #git_vers_arr=$(echo command)
   echo $line | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p'|awk -F '"' '{ print $2 }'|cut -c 5- | awk -F '.tar.gz' '{ print $1}'
done < index.html
<<mycom
echo "The all git versions are:"
cnt=0
WIDTH=20
no_vers=${#git_vers_arr[*]}
for each in ${git_vers_arr[*]}
do
   #echo -e "\t\t ${git_vers_arr[cnt] \\t ${git_vers_arr[$((cnt+1))] \\t ${git_vers_arr[$((cnt+2))]}"
   printf "%-*s %-*s %-*s\n" $WIDTH ${git_vers_arr[cnt] $WIDTH ${git_vers_arr[$((cnt+1))] $WIDTH ${git_vers_arr[$((cnt+2))]}
   cnt=$((cnt+3))
   if [$cnt -ge no_vers]
   then
     break
   fi
done
mycom
