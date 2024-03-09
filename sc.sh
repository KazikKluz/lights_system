#!bin/bash

sensor1=INACTIVE
lights1=OFF
sensor2=INACTIVE
lights2=OFF

live_feed(){
    /bin/bash feeder.sh $sensor1 $lights1 $sensor2 $lights2 
}

live_feed

br=broker.hivemq.com

mosquitto_sub -h $br -t /x00192532/smart_lights/# |
while read line
do
    source=$( echo $line | cut -d ':' -f 1)
    house_no=$( echo $line | cut -d ' ' -f 6 )
    state=$( echo $line | cut -d ' ' -f 2 )
    if [ $source = "movement_detector" ]; then
        if [ $house_no -eq 1 ]; then
            sensor1=$state
        elif [ $house_no -eq 2 ]; then
            sensor2=$state
        else
            mosquitto_pub -h $br -t /x00192532/smart_lights/system_control \
            -m "system_control: invalid house number"
        fi

        live_feed

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
    elif [ $source = "lights" ]; then
        if [ $house_no -eq 1 ]; then
            lights1=$state
        elif [ $house_no -eq 2 ]; then
            lights2=$state
        else
            mosquitto_pub -h $br -t /x00192532/smart_lights/system_control \
            -m "system_control: invalid house number"
        fi

        live_feed
    fi
done

# mosquitto_pub -h broker.hivemq.com \
#            -t /x00192532/smart_lights/movement_detection/house1 \
#           -m "movement_detector: ACTIVE proximity sensor house 1"

# mosquitto_pub -h $br -t /x00192532/smart_lights/light/$house_no \
#    -m "lights: $1 state at house $house_no"

# TODO make this connected to dashboard