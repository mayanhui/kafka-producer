#!/bin/bash

PID=kafka-producer-tpmain.pid
COMMAND="kafka-producer"
LOGLOG=nohup.log

if [ -f $PID ]; then
  # kill -0 == see if the PID exists 
  if kill -0 `cat $PID` > /dev/null 2>&1; then
    echo -n stopping $command
    echo "`date` Terminating $command" >> $LOGLOG
    kill `cat $PID` > /dev/null 2>&1
    while kill -0 `cat $PID` > /dev/null 2>&1; do
      echo -n "."
      sleep 1;
    done
    rm $PID
    echo
  else
    retval=$?
    echo no $command to stop because kill -0 of pid `cat $PID` failed with status $retval
  fi
else
  echo no $command to stop because no pid file $PID
fi

