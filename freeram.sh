#!/bin/bash
<<mycom
free -m | awk 'NR==2{print $4,"MB(MegaBytes)"}'
mycom
<<mycom
To_email="emailID"
free_ram=$(free -mt | grep Total: | awk '{print $4}')
if [ free_ram -le 700 ]
then 
    echo "sending email: $To_email"
if
mycom

for a in 10 20 30 40 50 60
do
    if [ $a -eq 40 ]
    then
        continue
    fi
    echo $a
done