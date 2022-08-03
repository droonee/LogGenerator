#!/bin/bash

ip=(14.10.11.13{0..9})
status=("404" "200" "501" "503" "400" "202" "351")
method=("PUT" "GET" "POST" "PATCH" "DELETE")

for i in {1..600}
do
  for ((i=1; i<=$[($RANDOM % 20) + 1]; i++)) 
  do 

    rserv=$((RANDOM % 4))
    iserv=$((RANDOM % 10))
    sserv=$((RANDOM % 7))
    mserv=$((RANDOM % 5))
  
    echo "server$rserv - ${ip[$iserv]} - ${status[$sserv]} - ${method[$mserv]}" >> myfakedata.log
  done
  sleep 5
done

