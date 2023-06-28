#!/bin/bash

if [[ "$1" == "--date" ]]; then
    current_date=$(date +"%Y-%m-%d")
    echo "Dzisiejsza data: $current_date"
elif [[ "$1" == "--logs" ]] then
    num_files=$2
    if [[ -z "$num_files" ]]; then
        num_files=100
    fi
    for ((i=1; i<=num_files; i++)); do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: skrypt.sh" >> "$filename"
        current_date=$(date +"%Y-%m-%d")
        echo "Data: $current_date" >> "$filename"
    done
fi