#!/usr/bin/env bash

url="https://lichess.org"

for i in {1..5}; do
    http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    body=$(curl -s "$url")
    
    if [ "$http_code" -ge 100 ] && [ "$http_code" -lt 400 ]; then
        echo "Number of request: $i" >> log.txt
        echo "$http_code" >> log.txt
        echo "$body" >> log.txt
    else
        echo "Error $http_code" 
    fi
done
