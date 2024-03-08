#!/bin/bash

br=broker.hivemq.com

mosquitto_sub -h $br -t /x00192532/smart_lights/# |
while read line; do
    nowdate=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$nowdate $line" >> system.log
    echo "$( tail -n 50 system.log )"> system.log
done