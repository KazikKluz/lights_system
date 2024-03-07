#!/bin/sh
while true
do
    nowdate=$(date "+%Y-%m-%d %H:%M:%S")
    mosquitto_pub -h broker.hivemq.com  -t /x00192532/movement_detection/house1 -m "movement detected at house 1 $nowdate"
    sleep 6
done