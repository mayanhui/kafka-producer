#!/bin/bash

PID=kafka-producer-tpmain.pid
LOGLOG=nohup.out
KAFKA_PRODUCER_NICENESS=0

JAVA_OPTS="-Xms2000M -Xmx4000M -server -XX:PermSize=256M -XX:MaxPermSize=512M -XX:+PrintGCDetails -Xloggc:/data1/logs/kafka-producer/kafka-producer-gc.log -XX:+DisableExplicitGC -XX:+UseParNewGC -XX:+UseConcMarkSweepGC "

if [ -f $PID ]; then
  if kill -0 `cat $PID` > /dev/null 2>&1; then
    echo $command running as process `cat $PID`.  Stop it first.
    exit 1
  fi
fi

echo "`ulimit -a`" >> $LOGLOG

nohup nice -n $KAFKA_PRODUCER_NICENESS java $JAVA_OPTS -cp /opt/modules/pegasus/kafka-producer-0.1.jar net.kafka.producer.tail.TPMain 2>&1 < /dev/null &

echo $! > $PID


