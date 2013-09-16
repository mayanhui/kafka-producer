#!/bin/bash

PID=kafka-producer-tpmain.pid

PROCESS_ID=`cat $PID`
KAFKA_PRODUCER_NUM=`ps -ef |grep $PROCESS_ID|wc -l`
#echo $KAFKA_PRODUCER_NUM
if [ $KAFKA_PRODUCER_NUM -lt 2 ];then
#   kill $PROCESS_ID
#    echo 'bingo'
	/opt/modules/pegasus/kafka-producer-start.sh
	echo "Kafka producer recover"
fi
