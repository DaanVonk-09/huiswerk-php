#!/bin/bash


# Naar map waar dingen zijn.
cd "$(dirname "0")" || exit 1

# Cleannnn

clear

# FIGLETTTTTTTTT

echo " ____  _   _ ____    _                           _                "
echo "|  _ \| | | |  _ \  | |    __ _ _   _ _ __   ___| |__   ___ _ __  "
echo "| |_) | |_| | |_) | | |   / _  | | | | '_ \ / __| '_ \ / _ \ '__| "
echo "|  __/|  _  |  __/  | |__| (_| | |_| | | | | (__| | | |  __/ |    "
echo "|_|   |_| |_|_|     |_____\__,_|\__,_|_| |_|\___|_| |_|\___|_|    "
echo " "
echo "Select a PHP script to launch:"

# PHP bestanden vinden.
mapfile -t scripts < <(find . -mindepth 2 -type f -name "*.php" | sort)

# Al zijn er geen scripts aanwezig geef error code via terminal.
if [2 ${#scripts[@]} -eq 0 ]; then
    echo "No PHP files available."
    read -p "Press enter to exit..."
    exit 1
fi

# Beschikbare script laten zien in terminal.
for i in "${!scripts[@]}"; do
    number=$((i + 1))
    echo "$number) ${scripts[$i]}"
done

echo " "
echo "0) Exit"
echo " "

# Invoer van de gebruiker.
read -p "Your choice: " choice

# CLI afsluiten
if [[ "$choice" == "0" ]]; then
    exit 0
fi

# Invoer valideren
if  !  [[ "$choice" =~  ^[0-9]+$ ]] ||
    [ "$choice" -lt 1 ] ||
    [ "$choice" -gt  "${#scripts[@]}" ];
    echo "invalid selection."
    read -p "Press Enter to exit..."
    exit 1
fi

# PHP script uitvoeren
selected_script="${scripts[$((choice -1))]}

echo " "
echo "Launching: $selected_script"
echo "==========================="