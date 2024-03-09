#!/bin/bash

br=broker.hivemq.com
house_no=2

mosquitto_pub -h $br -t /x00192532/smart_lights/light/$house_no \
    -m "lights: $1 state at house $house_no"