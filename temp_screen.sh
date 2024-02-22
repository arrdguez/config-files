#!/bin/bash

echo "Hola"

current_time="$(date +'%k')"
nigth_cutoff="20"
mourning_cutoff="7"

temperature="4000"

echo ${current_time}
echo ${temperature}


while :; do
    sleep 900
    if [ "${current_time}" -ge "${nigth_cutoff}" ] || [ "${current_time}" -lt "${mourning_cutoff}" ]; then
        sct ${temperature}
    fi
done


