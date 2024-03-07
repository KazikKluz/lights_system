#!/bin/sh
while true
do
    nowdate=$(date "+%Y-%m-%d %H:%M:%S")
    mosquitto_pub -h broker.hivemq.com  -t /x00192532/movement_detection/house2 -m "movement detected at house 2 $nowdate"
    sleep 5
done