#!/bin/bash

# tries to kill process with highest CPU load
# (if it isn't Xorg)

sleep 1 # wait a few seconds (just as a precaution)

TOPPROCESS=$(top -b -n 1 | sed 1,6d | sed -n 2p)
TOPPID=$(echo "$TOPPROCESS" | awk '{print $1}')
TOPNAME=$(echo "$TOPPROCESS" | awk '{print $12}')

if [ "$TOPNAME" != "Xorg" ]
  then
      kill -9 $TOPPID
  else
      echo "CPU load caused by Xorg. Exiting."
      exit 1
fi

exit 0
