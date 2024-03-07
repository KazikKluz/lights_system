#!bin/bash

br=broker.hivemq.com

mosquitto_sub -h $br -t /x00192532/smart_lights/movement_detection/+ |
while read line
do 
    house_no=$( echo $line | cut -d ' ' -f 5 )
    state=$( echo $line | cut -d ' ' -f 1 )
    if [ $state = "active" ]; then
        echo "line 11"
        mosquitto_pub -h $br -t /x00192532/smart_lights/lights_control/$house \
        -m "activate lights at house $house_no"
    elif [ $state = "inactive" ]; then
        mosquitto_pub -h $br -t /x00192532/smart_lights/lights_control/$house \
        -m "activate lights at house $house_no"
    else
        mosquitto_pub -h $br -t /x00192532/smart_lights/lights_control/ \
        -m "unrecognized message: $state $house_no"
    fi
    echo "line 20 $state"
done

# while true
# if fs fs  random divisive by 4
# if on skip


# TODO make this connected to dashboard