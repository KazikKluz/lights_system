#!/bin/bash

status1=false
status2=false

while true; do
    rand=$((1 + $RANDOM % 10))
    if [ $(( $rand % 4)) -eq 0 ]; then
        echo four
        if [ $status1 = false ]; then
            nowdate=$(date "+%Y-%m-%d %H:%M:%S")
            mosquitto_pub -h broker.hivemq.com  -t /x00192532/movement_detection/house1 -m "active 1 $nowdate"
            status1=true
        fi
    elif [ $(( $rand % 3)) -eq 0 ]; then
        echo three
        if [ $status2 = false ]; then
            echo $rand
            status2=true
        fi
    else
        echo $status1
        status1=false
        echo $status2
        status2=false
    fi
    sleep 1
done 