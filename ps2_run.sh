#!/bin/bash
status2=false

while true; do
    rand=$((1 + $RANDOM % 10))
    if [ $(( $rand % 3)) -eq 0 ]; then
        if [ $status2 = false ]; then
            nowdate=$(date "+%Y-%m-%d %H:%M:%S")
            mosquitto_pub -h broker.hivemq.com  -t /x00192532/movement_detection/house2 -m "active 2 $nowdate"
            status2=true
        fi
    else
        if [ $status2 = true ]; then
            nowdate=$(date "+%Y-%m-%d %H:%M:%S")
            mosquitto_pub -h broker.hivemq.com  -t /x00192532/movement_detection/house2 -m "inactive 2 $nowdate"
            status2=false
        fi
    fi
    sleep 3
done 