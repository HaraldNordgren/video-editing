    #!/bin/bash

    interval_millis=5000

    regex="Duration: ([0-9:.]+)"
    [[ $(ffmpeg -i $1 2>&1) =~ $regex ]]

    duration_millis=$(echo "${BASH_REMATCH[1]}" | \
        awk -F: '{ print 1000 * (($1 * 3600) + ($2 * 60) + $3) }')

    duration_counter=$interval_millis
    i=1

    while [[ $duration_counter -lt $duration_millis ]]; do
        inputs+=" -i $2"
        delay_params+="[$i]adelay=$duration_counter[del$i];"
        amix_params+="[del$i]"
        
        ((i++))
        ((duration_counter += $interval_millis))
    done

    ffmpeg -i $1 $inputs -filter_complex \
        "$delay_params[0]${amix_params}amix=inputs=$i:duration=first" \
        out.wav -y
