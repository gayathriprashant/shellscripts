i=1 
while true
do
    echo $i
    if [ $i -eq 20 ]
    then
        break
    fi
    i=$((i+1))
done