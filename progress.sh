#!/bin/bash
P=$(echo $(wc -l *.txt | tail -n1) $(wc -l instances.list| tr -d [:alpha:][:punct:][:blank:]) | awk '{print $1/$3*100;}')
while [ $(echo "$P < 95"|bc) -eq 1 ]; do 
  P=$(echo $(wc -l *.txt | tail -n1) $(wc -l instances.list| tr -d [:alpha:][:punct:][:blank:]) | awk '{printf "%2.2f", $1/$3*100;}')
  echo "$P%"
  wc -l *.txt
  echo -e "\033[6A\r"
  sleep 1
done
echo -e "\033[3B"
sh ~/push.sh "done" "curl list done"
