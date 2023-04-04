#!/bin/bash
DATE=`date +%Y-%m-%d`
METADATA=`curl http://169.254.170.2/v2/metadata`
TASK=`echo $METADATA | jq -r '.TaskARN'`
echo $TASK
ID=`echo ${TASK##*/} | tr -d '"' | tr -d ','`
echo $ID
FAMILY=`echo $METADATA | jq -r '.Family'`
echo $FAMILY

aws s3 cp "/opt/apt/jvm/log/crash.log" s3://${ENVIRONMENT}-apt-01-jvm-log-${AWS_REGION}/pfs/$DATE/$FAMILY/$ID/crash.log
aws s3 cp "/opt/apt/jvm/log/heap-dump.hprof" s3://${ENVIRONMENT}-apt-01-jvm-log-${AWS_REGION}/pfs/$DATE/$FAMILY/$ID/heap-dump.hprof
aws s3 cp "/opt/apt/pfs/core.*" s3://${ENVIRONMENT}-apt-01-jvm-log-${AWS_REGION}/pfs/$DATE/$FAMILY/$ID/core-$TIME
