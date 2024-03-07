#!/bin/bash

br=broker.hivemq.com

mosquitto_sub -h $br -t /x00192532/lights/+ |
while read line; do
    nowdate=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$nowdate $line" >> logs
    echo "$(tail -n 50 logs)"> logs 
done