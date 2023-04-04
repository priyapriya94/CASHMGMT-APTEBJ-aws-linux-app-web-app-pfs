#!/bin/bash
mkdir -p /opt/apt/pfs /var/log/pfs /opt/apt/jvm/log
cp -r /tmp/upload/application.yaml /tmp/upload/redisson.yaml /tmp/upload/logback.xml /tmp/upload/apt-pfs.conf /tmp/upload/s3upload.sh /opt/apt/pfs/
chown -R apt:root /var/log/pfs
chmod -R 770 /var/log/pfs /opt/apt/jvm
chown -R apt:apt /opt/apt/pfs /opt/apt/jvm
chmod -R 700 /opt/apt/pfs
chmod 755 /opt/apt/pfs/apt-pfs.jar
chmod +x /opt/apt/pfs/s3upload.sh
