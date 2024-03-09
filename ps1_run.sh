#!/bin/bash

status1=false

while true; do
    rand=$((1 + $RANDOM % 10))
    if [ $(( $rand % 4 )) -eq 0 ]; then
        if [ $status1 = false ]; then
            mosquitto_pub -h broker.hivemq.com \
            -t /x00192532/smart_lights/movement_detection/house1 \
            -m "movement_detector: ACTIVE proximity sensor house 1"
            status1=true
        fi
    else
        if [ $status1 = true ]; then
            mosquitto_pub -h broker.hivemq.com \
            -t /x00192532/smart_lights/movement_detection/house1 \
            -m "movement_detector: INACTIVE proximity sensor house 1"
            status1=false
        fi
    fi
    sleep 5
done