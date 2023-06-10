#!/bin/sh

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

list=$(xsetwacom list devices)
pad=$(echo "${list}" | awk '/pad/{print $7}')
stylus=$(echo "${list}" | xsetwacom list devices | awk '/stylus/{print $7}')

if [ -z "${pad}" ]; then
    exit 0
fi

xsetwacom set ${stylus} MapToOutput eDP
xsetwacom set ${stylus} Button 2 "key p"
xsetwacom set ${stylus} Button 3 "key e"
xsetwacom set ${pad} Button 1 "key +ctrl z -ctrl"
xsetwacom set ${pad} Button 2 "key +ctrl y -ctrl"
xsetwacom set ${pad} Button 3 "key +super h -super"
xsetwacom set ${pad} Button 8 "key +super l -super"
