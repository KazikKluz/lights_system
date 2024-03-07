#!/bin/bash

status1=false

while true; do
    rand=$((1 + $RANDOM % 10))
    if [ $(( $rand % 4)) -eq 0 ]; then
        if [ $status1 = false ]; then
            nowdate=$(date "+%Y-%m-%d %H:%M:%S")
            mosquitto_pub -h broker.hivemq.com  -t /x00192532/movement_detection/house1 -m "active 1 $nowdate"
            status1=true
        fi
    else
        if [ $status1 = true ]; then
            nowdate=$(date "+%Y-%m-%d %H:%M:%S")
            mosquitto_pub -h broker.hivemq.com  -t /x00192532/movement_detection/house1 -m "inactive 1 $nowdate"
            status1=false
        fi
    fi
    sleep 3
done