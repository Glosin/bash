#!/bin/bash

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    current_date=$(date +"%Y-%m-%d")
    echo "Dzisiejsza data: $current_date"
elif [[ "$1" == "--logs" || "$1" == "-l" ]] then
    num_files=$2
    if [[ -z "$num_files" ]]; then
        num_files=100
    fi
    for ((i=1; i<=num_files; i++)); do
        filename="log${i}/log${i}.txt"
        mkdir -p "log${i}"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: skrypt.sh" >> "$filename"
        current_date=$(date +"%Y-%m-%d")
        echo "Data: $current_date" >> "$filename"
    done
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Dostępne opcje skryptu:"
    echo "--date, -d: Wyświetla dzisiejszą date."
    echo "--logs, -l <liczba>: Tworzy <liczba> plików logx.txt z informacjami."
    echo "--help, -h: Wyświetla dostępne opcje skryptu."
    exit 0
elif [[ "$1" == "--init" || "$1" == "-i" ]]; then
    git clone https://github.com/Glosin/bash.git skrypt
    repo_path=$(pwd)/skrypt
    if [[ ":$PATH:" != *":$repo_path:"* ]]; then
        echo "Dodawanie ścieżki repozytorium do zmiennej środowiskowej PATH"
        echo "export PATH=\"\$PATH:$repo_path\"" >> ~/.bashrc
        source ~/.bashrc
    fi

    echo "Repozytorium zostało sklonowane, a ścieżka została dodana do zmiennej środowiskowej PATH."
    exit 0
fi