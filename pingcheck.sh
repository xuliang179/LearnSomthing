
#!/bin/bash
#check the hosts alive or not
#version 1.0

show_help(){
        echo "Usage: ./pingcheck.sh iplist100|iplist116 "
        exit 1
}

[ $# -lt 1 ] && show_help

FILE=$1

while read -r line
do
   ping=`ping -c 1 $line| grep loss|awk '{print $6}' |awk -F % '{print $1}'`
   if [ $ping -eq 0 ];then
        echo "ping $line ok"
   else
        echo "ping $line failed"
   fi 
done < $FILE
