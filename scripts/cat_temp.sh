#!/bin/bash

while true; do
    cat /sys/class/thermal/thermal_zone0/temp >> log.txt
    echo "----" >> log.txt # 可以添加一个分割线来区分每次的记录
    sleep 2 # 暂停2秒
done