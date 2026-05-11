#!/usr/bin/env bash

url="https://lichess.org"
LOG_FILE="/app/log/log.txt"

for i in {1..5}; do
  response=$(curl -s -w "%{http_code}" "$url")
  http_code="${response: -3}"          
  body="${response%???}"        

  if [ "$http_code" -ge 100 ] && [ "$http_code" -lt 400 ]; then
        echo "Number of request: $i" >> "$LOG_FILE" 
        echo "$http_code" >> "$LOG_FILE" 
        echo "$body" >> "$LOG_FILE" 
    else
        echo "Error $http_code" 
    fi
done
