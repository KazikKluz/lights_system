#!bin/bash

br=broker.hivemq.com

mosquitto_sub -h $br -t /x00192532/movement_detection/+ |
while read line
do 
    house_no=$( echo $line | cut -d ' ' -f 5 ) 
    mosquitto_pub -h $br -t /x00192532/lights/$house_no -m ON
done

# while true
# if fs fs  random divisive by 4
# if on skip


# TODO make this connected to dashboard