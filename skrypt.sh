#!/bin/bash

stworz_pliki() {
    local prefix=$1
    local num_files=$2

    if [[ -z "$num_files" ]]; then
        num_files=100
    fi
    for ((i=1; i<=num_files; i++)); do
        local filename="${prefix}${i}/${prefix}${i}.txt"
        mkdir -p "${prefix}${i}"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: skrypt.sh" >> "$filename"
        local current_date=$(date +"%Y-%m-%d")
        echo "Data: $current_date" >> "$filename"
    done
}

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    current_date=$(date +"%Y-%m-%d")
    echo "Dzisiejsza data: $current_date"
elif [[ "$1" == "--logs" || "$1" == "-l" ]] then
    stworz_pliki "log" "$2"
elif [[ "$1" == "--error" || "$1" == "-e" ]] then
    stworz_pliki "error" "$2"
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Dostępne opcje skryptu:"
    echo "--date, -d: Wyświetla dzisiejszą date."
    echo "--logs, -l <liczba>: Tworzy <liczba> folderów log<liczba> z plikiem log<liczba>.txt z informacjami."
    echo "--error, -e <liczba>: Tworzy <liczba> folderów error<liczba> z plikiem error<liczba>.txt z informacjami."
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