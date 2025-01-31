#!/bin/bash

lastHR=$(date --date="-1 day" +"%Y-%m-%d");
echo -e "\n --------------------------------------------------------------------------------------------------------------------------------------------- \n"
echo  "                           $lastHR                                           "
echo  "============================================================================="
echo  "                      adtracker.log logs"


set -x

fileName="adtracker.log.";
lastHR=$(date --date="-1 day" +"%Y-%m-%d");
server=`hostname -i`;
cd /opt/tomcat/logs


xz  --best -v --memlimit-compress=5% $fileName$lastHR

mv $fileName$lastHR.xz $fileName$lastHR-$server.xz
aws s3 cp $fileName$lastHR-$server.xz "s3://tracker-logs-uk/adtracker-log/"