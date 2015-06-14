#!/bin/sh

raspivid -n -w 640 -h 480 -b 500000 -fps 30 -rot 270 -t 0 -o - | \
    gst-launch-1.0 -v fdsrc \
    ! h264parse \
    ! queue \
    ! rtph264pay config-interval=10 pt=96 \
    ! udpsink host=10.0.2.1 port=30000 \
