#!/usr/bin/env bash

url="https://lichess.org"

for i in {1..5}; do
  response=$(curl -s -w "%{http_code}" "$url")
  http_code="${response: -3}"          
  body="${response%???}"        
    
    if [ "$http_code" -ge 100 ] && [ "$http_code" -lt 400 ]; then
        echo "Number of request: $i" >> ../log/log.txt
        echo "$http_code" >> ../log/log.txt
        echo "$body" >> ../log/log.txt
    else
        echo "Error $http_code" 
    fi
done
