#!bin/bash

br=broker.hivemq.com

mosquitto_sub -h $br -t /x00192532/smart_lights/movement_detection/+ |
while read line
do 
    house_no=$( echo $line | cut -d ' ' -f 6 )
    state=$( echo $line | cut -d ' ' -f 2 )
    if [ $state = "ACTIVE" ]; then
        mosquitto_pub -h $br -t /x00192532/smart_lights/lights_control/$house_no \
        -m "system_control: ACTIVATE lights at house $house_no"
    elif [ $state = "INACTIVE" ]; then
        mosquitto_pub -h $br -t /x00192532/smart_lights/lights_control/$house_no \
        -m "system_control: DEACTIVATE lights at house $house_no"
    else
        mosquitto_pub -h $br -t /x00192532/smart_lights/lights_control/ \
        -m "unrecognized message: $state $house_no"
    fi
done

# mosquitto_pub -h broker.hivemq.com \
#            -t /x00192532/smart_lights/movement_detection/house1 \
#           -m "movement_detector: ACTIVE proximity sensor house 1"

# mosquitto_pub -h $br -t /x00192532/smart_lights/light/$house_no \
#    -m "lights: $1 state at house $house_no"

# TODO make this connected to dashboard