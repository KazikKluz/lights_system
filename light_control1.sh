#!/bin/bash

br=broker.hivemq.com
state=OFF
house_no=1

mosquitto_sub -h $br -t /x00192532/smart_lights/lights_control/$house_no |
while read line; do
    action=$( echo $line | cut -d ' ' -f 2 )
    if [ $action = "ACTIVATE" ]; then
        state=ON
    elif [ $action = "DEACTIVATE" ]; then
        state=OFF
    else
        echo "error: unrecognized value"
    fi
    /bin/bash light_state1.sh $state
done