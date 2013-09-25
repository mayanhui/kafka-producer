#!/bin/bash

KAFKA_PRODUCER_PNUM=`ps -ef |grep TPMain|grep java|wc -l`
if [ $KAFKA_PRODUCER_PNUM -lt 1 ];then
	/opt/modules/pegasus/kafka-producer-stop.sh
	/opt/modules/pegasus/kafka-producer-start.sh	
	echo "Recover kafka-producer! @"`date`
fi
