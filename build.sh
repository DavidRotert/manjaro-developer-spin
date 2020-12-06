#!/bin/bash

KERNEL=linux54
echo "Start build with $KERNEL ..."
buildiso -p manjaro-developer-spin-xfce-edition -k $KERNEL | tee build.log
