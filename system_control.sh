#!bin/bash

br=broker.hivemq.com

mosquitto_sub -h $br -t /x00192532/movement_detection/+ |
while read line
do 
    house_no=$( echo $line | cut -d ' ' -f 2 )
    state=$( echo $line | cut -d ' ' -f 1 )
    mosquitto_pub -h $br -t /x00192532/lights/$house_no -m "$house_no $state"
    echo $house_no $state
done

# while true
# if fs fs  random divisive by 4
# if on skip


# TODO make this connected to dashboard