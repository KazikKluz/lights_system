#!/bin/bash

br=broker.hivemq.com

mosquitto_sub -h $br -t /x00192532/lights/2 |
while read line
do 
    echo $line
done